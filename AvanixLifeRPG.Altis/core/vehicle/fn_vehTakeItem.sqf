#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull avanix_trunk_vehicle OR !alive avanix_trunk_vehicle) exitWith {hint "Das Fahrzeug existiert entweder nicht oder wurde zerstört."};
if(!alive player) exitwith {closeDialog 0;};

if((lbCurSel 3502) == -1) exitWith {hint "Du hast nichts ausgewählt.";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Ungültiges Zahlenformat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst nichts unter 1 eingeben!";};

_index = [_ctrl,((avanix_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
_data = (avanix_trunk_vehicle getVariable "Trunk") select 0;
_old = avanix_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {hint "Das Fahrzeug hat nicht so viele dieser Gegenstände."};
_num = [_ctrl,_num,avanix_carryWeight,avanix_maxWeight] call avanix_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Dein Inventar ist voll."};
_weight = ([_ctrl] call avanix_fnc_itemWeight) * _num;
if(_ctrl == "money") then
{
	if(_num == _value) then
	{
		_data set[_index,-1];
		_data = _data - [-1];
	}
		else
	{
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	avanix_cash = avanix_cash + _num;
	avanix_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[avanix_trunk_vehicle] call avanix_fnc_vehInventory;
}
	else
{
	if([true,_ctrl,_num] call avanix_fnc_handleInv) then
	{
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		avanix_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[avanix_trunk_vehicle] call avanix_fnc_vehInventory;
	}
		else
	{
		hint "Dein Inventar ist voll.";
	};
};