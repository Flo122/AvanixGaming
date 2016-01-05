/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Updates the Hideouts after Captured
*/
private["_owner","_gangName","_members","_id","_query","_queryResult"];
_owner = [_this,0,"",[""]] call BIS_fnc_param;
_gangName = [_this,1,"",[""]] call BIS_fnc_param;
_group = [_this,2,grpNull,[grpNull]] call BIS_fnc_param;
_id = [_this,3,-1,[1]] call BIS_fnc_param;

_gangName = [_gangName] call DB_fnc_mresString;
_members = [(_group getVariable "gang_members")] call DB_fnc_mresArray;

_query = format["updateHideout:%1:%2:%3:%4:%5",_owner,_gangName,_members,1,_id];

uisleep 0.3;
_queryResult = [_query,2] call DB_fnc_asyncCall;