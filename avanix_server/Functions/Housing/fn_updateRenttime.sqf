/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the storage for a house blah blah
*/
private["_house","_trunkData","_houseID","_inventory","_houseID"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};

_renttime = _house getVariable["renttime",""];
_houseID = _house getVariable["house_id",-1];

if(_houseID == -1) exitWith {};

_query = format["housingUpdateRenttime:%1:%2",_renttime,_houseID];
_tickTime = diag_tickTime;
_queryResult = [_query,1] call DB_fnc_asyncCall;

diag_log "------------- UPDATE RENTTIME -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";