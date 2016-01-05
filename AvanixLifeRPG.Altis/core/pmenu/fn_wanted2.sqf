private["_unit","_amount"];

ctrlShow[2001,false];
if((lbCurSel 9902) == -1) exitWith {hint "Niemand markiert!";ctrlShow[2001,true];};
_unit = lbData [9902,lbCurSel 9902];
_unit = call compile format["%1",_unit];
_amount = lbData [9991,lbCurSel 9991];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
//if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

[[1,format["Fahndungsmitteilung: \n%1\n wird von der Polizei gesucht.",name _unit,_amount,getPlayerUID _unit]],"avanix_fnc_broadcast",nil,false] spawn avanix_fnc_MP;

[[getPlayerUID _unit,name _unit,_amount],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;