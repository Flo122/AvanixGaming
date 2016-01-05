#include <macro.h>
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 28020 == -1) exitWith {hint "Du hast nichts ausgewählt."};
_vehicle = lbData[28020,(lbCurSel 28020)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[28020,(lbCurSel 28020)];
_pid = getPlayerUID player;
_unit = player;
if(isNil "_vehicle") exitWith {hint "Die Auswahl hat einen Fehler..."};
_price = [_vehicle,__GETC__(avanix_impound_prices)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(avanix_impound_prices) select _price) select 1;};
if(avanix_atmcash < _price) exitWith {hint format[("Die Auswahl hat einen Fehler..."),[_price] call avanix_fnc_numberText];};
if(typeName avanix_garage_sp == "ARRAY") then {
    [[_vid,_pid,avanix_garage_sp select 0,_unit,_price,avanix_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] spawn avanix_fnc_MP;
} else {
        [[_vid,_pid,(getMarkerPos avanix_garage_sp),_unit,_price,markerDir avanix_garage_sp],"TON_fnc_spawnVehicle",false,false] spawn avanix_fnc_MP;
    };
avanix_atmcash = avanix_atmcash - _price;
hint "Fahrzeug wird bereitgestellt, bitte warten...";