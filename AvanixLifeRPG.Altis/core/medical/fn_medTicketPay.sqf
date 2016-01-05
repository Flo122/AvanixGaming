/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Pays the ticket.
*/
if(isnil {avanix_ticket_val} OR isNil {avanix_ticket_cop}) exitWith {};
if(avanix_cash < avanix_ticket_val) exitWith
{
	if(avanix_avanixatmcash < avanix_ticket_val) exitWith 
	{
		hint "Du hast nicht genug Geld auf deinem Bankkonto, um die Rechnung bezahlen zu können.";
		[[1,"%1 konnte die Rechnung nicht bezahlen, weil er nicht genug Geld hat.",true,[profileName]],"avanix_fnc_broadcast",avanix_ticket_cop,false] spawn avanix_fnc_MP;
		[[getPlayerUID player,profileName,"502"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
		closeDialog 0;
	};
	hint format["Du hast die Rechnung von %1€ bezahlt",[avanix_ticket_val] call avanix_fnc_numberText];
	avanix_atmcash = avanix_atmcash - avanix_ticket_val;
	avanix_ticket_paid = true;
	[[1,"%1 hat die Rechnung bezahlt.",true,[profileName]],"avanix_fnc_broadcast",avanix_ticket_cop,false] spawn avanix_fnc_MP;
	[[avanix_ticket_val,player,avanix_ticket_cop],"avanix_fnc_ticketPaid",avanix_ticket_cop,false] spawn avanix_fnc_MP;
	[[getPlayerUID player],"avanix_fnc_wantedRemove",false,false] spawn avanix_fnc_MP;
	closeDialog 0;
};

avanix_cash = avanix_cash - avanix_ticket_val;
avanix_ticket_paid = true;

[[getPlayerUID player],"avanix_fnc_wantedRemove",false,false] spawn avanix_fnc_MP;
[[0,"%1 zahlte eine Rechnung von %2€",true,[profileName,[avanix_ticket_val] call avanix_fnc_numberText]],"avanix_fnc_broadcast",east,false] spawn avanix_fnc_MP;
closeDialog 0;
[[1,"%1 hat die Rechnung bezahlt.",true,[profileName]],"avanix_fnc_broadcast",avanix_ticket_cop,false] spawn avanix_fnc_MP;
[[avanix_ticket_val,player,avanix_ticket_cop],"avanix_fnc_ticketPaid",avanix_ticket_cop,false] spawn avanix_fnc_MP;