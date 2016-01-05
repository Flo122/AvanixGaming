/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Load the Hideouts to Server
*/
diag_log "DELETE HIDEOUT";
private["_queryResult","_query","_gangName","_tickTime"];
_gangName = [_this,0,"",[""]] call BIS_fnc_param;
	
_query = format["deleteHideout:%1:%2:%3:%4:%5:%6:%7","","",[],0,[],[],_gangName];

uisleep 0.3;
_queryResult = [_query,2] call DB_fnc_asyncCall;
