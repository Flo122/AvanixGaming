/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Error check?

_unit setVariable["hostage",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
[player,"kabelbinder"] call avanix_fnc_globalSound;
5 enableChannel true;
//Disable Group Chat
3 enableChannel true;
//Disable Vehicle Chat
4 enableChannel true;
//Disable Side Chat
7 enableChannel true;
[[0,format["%1 wurde befreit von %2",name _unit, name player]],"avanix_fnc_broadcast",true,FALSE] call avanix_fnc_MP;
_toLog = format ["3|%1 (%3) hat %2 freigelassen.", name player, _unit, getPlayerUID player];
[[_toLog],"Arma3Log"] call avanix_fnc_MP;
