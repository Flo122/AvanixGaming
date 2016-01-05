#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit","_hideout"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) then {
	hint "Du bist nicht berechtigt, in fremde Rucksäcke zu schauen!";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in avanix_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint "Du bist nicht berechtigt, auf diesen Container zuzugreifen, ohne dass der Besitzer ihn aufgeschlossen hat.";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in avanix_vehicles) && {(locked _container) == 2}) exitWith {
		hint "Du bist nicht berechtigt, auf dieses Fahrzeug zuzugreifen, während es abgeschlossen ist.";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint "Es ist nicht erlaubt Leichen zu looten! (Bugusing fürht zum Bann!)";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if(_container isKindOf "Land_MetalCase_01_large_F" && ((_container getVariable["gang_name",""]) != ((group player) getVariable "gang_name"))) exitWith {
	hint "Deine Gang hat über dieses Territorium keine Kontrolle!";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};


if(_container isKindOf "Land_MetalCase_01_large_F" && (isNil {grpPlayer getVariable "gang_name"})) exitWith {
	hint "Du bist in keiner Gang und hast keine Kontrolle über das Territorium!";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if(_container isKindOf "CargoNet_01_box_F" && _container getVariable["locked",false]) exitWith {
	hint "Du musst die Asservatenkammer erst aufbrechen!";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};
