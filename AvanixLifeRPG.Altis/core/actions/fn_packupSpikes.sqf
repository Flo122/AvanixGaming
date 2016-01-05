/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_stripes"];
	
_stripes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if(isNil "_stripes") exitWith {};

if(([true,"spikeStrip",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_stripestrip","PLAIN"];
	player removeAction avanix_action_spikeStripPickup;
	avanix_action_spikeStripPickup = nil;
	deleteVehicle _stripes;
};