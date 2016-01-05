/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks whether or not the vehicle is persistent or temp and sells it.
*/
private["_unit","_vehicle","_price","_cash","_vInfo"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_price = [_this,2,500,[0]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;

_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo == 0) exitWith
{
	[[1,"Das Fahrzeug ist gemietet! Du kannst das Fahrzeug nicht verkaufen!"],"avanix_fnc_broadcast",_unit,false] spawn avanix_fnc_MP;
	[["avanix_action_inUse",false],"avanix_fnc_netSetVar",_unit,false] spawn avanix_fnc_MP;
};

//Error checks
if(isNull _vehicle OR isNull _unit) exitWith 
{
	[["avanix_action_inUse",false],"avanix_fnc_netSetVar",nil,false] spawn avanix_fnc_MP;
};

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_unit = owner _unit;

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo > 0) then {
	_uid = _dbInfo select 0;
	_plate = _dbInfo select 1;

	_query = format["vehicleDead:0:%1:%2",_uid,_plate];
	_sql = [_query,1] call DB_fnc_asyncCall;
};

deleteVehicle _vehicle;
[["avanix_action_inUse",false],"avanix_fnc_netSetVar",_unit,false] spawn avanix_fnc_MP;
[["avanix_cash",_cash],"avanix_fnc_netSetVar",_unit,false] spawn avanix_fnc_MP;
[[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call avanix_fnc_numberText]],"avanix_fnc_broadcast",_unit,false] spawn avanix_fnc_MP;