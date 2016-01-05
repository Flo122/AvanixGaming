#include <macro.h>
/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Capture the Hideout
*/
private["_hideout","_terminal","_uiDisp","_timer","_time","_dist"];
_hideout = (nearestObjects[getPosATL player,["Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F"],25]) select 0;
_terminal = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if (vehicle player != player) exitWith {hint "Du musst aus dem Fahrzeug aussteigen!"};
if (currentWeapon player == "") exitWith {hint "Du brauchst ne Waffe!"};

avanix_action_inUse = true;
//Setup our timer.
disableSerialization;
6 cutRsc ["avanix_timer","PLAIN"];
hint "Bleib in der Nähe!";
_uiDisp = uiNamespace getVariable "avanix_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (1 * 30);
while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["avanix_timer","PLAIN"];
		_uiDisp = uiNamespace getVariable "avanix_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {[_terminal,0] call BIS_fnc_dataTerminalAnimate;};
	_terminal setVariable["inCapture",true,true];
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	uisleep 0.08;
	if((player getVariable["restrained",false])) exitWith {};
	if((player getVariable["hostage",false])) exitWith {};
	if(avanix_istazed) exitWith {};
	_dist = player distance _terminal;
	if (_dist > 200) exitWith {hint "Du bist zu weit weg!";};
};

//Kill the UI display and check for various states
avanix_action_inUse = false;
6 cutText["","PLAIN"];
if(!alive player OR avanix_istazed) exitWith {avanix_action_inUse = false;_terminal setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {avanix_action_inUse = false;_terminal setVariable["inCapture",false,true];};
_dist = player distance _terminal;
if (_dist > 200) exitWith {hint "Du bist zu weit weg!";};

_hideout setVariable["CancelCapture",true,true];
avanix_action_inUse = false;