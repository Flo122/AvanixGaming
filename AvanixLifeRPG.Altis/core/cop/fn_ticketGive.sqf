/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {avanix_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull avanix_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 200000) exitWith {hint localize "STR_Cop_TicketOver100"};
[[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call avanix_fnc_numberText,avanix_ticket_unit getVariable["realname",name avanix_ticket_unit]]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
[[player,(parseNumber _val)],"avanix_fnc_ticketPrompt",avanix_ticket_unit,false] spawn avanix_fnc_MP;
closeDialog 0;