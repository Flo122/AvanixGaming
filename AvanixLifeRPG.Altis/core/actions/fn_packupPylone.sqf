/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_pylone"];

_pylone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_pylone") exitWith {};
	
if(([true,"pylone",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_pylonetrip","PLAIN"];
	player removeAction avanix_action_pickupPylone;
	avanix_action_pickupPylone = nil;
	deleteVehicle _pylone;
};