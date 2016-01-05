#include <macro.h>
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_dialog","_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side"];
disableSerialization;

if(__GETC__(avanix_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

_dialog = findDisplay 2001;
_inv = _dialog displayCtrl 2005;
_lic = _dialog displayCtrl 2014;
_mstatus = _dialog displayCtrl 2015;
_struct = "";
lbClear _inv;
_mstatus ctrlSetStructuredText parseText format["<img size='1.3' image='textures\icons\bank.paa'/> <t size='0.8px'>%1€</t><br/><img size='1.2' image='textures\icons\money.paa'/> <t size='0.8'>%2€</t>",[avanix_atmcash] call avanix_fnc_numberText,[avanix_cash] call avanix_fnc_numberText];
ctrlSetText[2009,format["Gewicht: %1 / %2", avanix_carryWeight, avanix_maxWeight]];
{
	_str = [_x] call avanix_fnc_varToStr;
	_shrt = [_x,1] call avanix_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
	};
} foreach avanix_inv_items;
{
	if((_x select 1) == _side) then
	{
		_str = [_x select 0] call avanix_fnc_varToStr;
		_val = missionNamespace getVariable (_x select 0);
		if(_val) then
		{
			_struct = _struct + format["%1<br/>",_str];
		};
	};
} foreach avanix_licenses;

if(_struct == "") then
{
	_struct = "Keine Lizenzen";
};

_lic ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];