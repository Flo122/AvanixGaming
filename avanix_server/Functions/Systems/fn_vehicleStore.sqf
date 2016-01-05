/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_unit","_trunk","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo","_impound_perm"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound_perm = [_this,3,false,[true]] call BIS_fnc_param;
if(isNull _vehicle OR isNull _unit) exitWith {avanix_impound_inuse = false; (owner _unit) publicVariableClient "avanix_impound_inuse";avanix_garage_store = false;(owner _unit) publicVariableClient "avanix_garage_store";}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];
_trunk = _vehicle getVariable["Trunk",[[],0]];
_trunk = [_trunk] call DB_fnc_mresArray;

if(count _vInfo > 0) then
{
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

//Save vehicle inventory
_vehItems = getItemCargo _vehicle;
_vehMags = getMagazineCargo _vehicle;
_vehWeapons = getWeaponCargo _vehicle;
_vehBackpacks = getBackpackCargo _vehicle;

_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
_cargo = [_cargo] call DB_fnc_mresArray;

_damage = getAllHitPointsDamage _vehicle select 2;
_damage = [_damage] call DB_fnc_mresArray;

if(_impound) then
{
	if(count _vInfo == 0) then 
	{
		avanix_impound_inuse = false;
		(owner _unit) publicVariableClient "avanix_impound_inuse";
		if(!isNil "_vehicle" && {!isNull _vehicle}) then 
		{
			deleteVehicle _vehicle;
		};
	} 
		else
	{	
		if(_impound_perm) then 
		{	
			_query = format["vehicleUpdateActivePlate:2:1:%1:%2:%3:%4:%5:%6",_trunk,_cargo,fuel _vehicle,_damage,_uid,_plate];
		} 
			else 
		{
			_query = format["vehicleUpdateActivePlate:0:1:%1:%2:%3:%4:%5:%6",_trunk,_cargo,fuel _vehicle,_damage,_uid,_plate];
		};	
		_thread = [_query,1] call DB_fnc_asyncCall;
		//waitUntil {scriptDone _thread};
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
			_radius = (((boundingBoxReal _vehicle select 0) select 2) - ((boundingBoxReal _vehicle select 1) select 2));
			_containers = nearestObjects[(getPosATL _vehicle),["Box_NATO_AmmoVeh_F"],_radius];
			{deleteVehicle _x} foreach _containers;
		};
		avanix_impound_inuse = false;
		(owner _unit) publicVariableClient "avanix_impound_inuse";
	};	
}
	else
{
	if(count _vInfo == 0) exitWith
	{
		[[1,("Mietwagen können nicht in der Garage geparkt werden.")],"avanix_fnc_broadcast",(owner _unit),false] spawn avanix_fnc_MP;
		avanix_garage_store = false;
		(owner _unit) publicVariableClient "avanix_garage_store";
	};
	
	if(_uid != getPlayerUID _unit) exitWith
	{
		[[1,("Das Fahrzeug gehört nicht dir und kann deshalb nicht in der Garage geparkt werden.")],"avanix_fnc_broadcast",(owner _unit),false] spawn avanix_fnc_MP;
		avanix_garage_store = false;
		(owner _unit) publicVariableClient "avanix_garage_store";
	};
	
	_truckext = _vehicle getVariable ["TruckExt",0];
	_query = format["vehicleUpdateActivePlate:0:0:%1:%2:%3:%4:%5:%6",_trunk,_cargo,fuel _vehicle,_damage,_uid,_plate];
	_thread = [_query,1] call DB_fnc_asyncCall;
	//waitUntil {scriptDone _thread};
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
		_radius = (((boundingBoxReal _vehicle select 0) select 2) - ((boundingBoxReal _vehicle select 1) select 2));
		_containers = nearestObjects[(getPosATL _vehicle),["Box_NATO_AmmoVeh_F"],_radius];
		{deleteVehicle _x} foreach _containers;
	};
	avanix_garage_store = false;
	(owner _unit) publicVariableClient "avanix_garage_store";
	[[1,("Das Fahrzeug wurde in der Garage geparkt.")],"avanix_fnc_broadcast",(owner _unit),false] spawn avanix_fnc_MP;
};