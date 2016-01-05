/*
	File: fn_safeInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Fills up the safes inventory.
*/
private["_safe","_tInv","_pInv","_safeInfo","_str","_shrt"];
_safe = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _safe) exitWith {closeDialog 0;};
disableSerialization;

_tInv = (findDisplay 3500) displayCtrl 3502;
lbClear _tInv;

_safeInfo = _safe getVariable["safe",-1];
if(_safeInfo < 1) exitWith {closeDialog 0; hint "Der Tresor ist leer!";};

_str = ["avanix_inv_goldbar"] call avanix_fnc_varToStr;
_shrt = ["avanix_inv_goldbar",1] call avanix_fnc_varHandle;
_tInv lbAdd format["[%1] - %2",_safeInfo,_str];
_tInv lbSetData [(lbSize _tInv)-1,_shrt];