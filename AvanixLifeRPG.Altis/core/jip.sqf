/*
	File: jip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	JIP functionality for JIP required things like vehicles.
*/

{
	_index = _x getVariable "avanix_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn avanix_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Car");

{
	_index = _x getVariable "avanix_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn avanix_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Air");