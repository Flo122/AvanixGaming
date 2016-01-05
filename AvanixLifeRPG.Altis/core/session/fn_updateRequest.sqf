/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,avanix_cash,avanix_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach avanix_licenses;
_packet pushBack _array;

[] call avanix_fnc_saveGear;
_packet pushBack avanix_gear;
switch (playerSide) do {
	case civilian: {
		_packet pushBack avanix_is_arrested;
	};
};

[_packet,"DB_fnc_updateRequest",false,false] spawn avanix_fnc_MP;