#include <macro.h>
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_fuelInfo"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index; _dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_vehicleColor = [_className,_dataArr select 1] call avanix_fnc_vehicleColorStr;
_vehicleInfo = [_className] call avanix_fnc_fetchVehInfo;
_trunkSpace = [_className] call avanix_fnc_vehicleWeightCfg;
_fuelInfo = [_className] call avanix_fnc_vehFuelCap;

_retrievePrice = [_className,__GETC__(avanix_garage_prices)] call TON_fnc_index;
_sellPrice = [_className,__GETC__(avanix_garage_sell)] call TON_fnc_index;
_retrievePrice = if(_retrievePrice == -1) then {1000} else {(__GETC__(avanix_garage_prices) select _retrievePrice) select 1;};
_sellPrice = if(_sellPrice == -1) then {1000} else {(__GETC__(avanix_garage_sell) select _sellPrice) select 1;};

(getControl(2800,2803)) ctrlSetStructuredText parseText format[
	("Einstellpreis:")+ " <t color='#8cff9b'>%1€</t><br/>
	" +("Verkaufspreis:")+ " <t color='#8cff9b'>%2€</t><br/>
	" +("Farbe:")+ " %8<br/>
	" +("Max. Geschwindigkeit:")+ " %3 km/h<br/>
	" +("Pferdestärken:")+ " %4<br/>
	" +("Passagierplätze:")+ " %5<br/>
	" +("Kofferraumgrösse:")+ " %6<br/>
	" +("Tankgrösse:")+ " %7
	",
[_retrievePrice] call avanix_fnc_numberText,
[_sellPrice] call avanix_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
//_vehicleInfo select 12,
if(_fuelInfo == -1) then {"None"} else {_fuelInfo},
_vehicleColor
];

ctrlShow [2803,true];
ctrlShow [2830,true];