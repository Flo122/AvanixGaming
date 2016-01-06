/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	//Quad
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","civ"], //Hellbraun
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"], //Schwarz
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"], //Blau
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"], //Rot
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"], //Weiß
			["textures\rebel\rebel_quad.paa","reb"]
		];
	};
	
	//Offroader
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], //Rot
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"], //Hellbraun
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"], //Silber
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"], //Blau
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"], //Dunkelrot
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"] //Dunkelblau
		];
	};
	
	case "B_G_Offroad_01_F":
	{
		_ret = 
		[
			["textures\rebel\rebel_offroad.paa","reb"]
		];
	};
	
	//Offroader bewaffnet
	case "B_G_Offroad_01_armed_F":
	{
		_ret = 
		[
			["textures\rebel\rebel_offroad.paa","reb"]
		];
	};
	
	//SUV
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"], //Dunkelrot
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"], //Schwarz
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"], //Grau
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"], //Orange
			["textures\polizei\polizei_suv.paa","cop"],
			["textures\feuerwehr\feuerwehr_suv.paa","med"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","cop"], //Schwarz
			["textures\sek\sek_suv.paa","cop"],
			["textures\taxi\taxi_suv.paa","taxi"]
		];
	};
	
	//Limosine
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"], //Beige
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base05_co.paa","civ"], //Hellbraun
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"], //Grün
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"], //Blau
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"], //Dunkelblau
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"], //Gelb
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"], //grau
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"], //Schwarz
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"], //Schwarz Alt
			["textures\polizei\polizei_limo.paa","cop"],
			["textures\feuerwehr\feuerwehr_limo.paa","med"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","cop"], //Schwarz
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","cop"], //Schwarz Alt
			["textures\sek\sek_limo.paa","cop"],
			["textures\zivilist\starwars_limo.paa","vip"]
		];
	};
	
	//Limosine Sport
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"], //Beige
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base05_co.paa","civ"], //Hellbraun
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"], //Grün
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"], //Blau
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"], //Dunkelblau
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"], //Gelb
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"], //grau
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"], //Schwarz
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"], //Schwarz Alt
			["textures\polizei\polizei_limo.paa","cop"],
			["textures\feuerwehr\feuerwehr_limo.paa","med"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","cop"], //Schwarz
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","cop"], //Schwarz Alt
			["textures\sek\sek_limo.paa","cop"],
			["textures\zivilist\starwars_limo.paa","vip"]
		];
	};
	
	//Truck
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa","civ"], //Schwarz
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"], //Weiß
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"] //Rot
		];
	};
	
	//Truck Box
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa","civ"], //Schwarz
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"], //Weiß
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"], //Rot
			["textures\feuerwehr\feuerwehr_truck_0.paa","med","textures\feuerwehr\feuerwehr_truck_1.paa"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa","vip","textures\zivilist\twd_van_1.paa"]
		];
	};
	
	//Truck Tank
	case "C_Van_01_fuel_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa","civ"], //Schwarz
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"], //Weiß
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"] //Rot
		];
	};
	
	//Zamak
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"]
		];
	};
	
	//Zamak Transport
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"]
		];
	};
	
	//Zamak Box
	case "O_Truck_02_box_F":
	{
		_ret = 
		[
			["textures\feuerwehr\feuerwehr_zamak_0.paa","med","textures\feuerwehr\feuerwehr_zamak_1.paa"]
		];
	};	
	
	//Hummingbird offen
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["textures\polizei\polizei_hummingbird.paa","cop"],
			["textures\rebel\rebel_hummingbird.paa","reb"]
		];
	};
	
	//Hummingbird geschlossen
	case "C_Heli_Light_01_civil_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"], //Blau
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"], //Dunkelrot
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"], //Blueline
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"], //Elliptical
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"], //Furious
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"], //Jeans
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","civ"], //Light
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","civ"], //Shadow
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"], //speedy
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"], //Sunset
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"], //Vrana
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"], //Marvin
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"], //Wave
			["textures\polizei\polizei_hummingbird.paa","cop"]
		];
	};
	
	//Orca
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"] //Blau-Weiss
		];
	};
	
	//Mohawk
	case "I_Heli_Transport_02_F":
	{
		_ret =
		[
			["a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","civ","a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],
			["a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","civ","a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"]
		];
	};
	
	//Hellcat
	case "I_Heli_light_03_unarmed_F":
	{
		_ret = 
		[
			["textures\polizei\polizei_hellcat.paa","cop"],
			["textures\sek\sek_hellcat.paa","cop"],
			["textures\rebel\rebel_hellcat.paa","reb"]
		];
	};
	
	//Taru
	case "O_Heli_Transport_04_F":
	{
		_ret = 
		[
			["#(ai,64,64,1)Fresnel(1.3,7)","civ","#(ai,64,64,1)Fresnel(1.3,7)"],
			["textures\feuerwehr\feuerwehr_taru_0.paa","med","textures\feuerwehr\feuerwehr_taru_1.paa"],
			["#(ai,64,64,1)Fresnel(1.3,7)","vip","#(ai,64,64,1)Fresnel(1.3,7)"]
		];
	};
	
	//Taru Transport
	case "O_Heli_Transport_04_covered_F":
	{
		_ret = 
		[
			["#(ai,64,64,1)Fresnel(1.3,7)","civ","#(ai,64,64,1)Fresnel(1.3,7)","#(ai,64,64,1)Fresnel(1.3,7)","#(ai,64,64,1)Fresnel(1.3,7)"],
			["textures\feuerwehr\feuerwehr_taru_0.paa","med","textures\feuerwehr\feuerwehr_taru_1.paa","textures\feuerwehr\feuerwehr_taru_2.paa"],
			["#(ai,64,64,1)Fresnel(1.3,7)","vip","#(ai,64,64,1)Fresnel(1.3,7)","#(ai,64,64,1)Fresnel(1.3,7)","#(ai,64,64,1)Fresnel(1.3,7)"]
		];
	};
	
	//Huron
	case "B_Heli_Transport_03_unarmed_F":
	{
		_ret = 
		[
			["#(ai,64,64,1)Fresnel(1.3,7)","civ","#(ai,64,64,1)Fresnel(1.3,7)"],
			["textures\sek\sek_huron_0.paa","cop","textures\sek\sek_huron_1.paa"],
			["#(ai,64,64,1)Fresnel(1.3,7)","civ","#(ai,64,64,1)Fresnel(1.3,7)"]
		];
	};
	
	//Hunter
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["textures\polizei\polizei_hunter_0.paa","cop","textures\polizei\polizei_hunter_1.paa"],
			["textures\sek\sek_hunter_0.paa","cop","textures\sek\sek_hunter_1.paa"],
			["textures\rebel\rebel_hunter_0.paa","reb","textures\rebel\rebel_hunter_1.paa"],
			["textures\feuerwehr\feuerwehr_hunter_0.paa","med","textures\feuerwehr\feuerwehr_hunter_1.paa"]
		];
	};
	
	//Stryder
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["textures\sek\sek_strider.paa","cop"]
		];
	};
	
	//Ifrit
	case "O_MRAP_02_F":
	{
		_ret = 
		[
			["textures\rebel\rebel_ifrit_0.paa","reb","textures\rebel\rebel_ifrit_1.paa"],
			["textures\sek\sek_ifrit_0.paa","cop","textures\sek\sek_ifrit_1.paa"]
		];
	};
	
	//SVD
	case "B_SDV_01_F":
	{
		_ret = 
		[
			["\A3\boat_f_beta\SDV_01\data\sdv_ext_co.paa","civ"],
			["\A3\boat_f_beta\SDV_01\data\sdv_ext_co.paa","cop"]
		];
	};
	
	//Schlauchboot
	case "C_Rubberboat":
	{
		_ret = 
		[
			["\A3\boat_f\Boat_Transport_01\data\boat_transport_01_civilian_co.paa","civ"],
			["\A3\boat_f\Boat_Transport_01\data\boat_transport_01_co.paa","cop"],
			["\A3\boat_f\Boat_Transport_01\data\boat_transport_01_co.paa","med"]
		];
	};
	
	/*
	//Speedboot Zivil
	case "C_Boat_Civil_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	//Speedboot Polizei
	case "C_Boat_Civil_01_police_F":
	{
		_ret = 
		[
			["\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	*/
};

_ret;