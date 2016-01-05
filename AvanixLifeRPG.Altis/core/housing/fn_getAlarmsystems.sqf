#include <macro.h>
/*
	File:fn_getAlarmsystems.sqf
	Author: Wolfgang Bahmüller
	
	Description:
    Returns all alarmsystems of the house
	
*/

private ["_house","_alarmsystems","_inventory"];

_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitwith {[]};

_alarmsystems = [];
_inventory = _house getVariable ["avanix_inventory", []];
{
    if(_x select 0 == "alarmsystem") then
    {
        _alarmsystems set [count _alarmsystems, "alarmsystem"];
    };
    
    if(_x select 0 == "alarmsystemGPS") then
    {
        _alarmsystems set [count _alarmsystems, "alarmsystemGPS"];
    };
    
    if(_x select 0 == "alarmsystemDog") then
    {
        _alarmsystems set [count _alarmsystems, "alarmsystemDog"];
    };
    
    if(_x select 0 == "alarmsystemGuard") then
    {
        _alarmsystems set [count _alarmsystems, "alarmsystemGuard"];
    };
    
    if(_x select 0 == "metalGrilledWindow") then
    {
        _alarmsystems set [count _alarmsystems, "metalGrilledWindow"];
    };
} foreach _inventory;

_alarmsystems