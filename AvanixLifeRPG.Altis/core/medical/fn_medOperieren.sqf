/*
	File: Niere wieder einsetzen
	Author: Backer
	Edit: Avanix Gaming Community
	
	Discription:
	Notarzt operiert Spieler, sodass er mit einer Niere weiterleben kann
*/
private["_unit"];

_unit = cursorTarget;

if(!(_unit getVariable ["missingOrgan",FALSE])) exitWith {hint "Dieser Spieler hat noch seine Nieren und braucht keine OP!"};  //Check if kidney lose
if (side player == independent) then {hint "Sie operieren den Spieler, sodass er mit einer Niere weiterleben kann!"}; 
uisleep 15;
if(player distance (_this select 0) > 5) exitWith {hint "Sie sind zuweit weg, um diese Person zu operieren!"};
if (side player == independent) then {hint "Sie haben die Person erfolgreich operiert, und erhalten eine Belohnung dafür!"}; 
_unit setVariable["missingOrgan",false,true];   //ER WILL weiterleben
uisleep 0.1; //little wait
_unit setdamage 0;  //SPIELER BEKOMMT WIEDER alle Leben und essen und wasser
_unit setFatigue .5;
avanix_cash = avanix_cash + 15000;  