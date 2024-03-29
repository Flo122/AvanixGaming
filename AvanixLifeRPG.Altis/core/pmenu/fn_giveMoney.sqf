/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "No one was selected!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

[[format["2| %1 hat %2 einen Betrag von %4 Gegeben.",player getVariable["realname",name player],_unit getVariable["realname",name _unit],[_val] call avanix_fnc_numberText,[CASH] call avanix_fnc_numberText]],"Arma3Log",false,false] call avanix_fnc_MP;

//A series of checks *ugh*
if(!avanix_use_atm) exitWith {hint "You recently robbed the bank! You can't give money away just yet.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";ctrlShow[2001,true];};
if(parseNumber(_amount) > avanix_cash) exitWith {hint "You don't have that much to give!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};
hint format["You gave %1€ to %2",[(parseNumber(_amount))] call avanix_fnc_numberText,_unit getVariable["realname",name _unit]];
avanix_cash = avanix_cash - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"avanix_fnc_receiveMoney",_unit,false] spawn avanix_fnc_MP;
[] call avanix_fnc_p_updateMenu;

ctrlShow[2001,true];