/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_bunker"];
	
_bunker = nearestObjects[getPos player,["Land_BagBunker_Small_F"],8] select 0;
if(isNil "_bunker") exitWith {};

if(([true,"bunker",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_bunkertrip","PLAIN"];
	player removeAction avanix_action_pickupBunker;
	avanix_action_pickupBunker = nil;
	deleteVehicle _bunker;
};