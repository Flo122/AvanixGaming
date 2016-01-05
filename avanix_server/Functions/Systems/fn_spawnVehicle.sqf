/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_vehicle","_nearVehicles","_name","_side","_tickTime","_dir","_queryResult","_illegalItems","_fuel"]; //
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,[],[[],""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_dir = [_this,5,0,[0]] call BIS_fnc_param;
_illegalItems = 
[
	"salema",
	"ornate",
	"mackerel",
	"tuna",
	"mullet",
	"catshark",
	"turtle",
	//Minen Items
	"sand",
	"glass",
	"panzerglass",
	"rock",
	"cement",
	"beton",
	"copper",
	"copper_r",
	"electro",
	"iron",
	"iron_r",
	"stahl",
	"blei",
	"blei_r",
	"dino",
	"gold",
	"goldnuggets",
	"goldbar",
	//Legal Job Items
	"mango",
	"ananas",
	"salt",
	"salt_r",
	"zuckerrohr",
	"zucker",
	"holz",
	"holzscheit",
	"holzkohle",
	"rohoel",
	"erdoel",
	"plastik",
	"benzin",
	"diesel",
	"kerosin",
	"baumwolle",
	"stoff",
	//Illegal Job Items
	"hanf",
	"marijuana",
	"med_merijuana",
	"opium",
	"heroin",
	"morphine",
	"pseudoephedrin",
	"phenylaceton",
	"natriumamalgam",
	"meth",
	"moonschine",
	"uranu",
	"uranp"
];
_unit_return = _unit;
_name = name _unit;
_side = side _unit;
_unit = owner _unit;

if(_vid == -1 OR _pid == "") exitWith {};
if(_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;

_query = format["vehicleInfo:%1:%2",_vid,_pid];

_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith {};

_vInfo = _queryResult;
if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];};
if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];};

if((_vInfo select 5) == 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]],"avanix_fnc_broadcast",_unit,false] spawn avanix_fnc_MP;
};

if((_vInfo select 6) == 1) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]],"avanix_fnc_broadcast",_unit,false] spawn avanix_fnc_MP;
};
if(typeName _sp != "STRING") then {
	_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
} else {
	_nearVehicles = [];
};
if(count _nearVehicles > 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[_price,_unit_return],"avanix_fnc_garageRefund",_unit,false] spawn avanix_fnc_MP;
	[[1,(localize "STR_Garage_SpawnPointError")],"avanix_fnc_broadcast",_unit,false] spawn avanix_fnc_MP;
};

_query = format["vehicleUpdateActive:1:0:%1:%2",_pid,_vid];
[_query,1] spawn DB_fnc_asyncCall;
if(typeName _sp == "STRING") then {
	_vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	uisleep 0.6;
} else {
	_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_vehicle setPos _sp;
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir;
};
_vehicle allowDamage true;
//Send keys over the network.
[[_vehicle],"avanix_fnc_addVehicle2Chain",_unit,false] spawn avanix_fnc_MP;
[_pid,_side,_vehicle,1] call TON_fnc_keyManagement;
_vehicle lock 2;
//Reskin the vehicle 
[[_vehicle,_vInfo select 8],"avanix_fnc_colorVehicle",nil,false] spawn avanix_fnc_MP;
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7]];

_fuel = [_vInfo select 11] call DB_fnc_mresToArray;
_vehicle setFuel _fuel;
_vehicle setFuelCargo 0;
_vehicle setAmmoCargo 0;

/* Vehicle Damage */
_damage = [(_vInfo select 12)] call DB_fnc_mresToArray;
if(typeName _damage == "STRING") then {_damage = call compile format["%1", _damage];};
_parts=getAllHitPointsDamage _vehicle select 0;
_num = (count _parts)-1; 
for"_i" from 0 to _num do 
{
	_vehicle setHitPointDamage [_parts select _i,_damage select _i]
};
/* Vehicle Damage */

//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function?

_trunk = [_vInfo select 9] call DB_fnc_mresToArray;
if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};

{
	_itemName = _x select 0;
	
	if(_itemName in _illegalItems) then
	{
		_x set [1,0];
	};
} forEach (_trunk select 0);

_gear = [_vInfo select 10] call DB_fnc_mresToArray;
if(typeName _gear == "STRING") then {_gear = call compile format["%1", _gear];};
_vehicle setVariable["Trunk",_trunk,true];
[_vehicle] call avanix_fnc_clearVehicleAmmo;

if (count _gear > 0) then
{
	_items = _gear select 0;
	_mags = _gear select 1;
	_weapons = _gear select 2;
	_backpacks = _gear select 3;

	for "_i" from 0 to ((count (_items select 0)) - 1) do 
	{
		_vehicle addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
	};
	for "_i" from 0 to ((count (_mags select 0)) - 1) do
	{
		_vehicle addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
	};
	for "_i" from 0 to ((count (_weapons select 0)) - 1) do
	{
		_vehicle addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
	};
	for "_i" from 0 to ((count (_backpacks select 0)) - 1) do
	{
		_vehicle addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
	};
};

//Sets of animations
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && _vInfo select 8 != 13) then
{
	[[_vehicle,"civ_littlebird",true],"avanix_fnc_vehicleAnimate",_unit,false] spawn avanix_fnc_MP;
};

if((_vInfo select 1) == "cop" && (_vInfo select 2) in [
"C_Hatchback_01_sport_F",
"C_Hatchback_01_F",
"C_Offroad_01_F",
"C_SUV_01_F",
"B_Heli_Transport_01_F",
"I_MRAP_03_F",
"C_Kart_01_Blu_F",
"B_MRAP_01_F",
"B_Heli_Light_01_F",
"O_Heli_Light_02_unarmed_F",
"I_Heli_light_03_unarmed_F",
"B_Quadbike_01_F",
"B_Truck_01_mover_F",
"C_Van_01_box_F",
"O_Truck_02_box_F",
"O_Truck_03_repair_F",
"C_Rubberboat",
"C_Heli_Light_01_civil_F",
"O_Heli_Transport_04_F",
"O_Heli_Transport_04_medevac_F",
"C_Boat_Civil_01_police_F",
"B_SDV_01_F"
]) then
{
	[[_vehicle,"cop_offroad",true],"avanix_fnc_vehicleAnimate",_unit,false] spawn avanix_fnc_MP;
	_vehicle setVariable["copcar",true,true];
};

if((_vInfo select 1) == "med" && (_vInfo select 2) in [
"C_Hatchback_01_sport_F",
"C_Hatchback_01_F",
"C_Offroad_01_F",
"C_SUV_01_F",
"B_Heli_Transport_01_F",
"I_MRAP_03_F",
"C_Kart_01_Blu_F",
"B_MRAP_01_F",
"B_Heli_Light_01_F",
"O_Heli_Light_02_unarmed_F",
"I_Heli_light_03_unarmed_F",
"B_Quadbike_01_F",
"B_Truck_01_mover_F",
"C_Van_01_box_F",
"O_Truck_02_box_F",
"O_Truck_03_repair_F",
"C_Rubberboat",
"C_Heli_Light_01_civil_F",
"O_Heli_Transport_04_F",
"O_Heli_Transport_04_medevac_F",
"C_Boat_Civil_01_police_F",
"B_SDV_01_F"
]) then
{
	[[_vehicle,"med_offroad",true],"avanix_fnc_vehicleAnimate",_unit,false] spawn avanix_fnc_MP;
};

if((_vInfo select 1) == "adac"  && (_vInfo select 2) in [
"C_Hatchback_01_sport_F",
"C_Hatchback_01_F",
"C_Offroad_01_F",
"C_SUV_01_F",
"B_Heli_Transport_01_F",
"I_MRAP_03_F",
"C_Kart_01_Blu_F",
"B_MRAP_01_F",
"B_Heli_Light_01_F",
"O_Heli_Light_02_unarmed_F",
"I_Heli_light_03_unarmed_F",
"B_Quadbike_01_F",
"B_Truck_01_mover_F",
"C_Van_01_box_F",
"O_Truck_02_box_F",
"O_Truck_03_repair_F",
"C_Rubberboat",
"C_Heli_Light_01_civil_F",
"O_Heli_Transport_04_F",
"O_Heli_Transport_04_medevac_F",
"C_Boat_Civil_01_police_F",
"B_SDV_01_F"
]) then
{
    [[_vehicle,"adac_offroad",true],"avanix_fnc_vehicleAnimate",_unit,false] spawn avanix_fnc_MP;
};
[[1,"Dein Fahrzeug ist bereit!"],"avanix_fnc_broadcast",_unit,false] spawn avanix_fnc_MP;
serv_sv_use = serv_sv_use - [_vid];