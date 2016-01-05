/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "avanix_session_time") then {avanix_session_time = false;};
if(avanix_session_time) exitWith {hint localize "STR_Session_SyncdAlready";};

switch (typeName avanix_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count avanix_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};
	
	default {_exit = true;};
};

if(!isNil "_exit") exitWith {hint localize "STR_Session_SyncCheater";};

[] call SOCK_fnc_updateRequest;
hint localize "STR_Session_SyncData";
[] spawn
{
	avanix_session_time = true;
	uisleep (5 * 60);
	avanix_session_time = false;
};
	