/*
file:fn_alkoholdrugtester 
author:[midgetgrimm] 
Edit: Avanix Gaming Community
edited by nic_noc for testing drugusing on civs
*/ 

private["_cop","_drinky","_drugy"]; 
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
if(isNull _cop) exitWith {}; 

//avanix_drink und avanix_drug muessen spaeter noch in configuration.sqf eingefügt werden
_drinky = avanix_drink; 
_drugy = avanix_drug; 

//Den Wert > 0.4 kann man natuerlich aendern
if(_drinky > 0.4) then { 

	[[1,format["Alkoholtest %1 \n\n Promille: %2 \n\n Nicht im legalen Bereich! ",name player,[_drinky] call avanix_fnc_numberText]],"avanix_fnc_broadcast",_cop,false] spawn avanix_fnc_MP; 
} 
	else 
{ 
	[[1,format["Alkoholtest %1 \n\n Promille: %2 \n\n Im legalen Bereich! ",name player,[_drinky] call avanix_fnc_numberText]],"avanix_fnc_broadcast",_cop,false] spawn avanix_fnc_MP; 
}; 

//Beide Tests werden nacheinander (5 Sekunden unterschied) angezeigt - man testet also quasi beides in einem
uisleep 5; 

//Wenn > 0 dann hat der Spieler irgendwas genommen - also ist es dann ein positives Ergebnis
if(_drugy > 0) then { 

	[[1,format["Drogentest %1 \n\n Ergebnis: Positiv \n\n Der Spieler steht unter Drogeneinfluss! ",name player]],"avanix_fnc_broadcast",_cop,false] spawn avanix_fnc_MP; 
} 
	else 
{ 
[[1,format["Drogentest %1 \n\n Ergebnis: Negativ \n\n Der Spieler ist clean! ",name player]],"avanix_fnc_broadcast",_cop,false] spawn avanix_fnc_MP; 
};