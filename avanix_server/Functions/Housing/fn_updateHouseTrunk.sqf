/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the storage for a house blah blah
*/
private["_house","_trunkData","_houseID","_inventory","_houseID"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};

_trunkData = _house getVariable["Trunk",[[],0]];
_houseID = _house getVariable["house_id",-1];
_inventory = _house getVariable["avanix_inventory",[[],0]];

if(_houseID == -1) exitWith {};

_trunkData = [_trunkData] call DB_fnc_mresArray;
_inventory = [_inventory] call DB_fnc_mresArray;
_query = format["housingUpdateInventory:%1:%2:%3",_trunkData,_inventory,_houseID];
[_query,1] call DB_fnc_asyncCall;