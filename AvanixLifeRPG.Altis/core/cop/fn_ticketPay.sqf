/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {avanix_ticket_val} OR isNil {avanix_ticket_cop}) exitWith {};
if(avanix_cash < avanix_ticket_val) exitWith
{
	if(avanix_atmcash < avanix_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]],"avanix_fnc_broadcast",avanix_ticket_cop,false] spawn avanix_fnc_MP;
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[avanix_ticket_val] call avanix_fnc_numberText];
	avanix_atmcash = avanix_atmcash - avanix_ticket_val;
	avanix_ticket_paid = true;
	[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[avanix_ticket_val] call avanix_fnc_numberText]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;
	[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"avanix_fnc_broadcast",avanix_ticket_cop,false] spawn avanix_fnc_MP;
	[[avanix_ticket_val,player,avanix_ticket_cop],"avanix_fnc_ticketPaid",avanix_ticket_cop,false] spawn avanix_fnc_MP;
	[[getPlayerUID player],"avanix_fnc_wantedRemove",false,false] spawn avanix_fnc_MP;
	closeDialog 0;
};

avanix_cash = avanix_cash - avanix_ticket_val;
avanix_ticket_paid = true;

[[getPlayerUID player],"avanix_fnc_wantedRemove",false,false] spawn avanix_fnc_MP;
[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[avanix_ticket_val] call avanix_fnc_numberText]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;
closeDialog 0;
[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"avanix_fnc_broadcast",avanix_ticket_cop,false] spawn avanix_fnc_MP;
[[avanix_ticket_val,player,avanix_ticket_cop],"avanix_fnc_ticketPaid",avanix_ticket_cop,false] spawn avanix_fnc_MP;