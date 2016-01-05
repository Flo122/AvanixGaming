/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_container"];
	
_container = nearestObjects[getPos player,["Land_Medevac_house_V1_F"],8] select 0;
if(isNil "_container") exitWith {};

if(([true,"medhouse",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_containertrip","PLAIN"];
	player removeAction avanix_action_pickupContainer;
	avanix_action_pickupContainer = nil;
	deleteVehicle _container;
};