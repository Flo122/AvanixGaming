/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in selling the house, sets the owned to 0 and will cleanup with a 
	stored procedure on restart.
*/
private["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {systemChat ":SERVER:sellHouse: House is null";};

_houseID = _house getVariable["house_id",-1];
if(_houseID == -1) then {
	_housePos = getPosATL _house;
	_ownerID = (_house getVariable "house_owner") select 0;
	_query = format["housingSellHouse:%1:%2:%3",[],_ownerID,_housePos];
} else {
	_query = format["housingSellHouse2:%1",_houseID];
};

_house setVariable["house_id",nil,true];
_house setVariable["house_owner",nil,true];
_radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2));
_containers = nearestObjects[(getPosATL _house),["Box_IND_Grenades_F","B_supplyCrate_F"],_radius];
{deleteVehicle _x} foreach _containers;
[_query,1] call DB_fnc_asyncCall;
_house setVariable["house_sold",nil,true];

//Housing Bugfix
uisleep 10;
["deleteOldHouses",1] call DB_fnc_asyncCall;