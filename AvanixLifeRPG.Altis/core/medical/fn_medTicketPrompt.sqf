/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_cop","_val","_display","_control"];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
_cop = _this select 0;
if(isNull _cop) exitWith {};
_val = _this select 1;

createDialog "avanix_rechnung_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};
_display = findDisplay 2600;
_control = _display displayCtrl 2601;
avanix_ticket_paid = false;
avanix_ticket_val = _val;
avanix_ticket_cop = _cop;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>%1 hat dir eine Rechnung ueber %2€ ausgestellt",_cop getVariable["realname",name _cop],_val];

[] spawn
{
	disableSerialization;
	waitUntil {avanix_ticket_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !avanix_ticket_paid) then
	{
		[[0,format["%1 hat die Rechnung zerrissen.",profileName]],"avanix_fnc_broadcast",civilian,false] spawn avanix_fnc_MP;
		[[1,format["%1 hat die Rechnung zerrissen.",profileName]],"avanix_fnc_broadcast",avanix_ticket_cop,false] spawn avanix_fnc_MP;
		[[getPlayerUID player,profileName,"502"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
	};
};