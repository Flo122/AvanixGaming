#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private["_action","_gangName"];
_gangName = (group player) getVariable "gang_name";

_action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint localize "STR_GNOTF_DisbandGangPro";
	[[grpPlayer],"TON_fnc_removeGang",false,false] spawn avanix_fnc_MP;
	[[_gangName],"TON_fnc_deleteHideout",false,false] spawn avanix_fnc_MP;
} else {
	hint localize "STR_GNOTF_DisbandGangCanc";
};