#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_action"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint "Du hast nichts ausgewählt."};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "Die Auswahl hat einen Fehler..."};

_action = [format ["Sicher das du dein 1% verkaufen willst?",_vehicle],"Sind sie sicher?","Ja","Nein"] call BIS_fnc_guiMessage;

if(_action) then 
{
	_price = [_vehicle,__GETC__(avanix_garage_sell)] call TON_fnc_index;
	if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(avanix_garage_sell) select _price) select 1;};

	[[_vid,_pid,_price,player,avanix_garage_type],"TON_fnc_vehicleDelete",false,false] spawn avanix_fnc_MP;
	hint format["Du verkaufst dein Fahrzeug für %1€",[_price] call avanix_fnc_numberText];
	avanix_atmcash = avanix_atmcash + _price;
	closeDialog 0;
} else {
	closeDialog 0;
};