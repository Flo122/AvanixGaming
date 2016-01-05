/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_target"];
	
_target = nearestObjects[getPos player,["Target_F"],8] select 0;
if(isNil "_target") exitWith {};

if(([true,"target",1] call avanix_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_targettrip","PLAIN"];
	player removeAction avanix_action_pickupTarget;
	avanix_action_pickupTarget = nil;
	deleteVehicle _target;
};