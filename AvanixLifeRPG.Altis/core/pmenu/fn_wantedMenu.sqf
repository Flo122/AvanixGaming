#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "avanix_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Establishing connection..."];

if(__GETC__(avanix_coplevel) < 3 && __GETC__(avanix_adminlevel) == 0) then
{
	ctrlShow[2405,false];
};

[[player],"avanix_fnc_wantedFetch",false,false] spawn avanix_fnc_MP;