/*
    Author: alleskapot
	Edit: Avanix Gaming Community
    
    Description: Sends AAN News to the player
*/
private["_display","_message","_name"];
disableSerialization;
_message = _this select 0;
_name = _this select 1;
[parseText format["<t size='2'>Avanix News - Aktuelle Nachricht:</t>",_name],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_message]] spawn BIS_fnc_AAN;
uisleep 60;
_display = uinamespace getvariable "BIS_AAN";
_display closeDisplay 0; 