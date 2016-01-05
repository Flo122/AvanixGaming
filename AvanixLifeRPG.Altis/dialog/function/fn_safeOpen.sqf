/*	
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
avanix_safeObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull avanix_safeObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((avanix_safeObj getVariable["safe",-1]) < 1) exitWith {hint "Der Tresor ist leer!";};
if((avanix_safeObj getVariable["inUse",false])) exitWith {hint "Jemand greift bereits auf den Tresor zu.."};
if({side _x == west} count playableUnits < 4) exitWith {hint "Es müssen 5 oder mehr Polizisten online sein, um fortfahren zu können."};
if(!createDialog "Federal_Safe") exitWith {"Erstellen des Dialogs gescheitert"};
disableSerialization;
ctrlSetText[3501,("Tresorinventar")];
[avanix_safeObj] call avanix_fnc_safeInventory;
avanix_safeObj setVariable["inUse",true,true];
[avanix_safeObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};