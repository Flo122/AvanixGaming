#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(avanix_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	uisleep 30;
};

player setVariable["coplevel",(__GETC__(avanix_coplevel)),true];

if(!(str(player) in ["cop_101","cop_102","cop_103","cop_104"])) then {
	if((__GETC__(avanix_coplevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		uisleep 35;
	};
};

switch(__GETC__(avanix_copLevel)) do
{
	case 1: {avanix_paycheck = avanix_paycheck + 1000;};
	case 2: {avanix_paycheck = avanix_paycheck + 1500;};
	case 3: {avanix_paycheck = avanix_paycheck + 2000;};
	case 4: {avanix_paycheck = avanix_paycheck + 2500;};
	case 5: {avanix_paycheck = avanix_paycheck + 3000;};
	case 6: {avanix_paycheck = avanix_paycheck + 3500;};
	case 7: {avanix_paycheck = avanix_paycheck + 4000;};
	case 8: {avanix_paycheck = avanix_paycheck + 4500;};
	case 9: {avanix_paycheck = avanix_paycheck + 5000;};
	case 10: {avanix_paycheck = avanix_paycheck + 5500;};
	case 11: {avanix_paycheck = avanix_paycheck + 6000;};
	case 12: {avanix_paycheck = avanix_paycheck + 6500;};
};

switch (__GETC__(avanix_donator)) do 
{
	case 1: { _donatorlvl = 1000; }; //Level 1
	case 2: { _donatorlvl = 2000; }; //Level 2
	case 3: { _donatorlvl = 3000; }; //Level 3
	default { _donatorlvl = 0; }; //default for non donators they get nada!
};

player setVariable["rank",(__GETC__(avanix_coplevel)),true];
[] call avanix_fnc_spawnMenu;

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.