/*
    File: fn_sendChannel.sqf
    Author: alleskapot & Lifted
    Thanks again for all the help alleskapot!
	Edit: Avanix Gaming Community
    Description:
    Ermöglicht senden bzw. die Abfrage des Geschriebenen.
*/
private["_message"];
disableSerialization;
waitUntil {!isnull (findDisplay 9000)};
if (avanix_cash <= 6000 ) exitWith { systemChat "Du brauchst 6.000€ um eine Nachricht zu senden!"; };
if (playerSide != civilian ) exitWith { systemChat "Du musst ein Zivilist sein!"; };
avanix_cash = avanix_cash - 6000;
_message = ctrlText 9001;
[[3,format ["%1 sendete folgende Nachricht von AvanixNews an alle: %2",name player,_message]],"avanix_fnc_broadcast",true,false] call avanix_fnc_MP;
avanix_channel_send = false;
[] spawn
{
    uisleep 600;
    avanix_channel_send = true;
};