#include <macro.h>
/*
	Author: ME
	
	Description:
	Geld vom Gangkonto abheben
*/
private["_value","_ownerID"];
_value = parseNumber(ctrlText 2702);
__SUB__(_gFund,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];

_ownerID = grpPlayer getVariable["gang_owner",""];
if(_ownerID != steamid) exitWith {hint "Du bist nicht berechtigt über die Gangkasse zu verfügen!"};

if(_value > 999999) exitWith {hint "Du kannst nicht mehr als 999.999€ mit einmal abheben!";};
if(_value < 0) exitWith {};
if(!([str(_value)] call avanix_fnc_isnumeric)) exitWith {hint "Falsches Nummernformat"};
if(_value > _gFund) exitWith {hint "Du hast nicht genug Geld am Gang Konto!"};
if(_value < 100 && _gFund > 20000000) exitWith {hint "Du kannst nicht weniger als 100€ abheben"};


avanix_cash = avanix_cash + _value;
_gFund = _gFund - _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format["Du hast %1€ von deinem Gangkonto abgehoben",[_value] call avanix_fnc_numberText];
[] call avanix_fnc_atmMenu;
[] call SOCK_fnc_updateRequest;
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn avanix_fnc_MP;
