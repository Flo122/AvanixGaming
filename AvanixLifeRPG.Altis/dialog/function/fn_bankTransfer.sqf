/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint "Du hast niemanden für den Transfer ausgewählt."};
if(isNil "_unit") exitWith {hint "Der Spieler scheint nicht zu existieren?"};
if(_val > 999999) exitWith {hint "Du kannst nicht mehr als 999.999€ überweisen.";};
if(_val < 0) exitwith {};
if(!([str(_val)] call avanix_fnc_isnumeric)) exitWith {hint "Die eingegebene Zahl ist keine richtige Zahl."};
if(_val > avanix_atmcash) exitWith {hint "Du hast nicht so viel Geld auf deinem Bankkonto!"};
_tax = [_val] call avanix_fnc_taxRate;
if((_val + _tax) > avanix_atmcash) exitWith {hint format["Du hast nicht genug Geld auf deinem Konto, es kostet %2€, um %1€ zu überweisen.",_val,_tax]};

avanix_atmcash = avanix_atmcash - (_val + _tax);

[[_val,profileName],"TON_fnc_clientWireTransfer",_unit,false] spawn avanix_fnc_MP;
[[format ["2| %1 hat %2 auf sein Konto eingezahlt",player getVariable["realname",name player],[_value] call avanix_fnc_numberText]],"Arma3Log",false,false] call avanix_fnc_MP;
[] call avanix_fnc_atmMenu;
hint format["Du hast %1€ an %2 überwiesen. Eine Gebühr von %3€ wurde verrechnet.",[_val] call avanix_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call avanix_fnc_numberText];
[1] call SOCK_fnc_updatePartial;