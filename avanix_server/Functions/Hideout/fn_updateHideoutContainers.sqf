/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Updates the HideoutInventory
*/
private["_hideout","_hideoutID","_containers","_query"];
_hideout = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_hideoutID = [_this,1,"",[""]] call BIS_fnc_param;

//Save vehicle inventory
_vehItems = getItemCargo _hideout;
_vehMags = getMagazineCargo _hideout;
_vehWeapons = getWeaponCargo _hideout;
_vehBackpacks = getBackpackCargo _hideout;

_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
_cargo = [_cargo] call DB_fnc_mresArray;

_query = format["hideoutUpdateContainer:%1:%2",_cargo,_hideoutID];
[_query,1] call DB_fnc_asyncCall;