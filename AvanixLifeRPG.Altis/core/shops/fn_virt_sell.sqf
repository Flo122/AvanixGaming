#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call TON_fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call avanix_fnc_varHandle;

_amount = -1;
if(_mode == 0) then 
{
	_amount = ctrlText 2405;
	if(!([_amount] call fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = parseNumber (_amount);
}
	else
{
	_amount = missionNamespace getVariable _var;
};

if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = [_var] call avanix_fnc_vartostr;

if(([false,_type,_amount] call avanix_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call avanix_fnc_numberText];
	avanix_cash = avanix_cash + _price;
	[] call avanix_fnc_virt_update;
};

if(avanix_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = avanix_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		avanix_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		avanix_shop_npc setVariable["sellers",_array,true];
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;