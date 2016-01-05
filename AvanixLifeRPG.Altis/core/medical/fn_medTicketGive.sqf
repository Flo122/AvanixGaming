/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {avanix_ticket_unit}) exitWith {hint "Person to ticket is nil"};
if(isNull avanix_ticket_unit) exitWith {hint "Person to ticket doesn't exist."};
_val = ctrlText 2652;
if(!([_val] call fnc_isnumber)) exitWith {hint "Falsches Nummernformat."};
if((parseNumber _val) > 100000) exitWith {hint "Rechnungen können nicht mehr wie 100.000 € betragen!"};
[[0,format["%1 hat %3 eine Rechnung ueber %2€ ausgestellt.",profileName,[(parseNumber _val)] call avanix_fnc_numberText,avanix_ticket_unit getVariable["realname",name avanix_ticket_unit]]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
[[player,(parseNumber _val)],"avanix_fnc_medTicketPrompt",avanix_ticket_unit,false] spawn avanix_fnc_MP;
closeDialog 0;