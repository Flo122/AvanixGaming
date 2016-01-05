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
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!
[player,"cuff"] call avanix_fnc_globalSound;

_unit setVariable["restrained",true,true];
[[player], "avanix_fnc_restrainCop", _unit, false] spawn avanix_fnc_MP;
_toLog = format ["1|%1 (%3) hat %2 festgenommen.", name player, _unit, getPlayerUID player];
[[_toLog],"Arma3Log"] call avanix_fnc_MP;
[[0,format["%1 wurde von %2 in Handschellen gelegt.", name _unit, name player]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;