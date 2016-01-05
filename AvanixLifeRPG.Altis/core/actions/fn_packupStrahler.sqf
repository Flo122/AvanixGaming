/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_strahler"];

_strahler = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0;
if(isNil "_strahler") exitWith {};

if(([true,"strahler",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_strahlertrip","PLAIN"];
	player removeAction avanix_action_pickupStrahler;
	avanix_action_pickupStrahler = nil;
	deleteVehicle _strahler;
};