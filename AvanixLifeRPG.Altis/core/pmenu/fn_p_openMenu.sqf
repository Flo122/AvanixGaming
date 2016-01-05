#include <macro.h>
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2030,false]; //Gang Icon
		ctrlShow[2036,false]; //Gang Button
		ctrlShow[2035,false]; //Notarzt Icon
		ctrlShow[2041,false]; //Notarzt Button
		ctrlShow[2034,false]; //Taxi Icon
		ctrlShow[2040,false]; //Taxi Button
	};
	
	case civilian:
	{
		ctrlShow[2031,false]; //Wanted Icon
		ctrlShow[2037,false]; //Wanted Button
		ctrlShow[2033,false]; //Siren Icon
		ctrlShow[2039,false]; //Siren Icon
		ctrlShow[2035,false]; //Notarzt Icon
		ctrlShow[2041,false]; //Notarzt Button
	};
	
	case independent:
	{
		ctrlShow[2030,false]; //Gang Icon
		ctrlShow[2036,false]; //Gang Button
		ctrlShow[2031,false]; //Wanted Icon
		ctrlShow[2037,false]; //Wanted Button
		ctrlShow[2033,false]; //Siren Icon
		ctrlShow[2039,false]; //Siren Icon
		ctrlShow[2034,false]; //Taxi Icon
		ctrlShow[2040,false]; //Taxi Button
	};
};

if(__GETC__(avanix_adminlevel) < 1) then
{
	ctrlShow[2032,false]; //Admin Icon
	ctrlShow[2038,false]; //Admin Button
};

[] call avanix_fnc_p_updateMenu;

if(__GETC__(avanix_adminlevel) < 1) then
{
	ctrlShow[2032,false]; //Admin Icon
	ctrlShow[2038,false]; //Admin Button
};