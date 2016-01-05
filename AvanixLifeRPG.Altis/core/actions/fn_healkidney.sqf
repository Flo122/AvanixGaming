/*
	File: fn_healkidney.sqf
	Author: Audacious
	
	Description:
	Heal People without kidney
*/
if(avanix_cash < 100000) exitWith {hint format[localize "STR_NOTF_HS_NoCash",100000];};  //Check for Cash
if(!(player getVariable ["missingOrgan",FALSE])) exitWith {hint "Du hast noch deine Niere und brauchst keine OP!"};  //Check if kidney lose
titleText[localize "STR_NOTF_HS_Operation","PLAIN"];  //make a text for operation
uisleep 15;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};  //distance fail
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];  //Operation done
player setVariable["missingOrgan",false,true];   //give player kidney
uisleep 0.1; //little wait
player setdamage 0;  //heal player and thirst, hunger, fatique set of 100
avanix_thirst = 100;
avanix_hunger = 100;
player setFatigue .5;
avanix_cash = avanix_cash - 100000;  //take cash from player