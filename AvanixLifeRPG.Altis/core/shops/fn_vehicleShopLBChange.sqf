#include <macro.h>
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;
_vehicleList = [avanix_VEH_shop select 0] call avanix_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
_vehicleInfo = [_className] call avanix_fnc_fetchVehInfo;
_trunkSpace = [_className] call avanix_fnc_vehicleWeightCfg;

ctrlShow [2330,true];
(getControl(2300,2303)) ctrlSetStructuredText parseText format[
("Mietpreis:")+ " <t color='#8cff9b'>%1€</t><br/>" +("Kaufpreis:")+ " <t color='#8cff9b'>%2€</t><br/>" +("Max. Geschwindigkeit:")+ " %3 km/h<br/>" +("PS:")+ " %4<br/>" +("Passagierplätze:")+ " %5<br/>" +("Kofferraumgröße:")+ " %6<br/>" +("Tankgröße:")+ " %7<br/>" +("Panzerungsbewertung:")+ " %8",
[_basePrice] call avanix_fnc_numberText,
[round(_basePrice * 1.5)] call avanix_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
([_className] call avanix_fnc_vehFuelCap),
_vehicleInfo select 12,
_vehicleInfo select 9
];

_ctrl = getControl(2300,2304);
lbClear _ctrl;
_colorArray = [_className] call avanix_fnc_vehicleColorCfg;

for "_i" from 0 to count(_colorArray)-1 do {
	if((_colorArray select _i) select 1 == (avanix_VEH_shop select 2)) then {
		_temp = [_className,_i] call avanix_fnc_vehicleColorStr;
		_ctrl lbAdd format["%1",_temp];
		_ctrl lbSetValue [(lbSize _ctrl)-1,_i];
	};
};

if(_className in (__GETC__(avanix_vShop_rentalOnly))) then {
	ctrlEnable [2309,false];
} else {
	if(!(avanix_VEH_shop select 3)) then {
		ctrlEnable [2309,true];
	};
};

lbSetCurSel[2304,0];
if((lbSize _ctrl)-1 != -1) then {
	ctrlShow[2304,true];
} else {
	ctrlShow[2304,false];
};
true;