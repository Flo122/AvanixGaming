#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint "Du hast nichts ausgewählt."};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "Die Auswahl hat einen Fehler..."};

_price = [_vehicle,__GETC__(avanix_garage_prices)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(avanix_garage_prices) select _price) select 1;};
if(avanix_atmcash < _price) exitWith {hint format[("Du hast keine %1€ auf deinem Bankkonto"),[_price] call avanix_fnc_numberText];};

if(typeName avanix_garage_sp == "ARRAY") then {
	[[_vid,_pid,avanix_garage_sp select 0,_unit,_price,avanix_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] spawn avanix_fnc_MP;
} else {
	if(avanix_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[[_vid,_pid,avanix_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] spawn avanix_fnc_MP;
	} else {
		[[_vid,_pid,(getMarkerPos avanix_garage_sp),_unit,_price,markerDir avanix_garage_sp],"TON_fnc_spawnVehicle",false,false] spawn avanix_fnc_MP;
	};
};

hint "Fahrzeug wird bereitgestellt, bitte warten...";

avanix_atmcash = avanix_atmcash - _price;