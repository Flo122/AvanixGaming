/*
	File: fn_unrestrain.sqf
	Edit: Avanix Gaming Community
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Error check?
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
[player,"cuff"] call avanix_fnc_globalSound;

[[0,format["%1 Handschellen wurden von %2 geöffnet.",name _unit, name player]],"avanix_fnc_broadcast",west,FALSE] call avanix_fnc_MP;
_toLog = format ["1|%1 (%3) hat %2 freigelassen.", name player, _unit, getPlayerUID player];
[[_toLog],"Arma3Log"] call avanix_fnc_MP;
