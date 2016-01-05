/*
	File: fn_wantedPerson.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Fetches a specific person from the wanted array.
*/
private["_unit","_index"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {[]};

_index = [getPlayerUID _unit,avanix_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	avanix_wanted_list select _index;
}
	else
{
	[];
};
