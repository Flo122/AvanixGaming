#include <macro.h>
/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data","_boxType"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_boxType = ["Land_Cargo10_grey_F","Land_Pod_Heli_Transport_04_box_F","Land_Wreck_Traw_F","Box_IND_AmmoVeh_F","Land_Cargo20_blue_F","CargoNet_01_box_F","B_Slingload_01_Cargo_F","Land_MetalCase_01_large_F"];

if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR typeof _vehicle in _boxType OR _vehicle isKindOf "House_F")) exitWith {}; //Either a null or invalid vehicle type.

if(_vehicle isKindOf "Land_MetalCase_01_large_F" && ((_vehicle getVariable["gang_name",""]) != ((group player) getVariable "gang_name"))) exitWith { closeDialog 0; hint "Deine Gang hat über dieses Territorium keine Kontrolle!";};
if(_vehicle isKindOf "Land_MetalCase_01_large_F" && (isNil {grpPlayer getVariable "gang_name"})) exitWith { closeDialog 0; hint "Deine Gang hat über dieses Territorium keine Kontrolle!";};

if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint "Der Kofferraum dieses Fahrzeuges wird bereits benutzt, nur eine Person kann auf ihn zugreifen."};
_vehicle setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {hint "Erstellen des Dialogs gescheitert.";}; //Couldn't create the menu?
disableSerialization;

if(_vehicle isKindOf "House_F" OR _vehicle isKindof "Land_MetalCase_01_large_F") then {
	ctrlSetText[3501,format["Lagerplatz des Hauses"+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format["Kofferraum"+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

[_vehicle] call avanix_fnc_updateVehTrunk;

if((str(_vehicle) select [0,18]) == "asservatenkammer_1") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call avanix_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
};

if(_vehicle isKindof "Land_MetalCase_01_large_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call avanix_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
};

if(_vehicle isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call avanix_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call avanix_fnc_vehicleWeight;
};

if(_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers",[]]) == 0}) exitWith {hint "Du musst dir Lagerboxen kaufen, um etwas einlagern zu können!"; closeDialog 0; _vehicle setVariable["trunk_in_use",false,true];};
if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; hint "Dieses Fahrzeug kann keine virtuellen Gegenstände speichern.";};

ctrlSetText[3504,format["Gewicht: %1/%2",_veh_data select 1,[_veh_data select 0] call avanix_fnc_numberText]];
[_vehicle] call avanix_fnc_vehInventory;
avanix_trunk_vehicle = _vehicle;

_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	sleep 1;
	_this setVariable["trunk_in_use",false,true];
	if(_this isKindOf "House_F") then {
		[[_this],"TON_fnc_updateHouseTrunk",false,false] spawn avanix_fnc_MP;
	};
	if(_this isKindOf "Land_MetalCase_01_large_F") then {
		[[_this,str(_this) select [9,4]],"TON_fnc_updateHideoutTrunk",false,false] spawn avanix_fnc_MP;
	};
	if((str(_this) select [0,18]) == "asservatenkammer_1") then {
		[[_this],"TON_fnc_updateAsservatenkammerTrunk",false,false] spawn avanix_fnc_MP;
	};
};