#include <macro.h>
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_type","_ownerID"];

if(!avanix_use_atm) exitWith
{
	hint localize "STR_Shop_ATMRobbed";
};

if(!dialog) then
{
	if(!(createDialog "avanix_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;
_ownerID = grpPlayer getVariable["gang_owner",""];

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='textures\icons\bank.paa'/> %1€<br/><img size='1.6' image='textures\icons\money.paa'/> %2€",[avanix_atmcash] call avanix_fnc_numberText,[avanix_cash] call avanix_fnc_numberText];

{
	if(alive _x) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

if(isNil {(grpPlayer getVariable "gang_bank")}) then {(getControl(2700,2705)) ctrlEnable false;};

if(_ownerID != steamid) then {(getControl(2700,2706)) ctrlEnable false;};