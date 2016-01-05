/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
	Edit: Avanix Gaming Community
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(avanix_empInUse) exitWith { hint "Das EMP warnt gerade schon ein Fahrzeug oder die Batterie muss sich erst wieder aufladen"; };
	avanix_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = avanix_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	(vehicle player) say3D "empacsound";
	[[_vehicle], "avanix_fnc_vehicleEmpd",crew _vehicle,false] spawn avanix_fnc_MP;
	uisleep (5 * 60);
	avanix_empInUse = false;
};
