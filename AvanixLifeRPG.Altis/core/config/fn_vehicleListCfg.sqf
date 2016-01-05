#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return pushBack ["C_Kart_01_Fuel_F",10000];
		_return pushBack ["C_Kart_01_Red_F",10000];
		_return pushBack ["C_Kart_01_Vrana_F",10000];
	};
	
	case "civ_car":
	{
		_return pushBack ["B_Quadbike_01_F",6000];
		_return pushBack ["C_Hatchback_01_F",25000];
		_return pushBack ["C_Hatchback_01_sport_F",320000];
		_return pushBack ["C_Offroad_01_F",30000];
		_return pushBack ["C_SUV_01_F",45000];
	};
	
	case "civ_truck":
	{
		_return pushBack ["C_Van_01_transport_F",80000];
		_return pushBack ["C_Van_01_fuel_F",120000];
		_return pushBack ["C_Van_01_box_F",145000];
		_return pushBack ["I_Truck_02_transport_F",260000];
		_return pushBack ["O_Truck_02_fuel_F",285000];
		_return pushBack ["I_Truck_02_covered_F",320000];
		_return pushBack ["O_Truck_03_transport_F",650000];
		_return pushBack ["O_Truck_03_fuel_F",685000];
		_return pushBack ["O_Truck_03_covered_F",720000];
		_return pushBack ["O_Truck_03_ammo_F",960000];
		_return pushBack ["O_Truck_03_device_F",3000000];
		_return pushBack ["B_Truck_01_transport_F",1350000];
		_return pushBack ["B_Truck_01_fuel_F",1450000];
		_return pushBack ["B_Truck_01_covered_F",1600000];
		_return pushBack ["B_Truck_01_ammo_F",1900000];
		_return pushBack ["B_Truck_01_box_F",2200000];
	};
	
	case "reb_car":
	{
		if(license_civ_schwarzmarkt) then
		{
			_return pushBack["B_Quadbike_01_F",12000];
			_return pushBack["B_G_Offroad_01_F",50000];
			_return pushBack["B_MRAP_01_F",3300000];
			_return pushBack["O_MRAP_02_F",4300000];
			_return pushBack["B_Heli_Light_01_F",890000];
			_return pushBack["I_Heli_light_03_unarmed_F",1500000];
			_return pushBack["B_G_Offroad_01_armed_F",2000000];
		};
	};
	
	case "gang_car":
	{
		_return pushBack["B_Quadbike_01_F",12000];
		_return pushBack["B_G_Offroad_01_F",50000];
		_return pushBack["B_MRAP_01_F",3300000];
		_return pushBack["O_MRAP_02_F",4300000];
		_return pushBack["B_Heli_Light_01_F",890000];
		_return pushBack["I_Heli_light_03_unarmed_F",1500000];
		_return pushBack["B_G_Offroad_01_armed_F",2000000];
	};
	
	case "taxi_car":
	{
		if(license_civ_taxi) then
		{
			_return pushBack["C_SUV_01_F",45000];
		};
	};
	
	case "civ_air":
	{
		_return pushBack["C_Heli_Light_01_civil_F",500000];
		_return pushBack["O_Heli_Light_02_unarmed_F",1400000];
		_return pushBack["I_Heli_Transport_02_F",2600000];
	};
	
	case "civ_air_transport":
	{
		_return pushBack["O_Heli_Transport_04_F",5600000];
		_return pushBack["O_Heli_Transport_04_covered_F",5300000];
		_return pushBack["O_Heli_Transport_04_bench_F",4200000];
		_return pushBack["B_Heli_Transport_03_unarmed_F",5800000];
	};
	
	case "civ_ship":
	{
		_return pushBack["C_Rubberboat",5000];
		_return pushBack["C_Boat_Civil_01_F",22000];
		_return pushBack["B_SDV_01_F",40000];
	};
	
	case "med_shop":
	{
		_return pushBack ["C_SUV_01_F",13500];
		if(__GETC__(avanix_medicLevel) > 1) then
		{
			_return pushBack["C_Van_01_box_F",43500];
		};
		if(__GETC__(avanix_medicLevel) > 2) then
		{
			_return pushBack ["C_Hatchback_01_F",7500];
		};
		if(__GETC__(avanix_medicLevel) > 3) then
		{
			_return pushBack["C_Hatchback_01_sport_F",96000];
			_return pushBack ["C_Rubberboat",1500];	
		};
		if(__GETC__(avanix_medicLevel) > 4) then
		{
			_return pushBack ["O_Truck_02_box_F",96000];
			_return pushBack["B_MRAP_01_F",450000];
		};
	};
	
	case "med_air":
	{
		if(__GETC__(avanix_medicLevel) > 3) then
		{
			_return pushBack ["O_Heli_Transport_04_F",1680000];
			_return pushBack ["O_Heli_Transport_04_covered_F",1590000];
		};
	};
	
	case "med_air_hs":
	{
		if(__GETC__(avanix_medicLevel) > 3) then
		{
			_return pushBack ["O_Heli_Transport_04_F",1680000];
			_return pushBack ["O_Heli_Transport_04_covered_F",1590000];
		};
	};
	
	case "cop_car":
		{
		_return pushBack["C_SUV_01_F",13500];
		if(__GETC__(avanix_coplevel) > 1) then
		{
			_return pushBack["C_Hatchback_01_F",7500];
		};
		if(__GETC__(avanix_coplevel) > 3) then
		{
			_return pushBack["B_MRAP_01_F",450000];
		};
		if(__GETC__(avanix_coplevel) > 5) then
		{
			_return pushBack["C_Hatchback_01_sport_F",96000];
		};
		if(__GETC__(avanix_coplevel) > 8) then
		{
			_return pushBack["O_MRAP_02_F",570000];
		};
	};
	
	case "cop_air":
	{
		if(__GETC__(avanix_coplevel) > 2) then
		{
			_return pushBack["B_Heli_Light_01_F",150000];
			_return pushBack["C_Heli_Light_01_civil_F",150000];
		};
		if(__GETC__(avanix_coplevel) > 7) then
		{
			_return pushBack["I_Heli_light_03_unarmed_F",450000];
		};
		if(__GETC__(avanix_coplevel) > 9) then
		{
			_return pushBack["B_Heli_Transport_03_unarmed_F",1740000];
		};		
	}; 

	case "cop_ship":
	{
		_return pushBack["C_Boat_Civil_01_police_F",20000];
		_return pushBack["B_SDV_01_F",45000];
	};

	case "donator_1":
	{
		if(__GETC__(avanix_donator) == 1) then
		{
			_return pushBack ["B_Quadbike_01_F",5700];
			_return pushBack ["C_Hatchback_01_F",23750];
			_return pushBack ["C_Hatchback_01_sport_F",304000];
			_return pushBack ["C_Offroad_01_F",28500];
			_return pushBack ["C_SUV_01_F",42750];
			_return pushBack ["C_Van_01_transport_F",76000];
			_return pushBack ["C_Van_01_fuel_F",114000];
			_return pushBack ["C_Van_01_box_F",137750];
			_return pushBack ["I_Truck_02_transport_F",247000];
			_return pushBack ["O_Truck_02_fuel_F",270750];
			_return pushBack ["I_Truck_02_covered_F",320000];
			_return pushBack ["O_Truck_03_transport_F",617500];
			_return pushBack ["O_Truck_03_fuel_F",650750];
			_return pushBack ["O_Truck_03_covered_F",684000];
			_return pushBack ["O_Truck_03_ammo_F",912000];
			_return pushBack ["O_Truck_03_device_F",2850000];
			_return pushBack ["B_Truck_01_transport_F",1282500];
			_return pushBack ["B_Truck_01_fuel_F",1377500];
			_return pushBack ["B_Truck_01_covered_F",1520000];
			_return pushBack ["B_Truck_01_ammo_F",1805000];
			_return pushBack ["B_Truck_01_box_F",2090000];
			_return pushBack["C_Heli_Light_01_civil_F",475000];
			_return pushBack["O_Heli_Light_02_unarmed_F",1330000];
			_return pushBack["I_Heli_Transport_02_F",2470000];
			_return pushBack["O_Heli_Transport_04_F",5320000];
			_return pushBack["O_Heli_Transport_04_covered_F",5035000];
			_return pushBack["O_Heli_Transport_04_bench_F",3990000];
			_return pushBack["B_Heli_Transport_03_unarmed_F",5510000];
		};
		if(__GETC__(avanix_donator) == 2) then
		{
			_return pushBack ["B_Quadbike_01_F",5400];
			_return pushBack ["C_Hatchback_01_F",22500];
			_return pushBack ["C_Hatchback_01_sport_F",288000];
			_return pushBack ["C_Offroad_01_F",27000];
			_return pushBack ["C_SUV_01_F",40500];
			_return pushBack ["C_Van_01_transport_F",72000];
			_return pushBack ["C_Van_01_fuel_F",108000];
			_return pushBack ["C_Van_01_box_F",130500];
			_return pushBack ["I_Truck_02_transport_F",234000];
			_return pushBack ["O_Truck_02_fuel_F",256500];
			_return pushBack ["I_Truck_02_covered_F",288000];
			_return pushBack ["O_Truck_03_transport_F",585000];
			_return pushBack ["O_Truck_03_fuel_F",616500];
			_return pushBack ["O_Truck_03_covered_F",648000];
			_return pushBack ["O_Truck_03_ammo_F",864000];
			_return pushBack ["O_Truck_03_device_F",2700000];
			_return pushBack ["B_Truck_01_transport_F",1215000];
			_return pushBack ["B_Truck_01_fuel_F",1305000];
			_return pushBack ["B_Truck_01_covered_F",1440000];
			_return pushBack ["B_Truck_01_ammo_F",1710000];
			_return pushBack ["B_Truck_01_box_F",1980000];
			_return pushBack["C_Heli_Light_01_civil_F",450000];
			_return pushBack["O_Heli_Light_02_unarmed_F",1260000];
			_return pushBack["I_Heli_Transport_02_F",2340000];
			_return pushBack["O_Heli_Transport_04_F",5040000];
			_return pushBack["O_Heli_Transport_04_covered_F",4770000];
			_return pushBack["O_Heli_Transport_04_bench_F",3780000];
			_return pushBack["B_Heli_Transport_03_unarmed_F",5220000];
		};
		if(__GETC__(avanix_donator) == 3) then
		{
			_return pushBack ["B_Quadbike_01_F",5100];
			_return pushBack ["C_Hatchback_01_F",21250];
			_return pushBack ["C_Hatchback_01_sport_F",272000];
			_return pushBack ["C_Offroad_01_F",25500];
			_return pushBack ["C_SUV_01_F",38250];
			_return pushBack ["C_Van_01_transport_F",68000];
			_return pushBack ["C_Van_01_fuel_F",102000];
			_return pushBack ["C_Van_01_box_F",123250];
			_return pushBack ["I_Truck_02_transport_F",221000];
			_return pushBack ["O_Truck_02_fuel_F",242250];
			_return pushBack ["I_Truck_02_covered_F",272000];
			_return pushBack ["O_Truck_03_transport_F",552500];
			_return pushBack ["O_Truck_03_fuel_F",582250];
			_return pushBack ["O_Truck_03_covered_F",612000];
			_return pushBack ["O_Truck_03_ammo_F",816000];
			_return pushBack ["O_Truck_03_device_F",2550000];
			_return pushBack ["B_Truck_01_transport_F",1147500];
			_return pushBack ["B_Truck_01_fuel_F",1232500];
			_return pushBack ["B_Truck_01_covered_F",1360000];
			_return pushBack ["B_Truck_01_ammo_F",1615000];
			_return pushBack ["B_Truck_01_box_F",1870000];
			_return pushBack["C_Heli_Light_01_civil_F",425000];
			_return pushBack["O_Heli_Light_02_unarmed_F",1190000];
			_return pushBack["I_Heli_Transport_02_F",2210000];
			_return pushBack["O_Heli_Transport_04_F",4760000];
			_return pushBack["O_Heli_Transport_04_covered_F",4505000];
			_return pushBack["O_Heli_Transport_04_bench_F",3570000];
			_return pushBack["B_Heli_Transport_03_unarmed_F",4930000];
		};
	};
};

_return;
