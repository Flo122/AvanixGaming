/*
	File: fn_useBag
	Author: DerOnkel/Avanix Gaming Community
	Email: info@avanix-gaming.de
	
	Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!   
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if(!(_unit getVariable "gagged")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
_unit setVariable["gagged",false,true];