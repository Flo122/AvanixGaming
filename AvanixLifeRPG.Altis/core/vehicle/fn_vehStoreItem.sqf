#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Falsches Nummernformat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst nicht weniger als 1 auswählen!";};

if(avanix_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call avanix_fnc_vehicleWeightCfg);} foreach (avanix_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(avanix_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [avanix_trunk_vehicle] call avanix_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call avanix_fnc_itemWeight) * _num;
_veh_data = avanix_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if( (_ctrl) in ["goldbar","uranu"] && {!(avanix_trunk_vehicle isKindOf "LandVehicle" OR avanix_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Du kannst das hier nicht einlagern!"};

_tanklkw = false;
{
	if (avanix_trunk_vehicle isKindOf _x) then {_tanklkw = true;};
} forEach ["C_Van_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","I_Truck_02_fuel_F","O_Heli_Transport_04_fuel_F"];

_ammolkw = false;
{
	if (avanix_trunk_vehicle isKindOf _x) then {_ammolkw = true;};
} forEach ["O_Truck_03_ammo_F","B_Truck_01_ammo_F"];

_isFluid = false;
{
	if (_ctrl == _x) then {_isFluid = true;};
} forEach ["rohoel","erdoel","benzin","diesel","kerosin"];

_isUran = false;
{
	if (_ctrl == _x) then {_isUran = true;};
} forEach ["uranu","uranp"];

if (_tanklkw && (!_isFluid)) exitWith {hint "Du kannst nur Fluessigkeiten in einen Tanklaster fuellen!"};
if ((!_tanklkw) && _isFluid) exitWith {hint "Du kannst Fluessigkeiten nur in einen Tanklaster fuellen!"};

if (_ammolkw && (!_isUran)) exitWith {hint "Du kannst nur Radioaktives Material und Uran in diesem Fahrzeug lagern!"};
if ((!_ammolkw) && _isUran) exitWith {hint "Du kannst Radioaktives Material und Uran nur in einem HEMTT/Tempest Munition lagern!"};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(avanix_cash < _num) exitWith {hint "Du hast nicht soviel Geld!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	avanix_cash = avanix_cash - _num;
	avanix_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[avanix_trunk_vehicle] call avanix_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist voll."};

	if(!([false,_ctrl,_num] call avanix_fnc_handleInv)) exitWith {hint "Das hat nicht funktioniert.";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	avanix_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[avanix_trunk_vehicle] call avanix_fnc_vehInventory;
};
