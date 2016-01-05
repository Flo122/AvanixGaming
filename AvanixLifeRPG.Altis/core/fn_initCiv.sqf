#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
waitUntil {!(isNull (findDisplay 46))};

if((str(player) in ["vip_1","vip_2","vip_3","vip_4","vip_5","vip_6","vip_7","vip_8","vip_9","vip_10","vip_11","vip_12","vip_13","vip_14","vip_15","vip_16","vip_17","vip_18","vip_19"])) then {
	if(__GETC__(avanix_donator) == 0) then
	{
		endMission "Loser";
		uisleep 35;
	};
};

if((str(player) in ["admin_1"])) then {
	if(!(__GETC__(avanix_adminlevel) == 3)) then 
	{
		endMission "Loser";
		uisleep 35;
	};
};

if(avanix_is_arrested) then
{
	avanix_is_arrested = false;
	[player,true] spawn avanix_fnc_jail;
}
	else
{

    
	[] call avanix_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.


    [] spawn avanix_fnc_welcome;
	waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
	waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.
};
player addRating 9999999;