/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Inserts the gang into the database.
*/
private["_ownerID","_uid","_gangName","_query","_queryResult","_gangMembers","_group"];
_ownerID = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_gangName = [_this,2,"",[""]] call BIS_fnc_param;
_group = group _ownerID;

if(isNull _ownerID OR _uid == "" OR _gangName == "") exitWith {}; //Fail

_ownerID = owner _ownerID;
_gangName = [_gangName] call DB_fnc_mresString;
_query = format["gangNameSelectID:%1:%2",_gangName,1];
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if(count _queryResult != 0) exitWith {
	[[1,"Es gibt bereits eine gang mit diesem Namen, bitte wähle einen anderen Namen."],"avanix_fnc_broadcast",_ownerID,false] spawn avanix_fnc_MP;
	[["avanix_action_gangInUse",nil,missionNamespace],"avanix_fnc_netSetVar",_ownerID,false] spawn avanix_fnc_MP;
};

_query = format["gangIDPlayer:%2%1%2",_uid,"%"];
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if(count _queryResult != 0) exitWith {
	[[1,"Du bist bereits in einer Gang, verlasse zuerst deine alte Gang!"],"avanix_fnc_broadcast",_ownerID,false] spawn avanix_fnc_MP;
	[["avanix_action_gangInUse",nil,missionNamespace],"avanix_fnc_netSetVar",_ownerID,false] spawn avanix_fnc_MP;
};

//Check to see if a gang with that name already exists but is inactive.
_query = format["gangNameSelectID:%1:%2",_gangName,0];
_queryResult = [_query,2] call DB_fnc_asyncCall;
_gangMembers = [[_uid]] call DB_fnc_mresArray;

if(count _queryResult != 0) then {
	_query = format["gangUpdate:%1:%2:%3",_uid,_gangMembers,(_queryResult select 0)];
} else {
	_query = format["gangInsert:%1:%2:%3",_uid,_gangName,_gangMembers];
};
_queryResult = [_query,1] call DB_fnc_asyncCall;

_group setVariable["gang_name",_gangName,true];
_group setVariable["gang_owner",_uid,true];
_group setVariable["gang_bank",0,true];
_group setVariable["gang_maxMembers",8,true];
_group setVariable["gang_members",[_uid],true];
[[_group],"avanix_fnc_gangCreated",_ownerID,false] spawn avanix_fnc_MP;

uisleep 0.35;
_query = format["gangNameSelectID:%1:%2",_uid,1];
_queryResult = [_query,2] call DB_fnc_asyncCall;

_group setVariable["gang_id",(_queryResult select 0),true];
