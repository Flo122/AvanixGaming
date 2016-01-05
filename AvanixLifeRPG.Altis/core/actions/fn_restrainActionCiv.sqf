/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if(player getVariable "restrained" OR player getVariable "hostage" OR player getVariable "surrender") exitWith {hint "Du hast Deine Hände nicht frei!"};
if((_unit getVariable "hostage")) exitWith {};
//if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!
[player,"kabelbinder"] call avanix_fnc_globalSound; 

_unit setVariable["hostage",true,true];
[[player], "avanix_fnc_restrainCiv", _unit, false] spawn avanix_fnc_MP;
_toLog = format ["3|%1 (%3) hat %2 gefesselt.", name player, _unit, getPlayerUID player];
[[_toLog],"Arma3Log"] call avanix_fnc_MP;
[[0,format["!!!%1 wurde als Geisel genommen!!!", name _unit, name player]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;