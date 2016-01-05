/*
	File: fn_useBag
	Author: DerOnkel/Avanix Gaming Community
	Email: info@avanix-gaming.de
	
	Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!   
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; // Not Valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "gagged")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
 
_unit setVariable["gagged",true,true];
 
[[player],"avanix_fnc_bagUseAction",_unit,false] spawn avanix_fnc_MP;
hint format["Du hast %1 ruhig gestellt.", _unit getVariable["realname",_unit]];