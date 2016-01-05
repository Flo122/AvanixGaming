/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(createDialog "avanix_rechnung_give")) exitWith {hint "Konte Rechnungssysteam nicht laden"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[8751,format["Rechnung an %1",_unit getVariable["realname",name _unit]]];
avanix_ticket_unit = _unit;