#include <macro.h>
/*
	File:fn_spyOutHouse.sqf
	Author: Wolfgang Bahmüller
	
	Description:
    To get some hint what is stored in the house and which alarmsystems are installed.
	
*/
if (isnil ("avanix_player_spy_is_running")) then {avanix_player_spy_is_running=0;};
private["_house","_storage","_alarmsystems","_var_spytoolkit","_value_spytoolkit","_spy_chance","_displayName","_tool_type","_dice","_numDoors","_money_in_storage","_count_storage_items","_hint_text","_var","_name","_success"];
_house = cursorTarget;
avanix_interrupted = false;
if(isNull _house) exitwith {};
if(avanix_player_spy_is_running == 1) exitWith {hint "du beobachtest doch schon ein Haus...";};
avanix_player_spy_is_running = 1;

_alarmsystems = [_house] call avanix_fnc_getAlarmsystems;
_storage = _house getVariable ["Trunk",[]];

_var_spytoolkit = ["spytoolkit",0] call avanix_fnc_varHandle;
_value_spytoolkit = missionNamespace getVariable _var_spytoolkit;

_tool_type = "";

if(_value_spytoolkit > 0) then
{
    _tool_type = "spytoolkit";
    _spy_chance = 70;
};

if(_tool_type == "") exitWith {avanix_player_spy_is_running = 0;titleText["Du brauchst Spion Werkzeuge","PLAIN"];};

if("metalGrilledWindow" in _alarmsystems) then
{
    _spy_chance = _spy_chance - 10;
};

if(_house isKindOf "House_F") then
{
	_owner = _house getVariable["house_owner", []];
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_progress_text = format["Spioniere %1 aus...",_displayName];
    _success = [20, _progress_text, _house] call avanix_fnc_progressWaitUntilFinished;
    if(!_success) exitWith {avanix_player_spy_is_running = 0;};        
    if(!([false,_tool_type,1] call avanix_fnc_handleInv)) exitWith {};
	avanix_player_spy_is_running = 0;

	_dice = random(100);
	if(_dice <= _spy_chance) then
    {
		titleText["Hier sind die Informationen...","PLAIN"];
        _money_in_storage = 0;
        _count_storage_items = 0;
        _hint_text = "Sicherheitssystem:\n------------------------------\n";
        {
            _var  = [_x, 0] call avanix_fnc_varHandle;
            _name = [_var] call avanix_fnc_varToStr;
            _hint_text = _hint_text + _name + "\n";
        } foreach _alarmsystems;
        _hint_text = _hint_text + "\nim Lager:\n------------------------------\n";
        {
            if((_x select 0) != "money") then
            {
                _var = [_x select 0,0] call avanix_fnc_varHandle;
                _name = [_var] call avanix_fnc_varToStr;
                _val = _x select 1;
                if(_val > 0) then
                {
                    _hint_text = _hint_text + _name + "\n";
                };
            }
				else
            {
                _val = _x select 1;
                if(_val > 0) then
                {
                    _hint_text = _hint_text + "Geldbetrag" + "\n";
                };
            };
        } foreach (_storage select 0);
        hint _hint_text;
    }
    else
    {
		titleText["Du wurdest gestört und hast nichts über das Haus erfahren...","PLAIN"];
	};
};