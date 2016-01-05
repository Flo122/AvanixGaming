/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_schranke"];

_schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0;
if(isNil "_schranke") exitWith {};

if(([true,"schranke",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_schranketrip","PLAIN"];
	player removeAction avanix_action_pickupSchranke;
	avanix_action_pickupSchranke = nil;
	deleteVehicle _schranke;
};