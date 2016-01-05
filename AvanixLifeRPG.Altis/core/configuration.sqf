#include <macro.h>
/*
	Master Avanix Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
localplayerlist = [];
avanix_query_time = time;
avanix_action_delay = time;
avanix_trunk_vehicle = Objnull;
avanix_session_completed = false;
avanix_garage_store = false;
avanix_session_tries = 0;
avanix_net_dropped = false;
avanix_hit_explosive = false;
avanix_siren_active = false;
avanix_siren2_active = false;
avanix_yelp_active = false;
avanix_clothing_filter = 0;
avanix_snd_vol = 0;
avanix_clothing_uniform = -1;
avanix_redgull_effect = time;
avanix_is_processing = false;
avanix_bail_paid = false;
avanix_impound_inuse = false;
avanix_action_inUse = false;
avanix_barrier_g = ObjNull;
avanix_barriere_k = ObjNull;
avanix_bunker = ObjNull;
avanix_container = ObjNull;
avanix_pylone = ObjNull;
avanix_sandsack = ObjNull;
avanix_schranke = ObjNull;
avanix_strahler = ObjNull;
avanix_spikestrip = ObjNull;
avanix_target = ObjNull;
//avanix_respawn_timer = 2; //Scaled in minutes
avanix_knockout = false;
avanix_interrupted = false;
avanix_respawned = false;
avanix_removeWanted = false;
avanix_action_gathering = false;
avanix_speak = false;
avanix_drink = 0;
avanix_drug = 0;
avanix_messages = [];
avanix_positions = [];
avanix_names = [];
avanix_player = [];
avanix_last_vehicles = [];
avanix_empInUse = false;
avanix_hostages = false;
avanix_schutz_kavala = false;
avanix_schutz_athira = false;
avanix_schutz_pyrgos = false;
avanix_schutz_sofia = false;
avanix_calledTaxi = false;
avanix_isOnDutyTaxi = false;
avanix_inTaxi = false;
avanix_TankLaster = 1;
avanix_Aaster = 1;
avanix_channel_send = true;
avanix_robbed_station = false;

//Persistent Saving
__CONST__(avanix_save_civ,TRUE); //Save weapons for civs?
__CONST__(avanix_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(avanix_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(avanix_revive_fee,2500); //Fee for players to pay when revived.

//House Limit
__CONST__(avanix_houseLimit,3);

//Gang related stuff?
__CONST__(avanix_gangPrice,250000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(avanix_gangUpgradeBase,25000); //MASDASDASD
__CONST__(avanix_gangUpgradeMultipler,2.5); //BLAH

__CONST__(avanix_enableFatigue,TRUE); //Enable / Disable the ARMA 3 Fatigue System

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
avanix_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
avanix_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
avanix_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
avanix_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Avanix Variables *******
*****************************
*/
avanix_net_dropped = false;
avanix_hit_explosive = false;
avanix_siren_active = false;
avanix_bank_fail = false;
avanix_use_atm = true;
avanix_is_arrested = false;
avanix_delivery_in_progress = false;
avanix_action_in_use = false;
avanix_thirst = 100;
avanix_hunger = 100;
__CONST__(avanix_paycheck_period,5); //Five minutes
avanix_cash = 0;
__CONST__(avanix_impound_car,350);
__CONST__(avanix_impound_boat,250);
__CONST__(avanix_impound_air,850);
avanix_istazed = false;
avanix_my_gang = ObjNull;
avanix_smartphoneTarget = ObjNull;

avanix_vehicles = [];
avanix_impoundedvehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		avanix_atmcash = 7000; //Starting Bank Money
		avanix_paycheck = 500; //Paycheck Amount
	};
	case civilian: 
	{
		avanix_atmcash = 10000000000; //Starting Bank Money
		avanix_paycheck = 1000000000; //Paycheck Amount
	};
	
	case independent: 
	{
		avanix_atmcash = 6500;
		avanix_paycheck = 500;
	};
};

/*
	Master Array of items?
*/
avanix_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(avanix_vShop_rentalOnly,avanix_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

avanix_illegal_stuffs =
[
    "Rangefinder",
	"Laserdesignator",
	//Waffen
	"hgun_PDW2000_F",
	"SMG_01_F",
	"SMG_02_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20_F",
	"arifle_Katiba_F",
	"srifle_DMR_01_F",
	"srifle_EBR_F",
	"srifle_DMR_05_tan_F",
	"srifle_DMR_05_hex_F",
	"srifle_DMR_05_blk_F",
	"srifle_DMR_06_camo_F",
	"srifle_DMR_06_olive_F",
	"srifle_DMR_04_Tan_F",
	"srifle_DMR_04_F",
	"srifle_DMR_03_multicam_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_02_camo_F",
	"srifle_DMR_02_sniper_F",
	"srifle_DMR_02_F",
	"srifle_LRR_F",
	"srifle_LRR_camo_F",
	"srifle_GM6_F",
	"srifle_GM6_camo_F",
	"LMG_Mk200_F",
	"LMG_Zafir_F",
	"MMG_01_tan_F",
	"MMG_01_hex_F",
	"MMG_02_camo_F",
	"MMG_02_black_F",
	"MMG_02_sand_F",


	"arifle_MXC_Black_F",
	"arifle_MX_Black_F",
	"arifle_MXM_Black_F",
	"arifle_MX_SW_Black_F",
	"arifle_MX_GL_F",
	"arifle_MXC_F",
	"arifle_MX_F",
	"arifle_MX_SW_F",
	"arifle_MXM_F",

	//Magazine
	"11Rnd_45ACP_Mag",
	"9Rnd_45ACP_Mag",
	"6Rnd_45ACP_Cylinder",
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F",
	"10Rnd_127x54_Mag",
	"10Rnd_93x64_DMR_05_Mag",
	"5Rnd_127x108_Mag",
	"30Rnd_65x39_caseless_green",
	"30Rnd_65x39_caseless_green_mag_Tracer",
	"7Rnd_408_Mag",
	"10Rnd_338_Mag",
	"20Rnd_762x51_Mag",
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag_Tracer_Red",
	"30Rnd_556x45_Stanag_Tracer_Green",
	"30Rnd_556x45_Stanag_Tracer_Yellow",
	"30Rnd_556x45_Stanag_red",
	"30Rnd_556x45_Stanag_green",
	"200Rnd_65x39_cased_Box",
	"200Rnd_65x39_cased_Box_Tracer",
	"150Rnd_93x64_Mag",
	"30Rnd_9x21_Mag",
	"30Rnd_9x21_Red_Mag",
	"30Rnd_9x21_Yellow_Mag",
	"30Rnd_9x21_Green_Mag",
	"16Rnd_9x21_Mag",
	"16Rnd_9x21_red_Mag",
	"16Rnd_9x21_green_Mag",
	"16Rnd_9x21_yellow_Mag",
	"10Rnd_762x54_Mag",
	"20Rnd_556x45_UW_mag",
	"130Rnd_338_Mag",
	"30Rnd_45ACP_Mag_SMG_01",
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
	"150Rnd_762x54_Box",
	"150Rnd_762x54_Box_Tracer",

	"acc_flashlight",
	"acc_pointer_IR",
	"optic_MRD",
	"optic_Aco_smg",
	"optic_ACO_grn_smg",
	"optic_Aco",
	"optic_Aco_grn",
	"optic_Holosight_smg",
	"optic_Holosight",
	"optic_MRCO",
	"optic_Arco",
	"optic_Hamr",
	"optic_DMS",
	"optic_SOS",
	"optic_LRPS",
	"optic_AMS",
	"optic_AMS_snd",
	"optic_AMS_khk",
	"optic_KHS_blk",
	"optic_KHS_tan",
	"optic_KHS_hex",
	"optic_KHS_old",
	"optic_NVS",
	"bipod_01_F_blk",
	"bipod_01_F_snd",
	"bipod_02_F_tan",
	"bipod_03_F_blk",
	"bipod_02_F_hex",
	"bipod_01_F_mtp",
	"bipod_03_F_oli",
	"muzzle_snds_L",
	"muzzle_snds_acp",
	"muzzle_snds_M",
	"muzzle_snds_H_MG",
	"muzzle_snds_B",
	"muzzle_snds_93mmg_tan",
	"muzzle_snds_338_black",
	"muzzle_snds_338_sand",

	"HandGrenade_Stone",
	"3Rnd_Smoke_Grenade_shell",
	"SmokeShell",
	"SmokeShellOrange",
	
	"U_IG_Guerilla1_1",
	"U_BG_Guerrilla_6_1",
	"U_I_OfficerUniform",
	"U_BG_leader",
	"U_BG_Guerilla1_1",
	"U_I_pilotCoveralls",
	"U_I_CombatUniform",
	"U_I_CombatUniform_shortsleeve",
	"U_I_GhillieSuit",
	"U_B_HeliPilotCoveralls",
	"U_I_Wetsuit",
	"U_I_FullGhillie_sard",
	"U_I_FullGhillie_lsh",
	"U_I_FullGhillie_ard",

	"H_ShemagOpen_tan",
	"H_Shemag_olive",
	"H_ShemagOpen_khk",
	"H_HelmetIA_camo",
	"H_HelmetB_light_grass",

	"G_Combat",

	"V_BandollierB_khk",
	"V_Chestrig_khk",
	"V_TacVest_camo",
	"V_TacVestCamo_khk",
	"V_PlateCarrierIA1_dgtl",
	"V_PlateCarrierIA2_dgtl",
	"V_RebreatherIA",
	"V_HarnessOGL_brn",

	"B_AssaultPack_rgr",
	"B_AssaultPack_dgtl",
	"B_FieldPack_oli",
	"B_Kitbag_mcamo",
	"B_Carryall_mcamo"
];

avanix_all_stuffs =
[
    "Rangefinder",
	"Laserdesignator",
	//Waffen
	"hgun_PDW2000_F",
	"SMG_01_F",
	"SMG_02_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20_F",
	"arifle_Katiba_F",
	"srifle_DMR_01_F",
	"srifle_EBR_F",
	"srifle_DMR_05_tan_F",
	"srifle_DMR_05_hex_F",
	"srifle_DMR_05_blk_F",
	"srifle_DMR_06_camo_F",
	"srifle_DMR_06_olive_F",
	"srifle_DMR_04_Tan_F",
	"srifle_DMR_04_F",
	"srifle_DMR_03_multicam_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_02_camo_F",
	"srifle_DMR_02_sniper_F",
	"srifle_DMR_02_F",
	"srifle_LRR_F",
	"srifle_LRR_camo_F",
	"srifle_GM6_F",
	"srifle_GM6_camo_F",
	"LMG_Mk200_F",
	"LMG_Zafir_F",
	"MMG_01_tan_F",
	"MMG_01_hex_F",
	"MMG_02_camo_F",
	"MMG_02_black_F",
	"MMG_02_sand_F",


	"arifle_MXC_Black_F",
	"arifle_MX_Black_F",
	"arifle_MXM_Black_F",
	"arifle_MX_SW_Black_F",
	"arifle_MX_GL_F",
	"arifle_MXC_F",
	"arifle_MX_F",
	"arifle_MX_SW_F",
	"arifle_MXM_F",

	//Magazine
	"11Rnd_45ACP_Mag",
	"9Rnd_45ACP_Mag",
	"6Rnd_45ACP_Cylinder",
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F",
	"10Rnd_127x54_Mag",
	"10Rnd_93x64_DMR_05_Mag",
	"5Rnd_127x108_Mag",
	"30Rnd_65x39_caseless_green",
	"30Rnd_65x39_caseless_green_mag_Tracer",
	"7Rnd_408_Mag",
	"10Rnd_338_Mag",
	"20Rnd_762x51_Mag",
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag_Tracer_Red",
	"30Rnd_556x45_Stanag_Tracer_Green",
	"30Rnd_556x45_Stanag_Tracer_Yellow",
	"30Rnd_556x45_Stanag_red",
	"30Rnd_556x45_Stanag_green",
	"200Rnd_65x39_cased_Box",
	"200Rnd_65x39_cased_Box_Tracer",
	"150Rnd_93x64_Mag",
	"30Rnd_9x21_Mag",
	"30Rnd_9x21_Red_Mag",
	"30Rnd_9x21_Yellow_Mag",
	"30Rnd_9x21_Green_Mag",
	"16Rnd_9x21_Mag",
	"16Rnd_9x21_red_Mag",
	"16Rnd_9x21_green_Mag",
	"16Rnd_9x21_yellow_Mag",
	"10Rnd_762x54_Mag",
	"20Rnd_556x45_UW_mag",
	"130Rnd_338_Mag",
	"30Rnd_45ACP_Mag_SMG_01",
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
	"150Rnd_762x54_Box",
	"150Rnd_762x54_Box_Tracer",

	"acc_flashlight",
	"acc_pointer_IR",
	"optic_MRD",
	"optic_Aco_smg",
	"optic_ACO_grn_smg",
	"optic_Aco",
	"optic_Aco_grn",
	"optic_Holosight_smg",
	"optic_Holosight",
	"optic_MRCO",
	"optic_Arco",
	"optic_Hamr",
	"optic_DMS",
	"optic_SOS",
	"optic_LRPS",
	"optic_AMS",
	"optic_AMS_snd",
	"optic_AMS_khk",
	"optic_KHS_blk",
	"optic_KHS_tan",
	"optic_KHS_hex",
	"optic_KHS_old",
	"optic_NVS",
	"bipod_01_F_blk",
	"bipod_01_F_snd",
	"bipod_02_F_tan",
	"bipod_03_F_blk",
	"bipod_02_F_hex",
	"bipod_01_F_mtp",
	"bipod_03_F_oli",
	"muzzle_snds_L",
	"muzzle_snds_acp",
	"muzzle_snds_M",
	"muzzle_snds_H_MG",
	"muzzle_snds_B",
	"muzzle_snds_93mmg_tan",
	"muzzle_snds_338_black",
	"muzzle_snds_338_sand",

	"HandGrenade_Stone",
	"3Rnd_Smoke_Grenade_shell",
	"SmokeShell",
	"SmokeShellOrange",
	
	"U_IG_Guerilla1_1",
	"U_BG_Guerrilla_6_1",
	"U_I_OfficerUniform",
	"U_BG_leader",
	"U_BG_Guerilla1_1",
	"U_I_pilotCoveralls",
	"U_I_CombatUniform",
	"U_I_CombatUniform_shortsleeve",
	"U_I_GhillieSuit",
	"U_B_HeliPilotCoveralls",
	"U_I_Wetsuit",
	"U_I_FullGhillie_sard",
	"U_I_FullGhillie_lsh",
	"U_I_FullGhillie_ard",

	"H_ShemagOpen_tan",
	"H_Shemag_olive",
	"H_ShemagOpen_khk",
	"H_HelmetIA_camo",
	"H_HelmetB_light_grass",

	"G_Combat",

	"V_BandollierB_khk",
	"V_Chestrig_khk",
	"V_TacVest_camo",
	"V_TacVestCamo_khk",
	"V_PlateCarrierIA1_dgtl",
	"V_PlateCarrierIA2_dgtl",
	"V_RebreatherIA",
	"V_HarnessOGL_brn",

	"B_AssaultPack_rgr",
	"B_AssaultPack_dgtl",
	"B_FieldPack_oli",
	"B_Kitbag_mcamo",
	"B_Carryall_mcamo"
];

avanix_inv_items = 
[
	//Sonstige Items
	"avanix_inv_rabbit",
	"avanix_inv_water",
	"avanix_inv_donuts",
	"avanix_inv_coffee",
	"avanix_inv_fuelF",
	"avanix_inv_fuelE",
	"avanix_inv_pickaxe",
	"avanix_inv_axt",
	"avanix_inv_tbacon",
	"avanix_inv_lockpick",
	"avanix_inv_redgull",
	"avanix_inv_blastingcharge",
	"avanix_inv_crowbar",
	"avanix_inv_boltcutter",
	"avanix_inv_defusekit",
	"avanix_inv_kidney",
	"avanix_inv_scalpel",
	"avanix_inv_gpstracker",
	"avanix_inv_kabelbinder",
	"avanix_inv_truckstorage",
	"avanix_inv_speedtrap", 
	"avanix_inv_speedtrapdetector",
	"avanix_inv_laptop",
	"avanix_inv_fuelManipulator",
	"avanix_inv_fuelPipe",
	"avanix_inv_blaulicht",
	"avanix_inv_batterie",
	
	//Objects
	"avanix_inv_barriere_g",
	"avanix_inv_pylone",
	"avanix_inv_schranke",
	"avanix_inv_spikeStrip",
	"avanix_inv_barriere_k",
	"avanix_inv_strahler",
	"avanix_inv_target",
	"avanix_inv_sandsack",
	"avanix_inv_bunker",
	"avanix_inv_medhouse",
	
	//Housing
	"avanix_inv_storagesmall",
	"avanix_inv_storagebig",
	"avanix_inv_methkueche",
	"avanix_inv_burglartool",
	"avanix_inv_alarmsystem",
	"avanix_inv_alarmsystemGPS",
	"avanix_inv_alarmsystemDog",
	"avanix_inv_alarmsystemGuard", 
	"avanix_inv_metalGrilledWindow", 
	"avanix_inv_spytoolkit",
	
	//Fisch Items
	"avanix_inv_salema",
	"avanix_inv_ornate",
	"avanix_inv_mackerel",
	"avanix_inv_tuna",
	"avanix_inv_mullet",
	"avanix_inv_catshark",
	"avanix_inv_turtle",
	
	//Minen Items
	"avanix_inv_sand",
	"avanix_inv_glass",
	"avanix_inv_panzerglass",
	"avanix_inv_rock",
	"avanix_inv_cement",
	"avanix_inv_beton",
	"avanix_inv_copper",
	"avanix_inv_copper_r",
	"avanix_inv_electro",
	"avanix_inv_iron",
	"avanix_inv_iron_r",
	"avanix_inv_stahl",
	"avanix_inv_blei",
	"avanix_inv_blei_r",
	"avanix_inv_dino",
	"avanix_inv_gold",
	"avanix_inv_goldnuggets",
	"avanix_inv_goldbar",
	
	//Legal Job Items
	"avanix_inv_mango",
	"avanix_inv_ananas",
	"avanix_inv_salt",
	"avanix_inv_salt_r",
	"avanix_inv_zuckerrohr",
	"avanix_inv_zucker",
	"avanix_inv_holz",
	"avanix_inv_holzscheit",
	"avanix_inv_holzkohle",
	"avanix_inv_rohoel",
	"avanix_inv_erdoel",
	"avanix_inv_plastik",
	"avanix_inv_benzin",
	"avanix_inv_diesel",
	"avanix_inv_kerosin",
	"avanix_inv_baumwolle",
	"avanix_inv_stoff",
	
	//Illegal Job Items
	"avanix_inv_hanf",
	"avanix_inv_marijuana",
	"avanix_inv_med_merijuana",
	"avanix_inv_opium",
	"avanix_inv_heroin",
	"avanix_inv_morphine",
	"avanix_inv_pseudoephedrin",
	"avanix_inv_phenylaceton",
	"avanix_inv_natriumamalgam",
	"avanix_inv_meth",
	"avanix_inv_moonschine",
	"avanix_inv_uranu",
	"avanix_inv_uranp",
	
	//Waffen Baupläne
	"avanix_inv_bprook40",
	"avanix_inv_bpacpc2",
	"avanix_inv_bpzubr45",
	"avanix_inv_bpp07",
	"avanix_inv_bpsignal",
	"avanix_inv_bp4five",
	"avanix_inv_bppdw2000",
	"avanix_inv_bpvermin",
	"avanix_inv_bpsting",
	"avanix_inv_bpsdar",
	"avanix_inv_bptrg20",
	"avanix_inv_bpkatiba",
	"avanix_inv_bprahim",
	"avanix_inv_bpzafir",
	"avanix_inv_bpgm6lynx",
	"avanix_inv_bpasp1",
	"avanix_inv_bpcyrus",
	"avanix_inv_bpmar10",
	"avanix_inv_bpmk1",
	"avanix_inv_bpmk14",
	"avanix_inv_bpmk200",
	"avanix_inv_bplrr",
	"avanix_inv_bpmk18",
	"avanix_inv_bpmk20",
	
	//Fahrzeug Baupläne
	"avanix_inv_bpquad",
	"avanix_inv_bplimo",
	"avanix_inv_bplimosport",
	"avanix_inv_bpoffroad",
	"avanix_inv_bpoffroadr",
	"avanix_inv_bpsuv",
	"avanix_inv_bpvan",
	"avanix_inv_bpzamak",
	"avanix_inv_bptempest",
	"avanix_inv_bphemtt",
	"avanix_inv_bphunter",
	"avanix_inv_bpifrit",
	"avanix_inv_bpm900",
	"avanix_inv_bporca",
	"avanix_inv_bpmohawk",
	"avanix_inv_bphellcat",
	"avanix_inv_bptaru",
	"avanix_inv_bphuron",
	"avanix_inv_bpsdv",
	"avanix_inv_bpboat",
	
	//Waffenteile
	"avanix_inv_lowerreceiver",
	"avanix_inv_zubrframe",
	"avanix_inv_lauf9mm",
	"avanix_inv_lauf45",
	"avanix_inv_lauf65",
	"avanix_inv_lauf127",
	"avanix_inv_lauf556",
	"avanix_inv_lauf762",
	"avanix_inv_lauf93",
	"avanix_inv_lauf338",
	"avanix_inv_rollenverschluss",
	"avanix_inv_rook40schlitten",
	"avanix_inv_acpc2schlitten",
	"avanix_inv_4fiveschlitten",
	"avanix_inv_p07schlitten",
	"avanix_inv_trommel45acp6rnd",
	"avanix_inv_drehkopfverschluss",
	"avanix_inv_gasdrucksystem",
	"avanix_inv_rueckstossfeder",
	"avanix_inv_verzoegertermasseverschluss",
	"avanix_inv_unverriegekltermasseverschluss",
	"avanix_inv_picatinnyschiene",
	"avanix_inv_bullpupgearbox",
	"avanix_inv_tragegriff",
	"avanix_inv_eichsystem",
	"avanix_inv_dichtungssystem",
	"avanix_inv_kurzergaskolben",
	"avanix_inv_geradezugverschluss",
	"avanix_inv_zylinderverschluss"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach avanix_inv_items;
//Licenses [license var, civ/cop]
avanix_licenses =
[
	//Führerscheine
	["license_civ_driver","civ"],
	["license_civ_truck","civ"],
	["license_civ_boat","civ"],
	["license_civ_air","civ"],
	["license_civ_dive","civ"],
	["license_civ_transport","civ"],
	["license_civ_taxi","civ"],
			
	//Verarbeitungslizenzen Legal
	["license_civ_salt","civ"],
	["license_civ_zucker","civ"],
	["license_civ_holz","civ"],
	["license_civ_rohoel","civ"],
	["license_civ_baumwolle","civ"],
	["license_civ_sand","civ"],
	["license_civ_rock","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_blei","civ"],
	["license_civ_gold","civ"],
	["license_civ_treibstoff","civ"],
			
	//Verarbeitungslizenzen Illegal
	["license_civ_heroin","civ"],
	["license_civ_hanf","civ"],
			
	//Sonstige Lizenzen
	["license_civ_gun","civ"],
	["license_civ_schwarzmarkt","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach avanix_licenses;

avanix_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
avanix_illegal_items = [
["speedtrapdetector",100],
["laptop",250],
["fuelManipulator",1000],    
["fuelPipe",100],
["blaulicht",5000],
["kidney",5000],
["blastingcharge",5000],
["hanf",5000],
["marijuana",5000],
["opium",5000],
["heroin",5000],
["pseudoephedrin",5000],
["natriumamalgam",5000],
["meth",5000],
["spytoolkit",10000],
["methkueche",10000],
["burglartool",10000],
["uranu",1400],
["uranp",2800],
["moonschine",5000]];

/*
	Sell / buy arrays
*/
sell_array = 
[
	//Sonstige Items
	["rabbit",40],
	["water",25],
	["donuts",30],
	["coffee",35],
	["fuelF",3000],
	["pickaxe",1450],
	["axt",1498],
	["tbacon",50],
	["lockpick",1150],
	["redgull",1500],
	["crowbar",3825],
	["boltcutter",5425],
	["truckstorage",50000],
	["kidney",50000],
	["scalpel",1249],
	["gpstracker",2625],
	["kabelbinder",25],
	["speedtrap",100],
	["speedtrapdetector",100],
	["laptop",250],
	["fuelManipulator",1000],    
	["fuelPipe",100],
	["blaulicht",5000],
	
	//Objects
	["barriere_g",1500],
	["pylone",1500],
	["schranke",1500],
	["spikeStrip",1500],
	["barriere_k",1500],
	["strahler",1500],
	["target",1500],
	["sandsack",1500],
	["bunker",1500],
	["medhouse",1500],
	
	//Housing
	["storagesmall",625000],
	["storagebig",1300000],
	["methkueche",10000],
	["burglartool",10000],
	["alarmsystem",10000],
	["alarmsystemGPS",10000],
	["alarmsystemDog",10000],
	["alarmsystemGuard",10000],
	["metalGrilledWindow",10000],
	["spytoolkit",10000],
	
	//Fisch Items
	["salema",90],
	["ornate",80],
	["mackerel",350],
	["tuna",700],
	["mullet",500],
	["catshark",600],
	["turtle",3200],
	
	//Minen Items
	["glass",927],
	["cement",912],
	["copper_r",956],
	["iron_r",937],
	["blei_r",929],
	["dino",7750],
	["goldnuggets",999],
	["goldbar",75000],
	
	//Legal Job Items
	["mango",62],
	["ananas",50],
	["salt_r",1024],
	["zucker",979],
	["holzscheit",865],
	["erdoel",828],
	["stoff",919],
	["benzin",1019],
	["diesel",1019],
	["kerosin",1019],
	
	//Illegal Job Items
	["marijuana",1880],
	["med_merijuana",1970],
	["heroin",1820],
	["morphine",1900],
	["meth",1500],
	["moonschine",1500],
	["uranp",2800]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	//Sonstige Items
	["rabbit",80],
	["water",50],
	["donuts",60],
	["coffee",70],
	["fuelF",6000],
	["pickaxe",3799],
	["axt",2999],
	["tbacon",100],
	["lockpick",2499],
	["redgull",3000],
	["blastingcharge",20000],
	["crowbar",7650],
	["boltcutter",8850],
	["defusekit",5000],
	["truckstorage",100000],
	["scalpel",2499],
	["gpstracker",5250],
	["kabelbinder",49],
	["speedtrap",5000],
	["speedtrapdetector",5000],
	["laptop",500],
	["fuelManipulator",20000],
	["fuelPipe",1500],
	["blaulicht",25000],
	
	//Objects
	["barriere_g",2500],
	["pylone",2500],
	["schranke",2500],
	["spikeStrip",2500],
	["barriere_k",2500],
	["strahler",2500],
	["target",2500],
	["sandsack",2500],
	["bunker",2500],
	["medhouse",2500],
	
	//Housing
	["storagesmall",849000],
	["storagebig",1999999],
	["methkueche",2600000],
	["burglartool",150000],
	["alarmsystem",1000000],
	["alarmsystemGPS",500000],
	["alarmsystemDog",500000],
	["alarmsystemGuard",1500000],
	["metalGrilledWindow",750000],
	["spytoolkit",100000],
	
	//Legal Job Items
	["mango",69],
	["ananas",56]
];
__CONST__(buy_array,buy_array);

avanix_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(avanix_weapon_shop_array,avanix_weapon_shop_array);

avanix_garage_prices =
[
	["B_Quadbike_01_F",36],
	["C_Hatchback_01_F",150],
	["C_Hatchback_01_sport_F",1920],
	["C_Offroad_01_F",180],
	["B_G_Offroad_01_F",300],
	["B_G_Offroad_01_armed_F",9000],
	["C_SUV_01_F",270],
	["C_Van_01_transport_F",480],
	["C_Van_01_fuel_F",720],
	["C_Van_01_box_F",870],
	["I_Truck_02_transport_F",1560],
	["O_Truck_02_fuel_F",1710],
	["I_Truck_02_covered_F",1920],
	["O_Truck_02_box_F",1920],
	["O_Truck_03_transport_F",3900],
	["O_Truck_03_fuel_F",4110],
	["O_Truck_03_covered_F",4320],
	["O_Truck_03_ammo_F",5760],
	["O_Truck_03_device_F",18000],
	["B_Truck_01_transport_F",8100],
	["B_Truck_01_fuel_F",8700],
	["B_Truck_01_covered_F",9600],
	["B_Truck_01_ammo_F",11400],
	["B_Truck_01_box_F",13200],
	//Gepanzerte
	["O_MRAP_02_F",12600],
	["B_MRAP_01_F",9000],
	["I_MRAP_03_F",11400],
	//Karts
	["C_Kart_01_Fuel_F",500],
	["C_Kart_01_Red_F",500],
	["C_Kart_01_Vrana_F",500],
	//Helis
	["B_Heli_Light_01_F",3000],
	["C_Heli_Light_01_civil_F",3000],
	["O_Heli_Light_02_unarmed_F",8400],
	["I_Heli_Transport_02_F",15600],
	["I_Heli_light_03_unarmed_F",9000],
	["O_Heli_Transport_04_F",33600],
	["O_Heli_Transport_04_covered_F",31800],
	["O_Heli_Transport_04_bench_F",25200],
	["O_Heli_Transport_04_medevac_F",1920],
	["B_Heli_Transport_03_unarmed_F",34800],
	//Boote
	["C_Rubberboat",75],
	["B_SDV_01_F",2250],
	["C_Boat_Civil_01_F",330],
	["C_Boat_Civil_01_police_F",330]
];
__CONST__(avanix_garage_prices,avanix_garage_prices);

avanix_garage_sell =
[
	["B_Quadbike_01_F",900],
	["C_Hatchback_01_F",3750],
	["C_Hatchback_01_sport_F",48000],
	["C_Offroad_01_F",4500],
	["B_G_Offroad_01_F",7500],
	["B_G_Offroad_01_armed_F",225000],
	["C_SUV_01_F",6750],
	["C_Van_01_transport_F",12000],
	["C_Van_01_fuel_F",18000],
	["C_Van_01_box_F",21750],
	["I_Truck_02_transport_F",39000],
	["O_Truck_02_fuel_F",42750],
	["I_Truck_02_covered_F",48000],
	["O_Truck_02_box_F",48000],
	["O_Truck_03_transport_F",97500],
	["O_Truck_03_fuel_F",102750],
	["O_Truck_03_covered_F",108000],
	["O_Truck_03_ammo_F",144000],
	["O_Truck_03_device_F",450000],
	["B_Truck_01_transport_F",202500],
	["B_Truck_01_fuel_F",217500],
	["B_Truck_01_covered_F",240000],
	["B_Truck_01_ammo_F",285000],
	["B_Truck_01_box_F",330000],
	//Gepanzerte
	["O_MRAP_02_F",315000],
	["B_MRAP_01_F",225000],
	["I_MRAP_03_F",285000],
	//Karts
	["C_Kart_01_Fuel_F",1000],
	["C_Kart_01_Red_F",1000],
	["C_Kart_01_Vrana_F",1000],
	//Helis
	["B_Heli_Light_01_F",75000],
	["C_Heli_Light_01_civil_F",75000],
	["O_Heli_Light_02_unarmed_F",210000],
	["I_Heli_Transport_02_F",390000],
	["I_Heli_light_03_unarmed_F",225000],
	["O_Heli_Transport_04_F",840000],
	["O_Heli_Transport_04_covered_F",795000],
	["O_Heli_Transport_04_bench_F",630000],
	["O_Heli_Transport_04_medevac_F",480000],
	["B_Heli_Transport_03_unarmed_F",870000],
	//Boote
	["C_Rubberboat",750],
	["B_SDV_01_F",22500],
	["C_Boat_Civil_01_F",3300],
	["C_Boat_Civil_01_police_F",3300]
];
__CONST__(avanix_garage_sell,avanix_garage_sell);

avanix_impound_prices =
[
    ["B_Quadbike_01_F",600],
	["C_Hatchback_01_F",3500],
	["C_Hatchback_01_sport_F",32000],
	["C_Offroad_01_F",3000],
	["B_G_Offroad_01_F",50000],
	["B_G_Offroad_01_armed_F",1500000],
	["C_SUV_01_F",4500],
	["C_Van_01_transport_F",6000],
	["C_Van_01_fuel_F",14000],
	["C_Van_01_box_F",14500],
	["I_Truck_02_transport_F",26000],
	["O_Truck_02_fuel_F",21000],
	["I_Truck_02_covered_F",32000],
	["O_Truck_02_box_F",32000],
	["O_Truck_03_transport_F",65000],
	["O_Truck_03_fuel_F",45000],
	["O_Truck_03_covered_F",73000],
	["O_Truck_03_ammo_F",96000],
	["O_Truck_03_device_F",300000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_fuel_F",130000],
	["B_Truck_01_covered_F",160000],
	["B_Truck_01_ammo_F",190000],
	["B_Truck_01_box_F",220000],
	//Gepanzerte
	["O_MRAP_02_F",460000],
	["B_MRAP_01_F",480000],
	["I_MRAP_03_F",560000],
	//Karts
	["C_Kart_01_Fuel_F",2000],
	["C_Kart_01_Red_F",2000],
	["C_Kart_01_Vrana_F",2000],
	//Helis
	["B_Heli_Light_01_F",50000],
	["C_Heli_Light_01_civil_F",50000],
	["O_Heli_Light_02_unarmed_F",140000],
	["I_Heli_Transport_02_F",260000],
	["I_Heli_light_03_unarmed_F",150000],
	["O_Heli_Transport_04_F",560000],
	["O_Heli_Transport_04_covered_F",530000],
	["O_Heli_Transport_04_bench_F",420000],
	["O_Heli_Transport_04_medevac_F",320000],
	["B_Heli_Transport_03_unarmed_F",580000],
	//Boote
	["C_Rubberboat",500],
	["B_SDV_01_F",15000],
	["C_Boat_Civil_01_F",3200],
	["C_Boat_Civil_01_police_F",3200]
];
__CONST__(avanix_impound_prices,avanix_impound_prices);