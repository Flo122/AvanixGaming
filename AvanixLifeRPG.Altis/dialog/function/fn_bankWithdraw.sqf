/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint "Du kannst nicht mehr als 999.999€ abheben.";};
if(_val < 0) exitwith {};
if(!([str(_val)] call avanix_fnc_isnumeric)) exitWith {hint "Die eingegebene Zahl ist keine richtige Zahl."};
if(_val > avanix_atmcash) exitWith {hint "Du hast nicht so viel Geld auf deinem Bankkonto!"};
if(_val < 100 && avanix_atmcash > 20000000) exitWith {hint "Du kannst nicht weniger als 100€ abheben"};

avanix_cash = avanix_cash + _val;
avanix_atmcash = avanix_atmcash - _val;
hint format ["Du hast %1€ von deinem Bankkonto abgehoben.",[_val] call avanix_fnc_numberText];
[] call avanix_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

[[format ["2| %1 hat %2€ von seinem Bankkonto abgebucht.",player getVariable["realname",name player],[_val] call avanix_fnc_numberText]],"Arma3Log",false,false] call avanix_fnc_MP;