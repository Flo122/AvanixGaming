/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop","_inv","_var","_val","_robber","_asservatenkammer","_vInv","_items","_space","_itemIndex","_weight","_sum","_itemWeight"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
_asservatenkammer = nearestObject [[15334.2,17452.3,0],"CargoNet_01_box_F"];
if(isNull _cop) exitWith {};
_inv = [];
_robber = false;
//Illegal items
{
	_var = [_x select 0,0] call avanix_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_inv pushBack [_x select 0,_val];
		[false,(_x select 0),_val] call avanix_fnc_handleInv;
		
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
	};
} foreach avanix_illegal_items;

if(!avanix_use_atm) then 
{
	avanix_cash = 0;
	_robber = true;
};

[[player,_inv,_robber],"avanix_fnc_copSearch",_cop,false] spawn avanix_fnc_MP;