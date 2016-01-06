/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_gate","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_gate = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _gate) exitWith {};
if({side _x == west} count playableUnits < 5) exitWith {hint "Es sind zu wenig Polizisten Online, das Gold wurde vorher an einem geheimen Ort versteckt."};
if(avanix_inv_boltcutter == 0) exitWith {
	titleText["Du hast kein Bolzenschneider.","PLAIN"];
};
if(player distance (getMarkerPos "bank") < 400 ) then {
	if((random 2) > 1) then {
		[[[1,2],"!!!!! DIE ZENTRALBANK WIRD AUSGERAUBT !!!!!!"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
	} else {
		hint "Dein Glück, du konnstest den Alarm umgehen.";
	};
};
if(player distance (getMarkerPos "police_hq_1") < 40 ) then {
	if((random 2) > 1) then {
		[[[1,2],"!!!!! IN DAS POLIZEIREVIER WIRD EINGEBROCHEN !!!!!!"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
	} else {
		hint "Dein Glück, du konnstest den Alarm umgehen.";
	};
};
if(player distance (getMarkerPos "jail_1_1") < 15 ) then {
	if((random 2) > 1) then {
		[[[1,2],"!!!!! IN DAS GEFÄNGNIS WIRD EINGEBROCHEN !!!!!!"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
	} else {
		hint "Dein Glück, du konnstest den Alarm umgehen.";
	};
};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _gate) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _gate selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _gate modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};

if(_door == 0) exitWith {hint "Du bist nicht in der Nähe einer Tür"}; //Not near a door to be broken into.
if((_gate getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint "Die Türe is offen!"};
avanix_action_inUse = true;

if(currentWeapon player != "") then {
	avanix_curWep_h = currentWeapon player;
	player action ["SwitchWeapon", player, player, 100];
};

//Setup the progress bar
disableSerialization;
_title = "Das Tor wird aufgebrochen...";
5 cutRsc ["avanix_progress","PLAIN"];
_ui = uiNamespace getVariable "avanix_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	uisleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["avanix_progress","PLAIN"];
		_ui = uiNamespace getVariable "avanix_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(avanix_istazed) exitWith {}; //Tazed
	if(avanix_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!isNil "avanix_curWep_h" && {(avanix_curWep_h != "")}) then {
	if(avanix_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
		player selectWeapon avanix_curWep_h;
	};
};
if(!alive player OR avanix_istazed) exitWith {avanix_action_inUse = false;};
if((player getVariable["restrained",false]) OR (player getVariable["hostage",false])) exitWith {avanix_action_inUse = false;};
if(avanix_interrupted) exitWith {avanix_interrupted = false; titleText["Action cancelled","PLAIN"]; avanix_action_inUse = false;};
avanix_action_inUse = false;

[false,"boltcutter",1] call avanix_fnc_handleInv;

_gate setVariable[format["bis_disabled_Door_1"],0,true]; //Unlock the door.
_gate setVariable[format["bis_disabled_Door_2"],0,true]; //Unlock the door.