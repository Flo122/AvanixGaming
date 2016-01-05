/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Updates the Asservatenkammer Inventory
*/
private["_asservatenkammer","_containers","_query"];
_asservatenkammer = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Save vehicle inventory
_vehItems = getItemCargo _asservatenkammer;
_vehMags = getMagazineCargo _asservatenkammer;
_vehWeapons = getWeaponCargo _asservatenkammer;
_vehBackpacks = getBackpackCargo _asservatenkammer;

_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
_cargo = [_cargo] call DB_fnc_mresArray;

_query = format["asservatenkammerUpdateContainer:%1:%2",_cargo,1];
[_query,1] call DB_fnc_asyncCall;