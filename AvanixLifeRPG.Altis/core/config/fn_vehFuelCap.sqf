private["_veh"];

_veh = [_this,0,""] call BIS_fnc_param;

switch(_veh) do
{
	case "B_Quadbike_01_F": 					{25};
	case "C_Hatchback_01_F": 					{65};
	case "C_Hatchback_01_sport_F": 				{65};
	case "C_Offroad_01_F": 						{95};
	case "B_G_Offroad_01_F": 					{95};
	case "B_G_Offroad_01_armed_F": 				{95};
	case "C_SUV_01_F": 							{80};
	case "C_Van_01_transport_F": 				{150};
	case "C_Van_01_fuel_F": 					{150};
	case "C_Van_01_box_F": 						{150};
	case "I_Truck_02_transport_F": 				{350};
	case "O_Truck_02_fuel_F": 					{350};
	case "I_Truck_02_covered_F": 				{350};
	case "O_Truck_02_box_F": 					{350};
	case "O_Truck_03_transport_F": 				{400};
	case "O_Truck_03_fuel_F": 					{400};
	case "O_Truck_03_covered_F": 				{400};
	case "O_Truck_03_ammo_F": 					{400};
	case "O_Truck_03_device_F": 				{400};
	case "B_Truck_01_transport_F": 				{450};
	case "B_Truck_01_fuel_F": 					{450};
	case "B_Truck_01_covered_F": 				{450};
	case "B_Truck_01_ammo_F": 					{450};
	case "B_Truck_01_box_F": 					{450};
	//Gepanzerte
	case "O_MRAP_02_F": 						{100};
	case "B_MRAP_01_F": 						{100};
	case "I_MRAP_03_F": 						{100};
	//Karts
	case "C_Kart_01_Fuel_F": 					{10};
	case "C_Kart_01_Red_F": 					{10};
	case "C_Kart_01_Vrana_F": 					{10};
	//Helis
	case "B_Heli_Light_01_F": 					{150};
	case "C_Heli_Light_01_civil_F": 			{150};
	case "O_Heli_Light_02_unarmed_F": 			{280};
	case "I_Heli_Transport_02_F": 				{320};
	case "I_Heli_light_03_unarmed_F": 			{340};
	case "O_Heli_Transport_04_F": 				{300};
	case "O_Heli_Transport_04_covered_F": 		{300};
	case "O_Heli_Transport_04_bench_F": 		{300};
	case "O_Heli_Transport_04_medevac_F": 		{300};
	case "B_Heli_Transport_03_unarmed_F": 		{380};
	//Boote
	case "C_Rubberboat": 						{100};
	case "B_SDV_01_F": 							{120};
	case "C_Boat_Civil_01_F": 					{180};
	case "C_Boat_Civil_01_police_F": 			{180};
	default {100};
};


