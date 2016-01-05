/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_barriere_g"];
_barriere_g = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0;
if(isNil "_barriere_g") exitWith {};
if(([true,"barriere_g",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_barriere_gtrip","PLAIN"];
	player removeAction avanix_action_pickupBarriere_g;
	avanix_action_pickupBarriere_g = nil;
	deleteVehicle _barriere_g;
};