#include <macro.h>
/*
	File:fn_lockpickHouse.sqf
	Author: Wolfgang Bahmüller
	
	Description:
    Lockpick an Lockpick = boring...
	
*/
if (isnil ("avanix_player_rob_is_running")) then {avanix_player_rob_is_running=0;};
private["_num_doors","_door_pos_in_house","_door_pos_world","_near_door_found","_house","_success","_inventory","_alarmsystems","_progress_text","_ui","_progress","_pgText","_cP","_displayName","_distance","_badDistance","_var_crowbar","_value_crowbar","_var_burglartool","_value_burglartool","_tool_type","_dice","_unlock_chance","_alarm_chance","_numDoors","_owner"];
_house = cursorTarget;
if(isNull _house) exitwith {};

_num_doors = 0;
while {true} do
{
	if(!isClass(configfile>> "CfgVehicles" >> typeof _house >> "AnimationSources" >> format["Door_%1_source", _num_doors+1])) exitWith {};
	_num_doors = _num_doors + 1;
};

if(_num_doors <= 0) exitWith {hint "Dieses Haus hat keine Türen";};

_near_door_found = false;
for "_i" from 1 to _num_doors do
{
	_door_pos_in_house = _house selectionposition format["Door_%1_trigger", _i];
	_door_pos_world = _house modelToWorld _door_pos_in_house;
	if((_door_pos_world distance player) <= 2) exitWith {_near_door_found = true;}; 
};

if(!_near_door_found) exitWith {hint "Du bist zu weit von einer Tür entfernt";};
if(avanix_player_rob_is_running == 1) exitWith {hint "du hast doch gerade erst in ein Haus eingebrochen.";};

_alarmsystems = [_house] call avanix_fnc_getAlarmsystems;
_inventory = _house getVariable ["avanix_inventory", []];
_var_burglartool = ["burglartool",0] call avanix_fnc_varHandle;
_value_burglartool = missionNamespace getVariable _var_burglartool;
_var_crowbar = ["crowbar",0] call avanix_fnc_varHandle;
_value_crowbar = missionNamespace getVariable _var_crowbar;
_tool_type = "";

if(_value_crowbar > 0) then
{
    _tool_type = "crowbar";
    _unlock_chance = 50;
};
if(_value_burglartool > 0) then
{
    _tool_type = "burglartool";
    _unlock_chance = 70;
};
if(_tool_type == "") exitWith {titleText["Du brauchst Einbrecherwerkzeug oder ein Brecheisen","PLAIN"];};
if("metalGrilledWindow" in _alarmsystems) then
{
    _unlock_chance = _unlock_chance - 10;
};
_alarm_chance = 0;
{
    _alarm_chance = _alarm_chance + 75;
} foreach _alarmsystems;

if(_house isKindOf "House_F") then
{
	_owner = _house getVariable["house_owner", []];
	[[0,format["%2, dein Haus wird gerade von %1 aufgebrochen!", name player,(_owner select 0)]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_progress_text = format["knacke %1",_displayName];
    _success = [20, _progress_text, _house] call avanix_fnc_progressWaitUntilFinished;
    if(!_success) exitWith {};
    if(!([false,_tool_type,1] call avanix_fnc_handleInv)) exitWith {};
	_dice = random(100);
	if(_dice <= _unlock_chance) then
    {
        avanix_player_rob_is_running = 1;
        [] spawn
        {
            uisleep (5*60);
            avanix_player_rob_is_running = 0;
        }; 
        _numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		_house setVariable["locked",false,true];
        for "_i" from 1 to _numDoors do
        {
            _house setVariable[format["bis_disabled_Door_%1", _i], 0, true];
        };
        _dice = random(100);
        if(_dice > _alarm_chance) then
        {
            titleText["Du hast das Haus aufgebrochen!","PLAIN"];
            [[getPlayerUID player,name player,"459"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
            [[0,format["%1 hat ein Haus aufgebrochen", name player]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;        
        }
        else
        {
            [[_house],"avanix_fnc_alarmHouse",true,false] spawn avanix_fnc_MP; //send to all players
            titleText["Du hast das Haus aufgebrochen, aber dabei Alarm ausgelöst! Die Polizei wurde alarmiert!","PLAIN"];
            [[getPlayerUID player,name player,"459"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
            [[0,format["%1 hat ein Haus aufgebrochen und dabei Alarm ausgelöst", name player]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;
            if("alarmsystemGuard" in _alarmsystems) then
            {
                [_house, 5*60] spawn
                {
                    private ["_house", "_duration", "_grp", "_guard","_waypoint0","_owner","_owner_object"];
                    _house    = _this select 0;
                    _duration = _this select 1;
                    _owner    = _house getVariable["house_owner", []];
                    uisleep 2;
                    titleText["Im Haus wartet ein Wachdienst auf dich, pass auf dass er dich nicht fängt!","PLAIN"];
                    _grp = group player;
                    _guard = _grp createUnit ["B_Soldier_F", getPos _house, [], 0, "CAN_COLLIDE"];
                    _guard setPos (getPos _house);
                    _guard allowdamage false;
                    RemoveAllWeapons _guard;
                    {_guard removeMagazine _x;} foreach (magazines _guard);
                    removeVest _guard;
                    removeBackpack _guard;
                    removeGoggles _guard;
                    removeHeadGear _guard;
                    {
                        _guard unassignItem _x;
                        _guard removeItem _x;
                    } foreach (assignedItems _guard);
                    if(hmd _guard != "") then {
                        _guard unlinkItem (hmd _guard);
                    };                     
                    _waypoint0 = _grp addwaypoint[player,0];
                    _waypoint0 setwaypointtype "Destroy"; 
                    while {_duration > 0} do
                    {
                        if((_guard distance player) < 1) exitWith
                        {
                            [_house, "alarmsystemGuard"] call avanix_fnc_removeAlarmsystem;

                            _owner = _house getVariable["house_owner",""];
                            if(!(isNull _owner)) then
                            {
                                [[0,format["%1, in dein Haus wurde eingebrochen und der Wachdienst hat den Einbrecher in den Knast gebracht. Du benötigst nun einen neuen Wachdienst!",(_owner select 1)]],"avanix_fnc_broadcast",(_owner select 1),false] spawn avanix_fnc_MP;
                            };
                            [player] call avanix_fnc_arrestAction;
                            [[player,false],"avanix_fnc_jail",player,false] spawn avanix_fnc_MP;
                            [[0,format["%1 hat ein Haus aufgebrochen und wurde von einem Wachmann direkt in den Knast geschickt.", name player]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;
                        };
                        uisleep 0.1;
                        _duration = _duration - 0.1;
                    };
                    deleteVehicle _guard;
                };    
            };            
            if("alarmsystem" in _alarmsystems && "alarmsystemGPS" in _alarmsystems) then
            {
                //send message to owner
                _owner = _house getVariable["house_owner",""];
                [[name player,_house,(_owner select 1)],"avanix_fnc_alarmsystemGPS",(_owner select 1),false] spawn avanix_fnc_MP;
                [[name player,_house,(_owner select 1),(_owner select 0),player],"avanix_fnc_alarmsystemGPS",west,false] spawn avanix_fnc_MP;
            };            
 
        };
        [_house] spawn
        {
            private ["_i","_house","_numDoors"];
            _house = _this select 0;
            _house setVariable["lockpicked", 1, false]; //set variable only for the player not global!!!
            _house setVariable["storage_locked", 0, false]; //set variable only for the player not global!!!
            uisleep 20;
            titleText["Du hast noch 5min um das Haus auszuräumen, danach geht es wieder zu!","PLAIN"];
            uisleep (4*60)-20;
            titleText["Du hast noch 1min um das Haus auszuräumen, danach geht es wieder zu!","PLAIN"];
            uisleep (1*60);
            _house setVariable["lockpicked", 0, false]; //set variable only for the player not global!!!
            _house setVariable["storage_locked", 1, false]; //set variable only for the player not global!!!
            titleText["Das wars das Haus ist nun wieder zu!","PLAIN"];
            _numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
            _house setVariable["locked",true,true];
			for "_i" from 1 to _numDoors do
            {
                _house animate [format["door_%1_rot", _i], 0];
                _house setVariable[format["bis_disabled_Door_%1", _i], 1, true];
            };            
        };
    }
    else
    {
        //LOCKPICK FAILED!!
		titleText["Das Werkzeug passte einfach nicht und du hast es wütend weggeworfen...","PLAIN"];
		[[getPlayerUID player,name player,"459"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
		[[0,format["%1 wurde dabei gesehen wie er ein Haus aufbrechen wollte.", name player]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;
	};
};