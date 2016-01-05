/*

	Author Shinji
	Script extract name of reciever and if its not reciever exit..

*/
private["_mode","_reciever","_message","_name","_pos","_recieved"];
_mode = [_this,0,0,["FEHLER"]] call BIS_fnc_param;

_recieved = true;


switch (_mode ) do {
	case 0 : {		
		_reciever = [_this,1,"",[""]] call BIS_fnc_param;
		_message = [_this,2,"",[""]] call BIS_fnc_param;
		_pos = [_this,3,[],[""]] call BIS_fnc_param;
		_name = [_this,4,"",[""]] call BIS_fnc_param;
		
		if (profilename != _reciever ) then {_recieved = false;};
	};
	case 1: {			
		_message = [_this,1,"",[""]] call BIS_fnc_param;
		_pos = [_this,2,[],[""]] call BIS_fnc_param;
		_name = [_this,3,"",[""]] call BIS_fnc_param;		
		if (side player != west) then {_recieved = false;};	
	};
	case 2: {		
		_message = [_this,1,"",[""]] call BIS_fnc_param;
		_pos = [_this,2,[],[""]] call BIS_fnc_param;
		_name = [_this,3,"",[""]] call BIS_fnc_param;		
		if (side player != resistance) then {_recieved = false;};	
	};
	default {
		hint "Something went wrong... please contact an admin!";	
		_recieved = false;
	};

};

if (!_recieved) exitwith {};

switch (side player) do {

	case west: {	
		hintsilent parseText format ["<img image='textures\icons\messagenew.paa'/><br/>  <br/> <t color='#CD2B2B'>%1 </t>hat einen Notruf abgesetzt, er bittet um schnelle Hilfe! Inhalt: <br/> %2", _name,_message];
	};
	case resistance: {
		hintsilent parseText format ["<img image='textures\icons\messagenew.paa'/><br/>  <br/> <t color='#CD2B2B'>%1 </t>hat einen Notruf abgesetzt, er bittet um schnelle Hilfe!", _name];
	};
	case civilian: {
		hintsilent parseText format ["<img image='textures\icons\messagenew.paa'/><br/>  <br/> <t color='#CD2B2B'>Nachricht von: %1 </t> Inhalt: <br/> %2", _name,_message];
	};

};

avanix_names pushback _name;
avanix_messages pushback _message;
avanix_positions pushback _pos;