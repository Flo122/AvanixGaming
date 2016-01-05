/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Starting to lose track on shit I wrote a year ago..
*/
private["_vehicle","_weight","_used"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;
_weight = [(typeOf _vehicle)] call avanix_fnc_vehicleWeightCfg;
_ext = _vehicle getVariable ["TruckExt",0];
if(_ext < 4) then{
	_weight = _weight + (200*_ext);
};
if(isNil "_used") then {_used = 0};
[_weight,_used];