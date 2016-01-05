#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return","_gangmarker","_gangmarkerText","_gangname"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_hq","Polizei HQ","textures\icons\map_cop.paa"],
			["cop_spawn_pyrgos","Dienststelle Pyrgos","textures\icons\map_cop.paa"]
		];
	};
	
	case civilian:
	{
		_hideout1 = nearestObject [[9951.52,19340.6,0],"Land_Cargo_Tower_V1_No1_F"];
		_hideout1 = _hideout1 getVariable ["gang_members",[]];
		_hideout2 = nearestObject [[23483.7,21096.2,0],"Land_Cargo_Tower_V1_No2_F"];
		_hideout2 = _hideout2 getVariable ["gang_members",[]];
		_hideout3 = nearestObject [[23043.7,7313.55,0],"Land_Cargo_Tower_V1_No3_F"];
		_hideout3 = _hideout3 getVariable ["gang_members",[]];
		_hideout4 = nearestObject [[12305.6,8867.82,0],"Land_Cargo_Tower_V1_No4_F"];
		_hideout4 = _hideout4 getVariable ["gang_members",[]];
		_id = getPlayerUID player;
						
		_return = [
			["civ_spawn_kavala","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_pyrgos","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_athira","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_sofia","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(_id in _hideout1 ) then {
			_return pushback ["gang_area_1","Besetztes Territorium","textures\icons\map_hideout_1.paa"];
		};
		
		if(_id in _hideout2 ) then {
			_return pushback ["gang_area_2","Besetztes Territorium","textures\icons\map_hideout_2.paa"];
		};
		
		if(_id in _hideout3 ) then {
			_return pushback ["gang_area_3","Besetztes Territorium","textures\icons\map_hideout_3.paa"];
		};
		
		if(_id in _hideout4 ) then {
			_return pushback ["gang_area_4","Besetztes Territorium","textures\icons\map_hideout_4.paa"];
		};
		
		if(license_civ_air) then
		{
			_return = _return + [
				["civ_spawn_airfield","Flughafen","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(license_civ_taxi) then
		{
			_return = _return + [
				["taxi_spawn_1","Taxi Zentrale","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(__GETC__(avanix_donator) > 0) then 
		{
			_return = _return + [
				["donator_spawn_1","Community Store","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		//blablabla
		if(count avanix_houses > 0) then 
		{
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"textures\icons\map_house.paa"];
			} foreach avanix_houses;
		};
	};
	
	case independent: 
	{
		_return = [
			["medic_spawn_1","Uniklinik Kavala","textures\icons\map_medic.paa"],
			["medic_spawn_2","Feuerwehr HQ","textures\icons\map_medic.paa"]
		];
	};
};

_return;