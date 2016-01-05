/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_sandsack"];
	
_sandsack = nearestObjects[getPos player,["Land_HBarrierBig_F"],8] select 0;
if(isNil "_sandsack") exitWith {};

if(([true,"sandsack",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_sandsacktrip","PLAIN"];
	player removeAction avanix_action_pickupSandsack;
	avanix_action_pickupSandsack = nil;
	deleteVehicle _sandsack;
};