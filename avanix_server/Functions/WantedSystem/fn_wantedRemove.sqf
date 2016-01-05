/*
	File: fn_wantedRemove.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes a person from the wanted list.
*/
private["_uid","_index"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {}; //Bad data

_index = [_uid,avanix_wanted_list] call TON_fnc_index;
if(_index == -1) exitWith {};
avanix_wanted_list set[_index,-1];
avanix_wanted_list = avanix_wanted_list - [-1];