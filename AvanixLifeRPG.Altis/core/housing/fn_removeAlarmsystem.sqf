#include <macro.h>
/*
	File:fn_removeAlarmsystem.sqf
	Author: Wolfgang Bahmüller
	
	Description:
    removes the alarmsystem from the house
*/
private ["_house","_alarmsystem","_inventory","_idx"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_alarmsystem = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _house) exitwith {[]};
if(_alarmsystem == "") exitwith {[]};

_inventory = _house getVariable ["avanix_inventory", []];

_idx = 0;
{
    if(_x select 0 == _alarmsystem) exitWith
    {
        _inventory set [_idx, -1];
        _inventory = _inventory - [-1];
    };
    _idx = _idx + 1;
} foreach _inventory;

_house setVariable["avanix_inventory", _inventory, true];
[[_house, _inventory, playerSide],"TON_fnc_updateHouseTrunk",false,false] spawn avanix_fnc_MP;