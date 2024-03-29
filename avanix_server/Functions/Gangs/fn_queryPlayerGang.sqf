/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Queries to see if the player belongs to any gang.
*/
private["_query","_queryResult"];

_query = format["gangInfo:%2%1%2",_this,"%"];
_queryResult = [_query,2] call DB_fnc_asyncCall;

if(count _queryResult != 0) then {
	_tmp = [_queryResult select 5] call DB_fnc_mresToArray;
	if(typeName _tmp == "STRING") then {_tmp = call compile format["%1",_tmp];};
	_queryResult set[5, _tmp];
};
missionNamespace setVariable[format["gang_%1",_this],_queryResult];