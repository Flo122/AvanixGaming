#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

_igiload = execVM "IgiLoad\IgiLoadInit.sqf";

if((__GETC__(avanix_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	uisleep 35;
};

player setVariable["mediclevel",(__GETC__(avanix_medicLevel)),true];

switch (__GETC__(avanix_donator)) do 
{
	case 1: { _donatorlvl = 1000; }; //Level 1
	case 2: { _donatorlvl = 2000; }; //Level 2
	case 3: { _donatorlvl = 3000; }; //Level 3
	default { _donatorlvl = 0; }; //default for non donators they get nada!
};

switch(__GETC__(avanix_medicLevel)) do
{
	case 1: {avanix_paycheck = avanix_paycheck + 1500;};
	case 2: {avanix_paycheck = avanix_paycheck + 2500;};
	case 3: {avanix_paycheck = avanix_paycheck + 3500;};
	case 4: {avanix_paycheck = avanix_paycheck + 4500;};
	case 5: {avanix_paycheck = avanix_paycheck + 5500;};
	case 6: {avanix_paycheck = avanix_paycheck + 6500;};
};

[] call avanix_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.