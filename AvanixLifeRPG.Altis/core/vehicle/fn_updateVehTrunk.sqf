/*
	File: fn_updateVehTrunk.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
*/
private ["_vehicle", "_trunk", "_weight","_shortname","_count"];
_vehicle = _this select 0;
_trunk = _vehicle getVariable ["Trunk", []];

if(count _trunk == 0) then
{
	_trunk = [[],0];
};

_weight = 0;

{
	_shortname = _x select 0;
	_count = _x select 1;
	_weight = _weight + ( [_shortname] call avanix_fnc_itemWeight ) * _count;
} forEach (_trunk select 0);

_trunk set [1,_weight];
_vehicle setVariable ["Trunk", _trunk, true];