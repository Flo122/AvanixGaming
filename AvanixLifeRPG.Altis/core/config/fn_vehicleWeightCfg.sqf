/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	//Container
	case "Land_CargoBox_V1_F": {5000}; //Banksafe
	case "Box_IND_Grenades_F": {500}; //Kleine Hausbox
	case "B_supplyCrate_F": {1000}; //Große Hausbox
	case "Land_Sink_F": {500}; //Methküche
	case "Land_Cargo10_grey_F": {100}; //Kleiner Grauer Container
	case "Land_Pod_Heli_Transport_04_box_F": {200}; //Taru Container
	case "B_Slingload_01_Cargo_F": {250}; //Huron Container Container
	case "Land_Wreck_Traw_F": {100000}; //Schiffswrack
	case "Box_IND_AmmoVeh_F": {100000}; //Kleine Munitionskiste Grau
	case "Land_Cargo20_blue_F": {100000}; //Blauer Container //Waffenkiste
	case "CargoNet_01_box_F": {200000}; //Airdropbox //Craftingbox //Asservatenkammer
	case "Land_MetalCase_01_large_F": {25000}; //Hideout Box
	case "Land_Cargo10_blue_F": {500000};
	
	//Fahrzeuge
	case "C_Rubberboat": {45};
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "C_Boat_Civil_01_F": {85};
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "B_Heli_Light_01_F": {90};
	case "O_Heli_Light_02_unarmed_F": {275};
	case "I_Heli_Transport_02_F": {350};
	case "I_Heli_light_03_unarmed_F": {10};
	case "B_Heli_Transport_03_unarmed_F": {550};
	case "C_Heli_Light_01_civil_F": {90};	
	case "B_Quadbike_01_F": {50};
	case "C_Hatchback_01_F": {70};
	case "C_Hatchback_01_sport_F": {70};
	case "C_Offroad_01_F": {120};
	case "C_SUV_01_F": {90};
	case "C_Van_01_transport_F": {150};
	case "C_Van_01_fuel_F": {150};
	case "C_Van_01_box_F": {180};
	case "I_Truck_02_transport_F": {300};
	case "O_Truck_03_fuel_F": {300};
	case "I_Truck_02_covered_F": {400};
	case "O_Truck_03_transport_F": {480};
	case "O_Truck_02_fuel_F": {480};
	case "O_Truck_03_covered_F": {540};
	case "O_Truck_03_ammo_F": {600};
	case "O_Truck_03_device_F": {1000};
	case "B_Truck_01_transport_F": {700};
	case "B_Truck_01_fuel_F": {700};
	case "B_Truck_01_covered_F": {800};
	case "B_Truck_01_ammo_F": {900};
	case "B_Truck_01_box_F": {1200};
	case "B_G_Offroad_01_F": {50};
	case "B_MRAP_01_F": {50};
	case "I_MRAP_03_F": {50};
	case "O_MRAP_02_F": {50};
	case "O_Heli_Transport_04_F": {450};
	case "O_Heli_Transport_04_covered_F": {50};
	case "O_Heli_Transport_04_bench_F": {50};
	case "B_SDV_01_F": {100};
	default {-1};
};