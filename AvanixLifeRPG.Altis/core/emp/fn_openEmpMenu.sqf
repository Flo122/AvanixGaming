/*
	File: openEmpMenu.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
	Edit: Avanix Gaming Community
	
	Description:
	Opens the EMP operator menu
*/
if(!alive player || dialog) exitWith {};
createDialog "nanoEMPConsole";	
disableSerialization;
waitUntil {!isNull (findDisplay 3494)};
[] spawn avanix_fnc_scanVehicles;
