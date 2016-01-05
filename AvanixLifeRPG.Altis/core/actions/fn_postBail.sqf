/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(avanix_bail_paid) exitWith {};
if(isNil {avanix_bail_amount}) then {avanix_bail_amount = 3500;};
if(!isNil "avanix_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(avanix_atmcash < avanix_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",avanix_bail_amount];};

avanix_atmcash = avanix_atmcash - avanix_bail_amount;
avanix_bail_paid = true;
[[0,"STR_NOTF_Bail_Bailed",true,[profileName]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;