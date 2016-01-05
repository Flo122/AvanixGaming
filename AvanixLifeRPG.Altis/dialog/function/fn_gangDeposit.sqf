#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint "Du kannst nicht mehr als 999.999€ gleichzeitig einzahlen.";};
if(_value < 0) exitWith {};
if(!([str(_value)] call avanix_fnc_isnumeric)) exitWith {hint "Die eingegebene Zahl ist keine richtige Zahl."};
if(_value > avanix_atmcash) exitWith {hint "Du hast nicht genug Geld auf deinem Bankkonto."};

__SUB__(avanix_atmcash,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format["Du hast %1€ auf dein Gang Konto überwiesen.",[_value] call avanix_fnc_numberText];
[] call avanix_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn avanix_fnc_MP;
