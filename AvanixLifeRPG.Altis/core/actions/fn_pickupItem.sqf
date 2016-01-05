/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff"];
if((time - avanix_action_delay) < 2) exitWith {hint "You can't rapidly use action keys!"};
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _obj OR isPlayer _obj) exitWith {};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
if(player distance _obj > 3) exitWith {};
_itemInfo = _obj getVariable "item";
_itemName = [([_itemInfo select 0,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
_illegal = [_itemInfo select 0,avanix_illegal_items] call TON_fnc_index;
if(playerSide == west && _illegal != -1) exitWith
{
	titleText[format[localize "STR_NOTF_PickedEvidence",_itemName,[(avanix_illegal_items select _illegal) select 1] call avanix_fnc_numberText],"PLAIN"];
	avanix_atmcash = avanix_atmcash + ((avanix_illegal_items select _illegal) select 1);
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	avanix_action_delay = time;
};
avanix_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,avanix_carryWeight,avanix_maxWeight] call avanix_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint localize "STR_NOTF_InvFull"};
_obj setVariable["PickedUp",TRUE,TRUE];
if(_diff != _itemInfo select 1) then
{
	if(([true,_itemInfo select 0,_diff] call avanix_fnc_handleInv)) then
	{
		player playmove "AinvPknlMstpSlayWrflDnon";
		uisleep 0.5;
		_obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
		_obj setVariable["PickedUp",false,true];
		titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
	};
}
	else
{
	if(([true,_itemInfo select 0,_itemInfo select 1] call avanix_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		//waitUntil{isNull _obj};
		player playmove "AinvPknlMstpSlayWrflDnon";
		uisleep 0.5;
		titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
	};
};