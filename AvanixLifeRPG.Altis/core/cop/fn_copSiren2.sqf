/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren2"}) exitWith {};

if(!(_vehicle getVariable "siren2")) exitWith {};
if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren2",false,true]};
if(!alive _vehicle) exitWith {};
if(isNull _vehicle) exitWith {};
_vehicle say3D "Sirene_Cop2";
uisleep 3;
if(!(_vehicle getVariable "siren2")) exitWith {};