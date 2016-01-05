/*
	File: fn_sequestroCheck.sqf
	Author: Al Morise (Sink)
	Description:
	Rimuove equipaggiamento illegale dalla unit
*/
private ["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isNull _unit) exitWith {};

if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {};
_action = [format ["Beschlagnahmen illegale Gegenstände von 1%?",name _unit],"Sind sie sicher?","Ja","Nein"] call BIS_fnc_guiMessage;
if(_action) then {
hint format["Beschlagnahme illegale Gegenstände von 1%. Bitte warten Sie ...",name _unit];
[[player],"avanix_fnc_seize",_unit,false] spawn avanix_fnc_MP;
uisleep 3;
hint "Illegale Gegenstände beschlagnahmt.";
};