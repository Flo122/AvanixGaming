#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value","_asservatenkammer","_vInv","_items","_space","_itemIndex","_weight","_sum","_itemWeight"];
_vehicle = cursorTarget;
_asservatenkammer = nearestObject [[15334.2,17452.3,0],"CargoNet_01_box_F"];
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if(count _vehicleInfo == 0) exitWith {hint "Dieses Fahrzeug ist leer"};

_sum = 0;
_value = 0;
_var = "";
_val = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_index = [_var,avanix_illegal_items] call TON_fnc_index;
	if(_index != -1) then
	{
		_vIndex = [_var,__GETC__(sell_array)] call TON_fnc_index;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * ((__GETC__(sell_array) select _vIndex) select 1));
		};
		
		_vInv = _asservatenkammer getVariable ["Trunk",[[],0]];
		_items = _vInv select 0;
		_space = _vInv select 1;
		_itemIndex = [_var,_items] call TON_fnc_index;
		_weight = [_asservatenkammer] call avanix_fnc_vehicleWeight;
		_sum = [_var,_val,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
		if(_sum < 1) exitWith {titleText["Die Asservatenkammer ist voll!","PLAIN"];if(true) exitwith {hint "Die Asservatenkammer ist voll!"}; _asservatenkammer setVariable["Trunk",[],true];};
		_itemWeight = ([_var] call avanix_fnc_itemWeight) * _sum;
		if(_itemIndex == -1) then {
			_items pushBack [_var,_sum];
		} else {
			_num = _items select _itemIndex select 1;
			_items set[_itemIndex,[_var,_num + _sum]];
		};
		_asservatenkammer setVariable["Trunk",[_items,_space + _itemWeight],true];
		[[_asservatenkammer],"TON_fnc_updateAsservatenkammerTrunk",false,false] spawn avanix_fnc_MP;	
	};
	
} foreach (_vehicleInfo select 0);

if(_value > 0) then
{
	[[0,format["Ein Fahrzeug wurde durchsucht, es wurden Drogen/Schmuggelware im Wert von %1€ gefunden.",[_value] call avanix_fnc_numberText]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
	avanix_atmcash = avanix_atmcash + _value;	
	_vehicle setVariable["Trunk",[],true];
}
	else
{
	hint "Nichts Illegales in diesem Fahrzeug";
};