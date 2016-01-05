#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private["_ctrl","_num"];
disableSerialization;
_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;

//Error checks
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Ungültiges Zahlenformat.";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst nichts unter 1 eingeben!";};
if(_ctrl != "goldbar") exitWith {hint "Du kannst nur Goldbarren in den Tresor legen."};
if(_num > avanix_inv_goldbar) exitWith {hint format["Du hast keine %1 Goldbarren",_num];};

//Store it.
if(!([false,_ctrl,_num] call avanix_fnc_handleInv)) exitWith {hint "Gegenstände konnten nicht von deinem Inventar in den Tresor gepackt werden.";};
_safeInfo = avanix_safeObj getVariable["safe",0];
avanix_safeObj setVariable["safe",_safeInfo + _num,true];

[avanix_safeObj] call avanix_fnc_safeInventory;