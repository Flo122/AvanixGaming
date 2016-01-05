/*

	Author Shinji
	Triggers if player sends the message from the new message system to another player...

*/

if (isnil "player_Send_message") then {
	player_Send_message = false;
};

if (player_Send_message) exitwith { hint "Du musst einige Sekunden warten bis du wieder eine SMS schreiben kannst!"; };

private["_mode","_reciever","_message","_index","_pos"];
_mode = [_this,0,3,[3]] call BIS_fnc_param;

_reciever = lbCurSel 2100;
_message = ctrlText 1400;

disableSerialization;
_display = findDisplay 10000;
_index =  cbChecked (_display displayCtrl 2800);
 

if ((lbText [2100,_reciever]) == profilename) exitwith {};

_sent = false;

if (!_index) then {
	_pos = [];
} else {
	_pos = getpos player;
};
if (_message == "" OR _message == "Nachricht eingeben...") exitwith {};

switch (_mode) do {
	case 0: {
		if (_reciever == -1 OR (lbText [2100,_reciever]) == "") exitwith {hint "Du musst einen Empfaenger hinzufuegen.";};	
		[[_mode, (lbText [2100,_reciever]),_message,_pos, profileName],"avanix_fnc_recieveMessage",true,false] spawn avanix_fnc_MP;
		_sent = true;
	};
	case 1: {	
		_reciever = "die Polizei";		
		[[_mode, _message,_pos, profileName],"avanix_fnc_recieveMessage",true,false] spawn avanix_fnc_MP;
		_sent = true;
	};
	case 2: {	
		_reciever ="Medic/ADAC";
		[[_mode, _message,_pos, profileName],"avanix_fnc_recieveMessage",true,false] spawn avanix_fnc_MP;
		_sent = true;
	};
	default {
		hint "Something went wrong... case sensitive has failed...!";			
	};
};

if (_sent) then 
{
	hint parseText format ["Deine Nachricht an <t color='#CD2B2B'>%1</t> ging soeben raus...", (lbText [2100,_reciever])];	
	player_Send_message = true; //for trolls who think they can troll the other players with message dumps -.-
	uisleep 5;
	player_Send_message = false;
};



