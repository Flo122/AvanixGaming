/*
	File: vehicleEmpd.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
	Edit: Avanix Gaming Community
*/
private["_vehicle"];
_vehicle =  [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if((_vehicle getVariable ["nano_empd", false])) exitWith {};
_vehicle setVariable["nano_empd",true,true];
if(_vehicle isKindOf "Car") then {
	_vehicle say3D "empwarn";
	uisleep 3.35;
	/*if(local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		uisleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	};*/
	if(local _vehicle) then {
		_vehicle setFuel 0.045;
		uisleep (1 * 60);
		_vehicle setFuel 0.045;
	};
};
if(_vehicle isKindOf "Air") then {
	_vehicle say3D "empwarn";
	uisleep 3.35;
	if(local _vehicle) then {
		_vehicle setFuel 0.045;
		uisleep (1 * 60);
		_vehicle setFuel 0.045;
	}
};
if(_vehicle isKindOf "Ship") then {
	_vehicle say3D "empwarn";
	uisleep 3.35;
	if(local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		uisleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	}
};
_vehicle setVariable["nano_empd",false,true];