/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_barriere_k"];

_barriere_k = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0;
if(isNil "_barriere_k") exitWith {};

if(([true,"barriere_k",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_barriere_ktrip","PLAIN"];
	player removeAction avanix_action_pickupBarriere_k;
	avanix_action_pickupBarriere_k = nil;
	deleteVehicle _barriere_k;
};