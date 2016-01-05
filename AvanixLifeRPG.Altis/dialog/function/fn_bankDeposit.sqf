/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint "Du kannst nicht mehr als 999.999€ gleichzeitig einzahlen";};
if(_value < 0) exitWith {};
if(!([str(_value)] call avanix_fnc_isnumeric)) exitWith {hint "Die eingegebene Zahl ist keine richtige Zahl."};
if(_value > avanix_cash) exitWith {hint "Du hast nicht so viel Geld bei dir."};

avanix_cash = avanix_cash - _value;
avanix_atmcash = avanix_atmcash + _value;

hint format["Du hast %1€ auf dein Bankkonto überwiesen",[_value] call avanix_fnc_numberText];
[] call avanix_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

[[format["2| %1 hat %2 eine Summe von %3 überwiesen. Kontostand von %1 ist nun: %4.",player getVariable["realname",name player],_unit getVariable["realname",name _unit],[_val] call avanix_fnc_numberText,[BANK] call avanix_fnc_numberText]],"Arma3Log",false,false] call avanix_fnc_MP;