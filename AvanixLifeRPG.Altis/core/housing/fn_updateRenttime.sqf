/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_house","_val","_oldrenttime","_rentprice","_uid","_owners"];
_house = getPos player nearestObject "House_F"; 
_val = ctrlText 2101;
_owners = _house getVariable["house_owner", []];
_uid = getPlayerUID player;

if (!(_uid in _owners)) exitWith { hint "Das ist nicht dein Haus!"; };

if(!([_val] call TON_fnc_isnumber)) exitWith {hint "Falsches Nummernformat."};
if((parseNumber _val) > 14) exitWith {hint "Du kannst das Haus nicht länger als 14 Tage mieten!"};
if((parseNumber _val) < 1) exitWith {hint "Du kannst das Haus nicht weniger als 1 Tag mieten!"};

_oldrenttime = _house getVariable["renttime",""];
if(_oldrenttime > 5) exitWith {hint "Du kannst deinen Mietvertrag erst 5 Tage vor dem auslaufen des Vertrags verlängern!";};
_rentprice = (_oldrenttime) + (parseNumber _val);

_house setVariable["renttime",_rentprice,true];
[[_house],"TON_fnc_updateRenttime",false,false] spawn avanix_fnc_MP;