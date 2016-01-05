#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "handfeuerwaffen":
	{
		_return = 
		[
			["hgun_Pistol_Signal_F", ["avanix_inv_bpsignal",1,"avanix_inv_lauf45",1,"avanix_inv_trommel45acp6rnd",1,"avanix_inv_zylinderverschluss",1]],
			["hgun_Pistol_heavy_01_F", ["avanix_inv_bp4five",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf45",1,"avanix_inv_4fiveschlitten",1]],
			["hgun_ACPC2_F", ["avanix_inv_bpacpc2",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf45",1,"avanix_inv_acpc2schlitten",1]],
			["hgun_P07_F", ["avanix_inv_bpp07",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf9mm",1,"avanix_inv_p07schlitten",1]],
			["hgun_Rook40_F", ["avanix_inv_bprook40",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf9mm",1,"avanix_inv_rook40schlitten",1]],
			["hgun_Pistol_heavy_02_F", ["avanix_inv_bpzubr45",1,"avanix_inv_zubrframe",1,"avanix_inv_trommel45acp6rnd",1,"avanix_inv_holz",1]]
		];
	};
	
	case "machinenpistolen":
	{
		_return = 
		[
			["hgun_PDW2000_F", ["avanix_inv_bppdw2000",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf9mm",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1]],
			["SMG_01_F", ["avanix_inv_bpvermin",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf45",1,"avanix_inv_rueckstossfeder",1,"avanix_inv_unverriegekltermasseverschluss",1]],
			["SMG_02_F", ["avanix_inv_bpsting",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf9mm",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1]]
		];
	};
	
	case "gewehre":
	{
		_return = 
		[
			["arifle_SDAR_F", ["avanix_inv_bpsdar",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf556",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_bullpupgearbox",1,"avanix_inv_dichtungssystem",1]],
			["arifle_TRG20_F", ["avanix_inv_bptrg20",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf556",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_bullpupgearbox",1]],
			["arifle_TRG21_F", ["avanix_inv_bptrg20",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf556",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_bullpupgearbox",1]],
			["arifle_Mk20_plain_F", ["avanix_inv_bpmk20",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf556",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_bullpupgearbox",1,"avanix_inv_kurzergaskolben",1]],
			["arifle_Mk20_F", ["avanix_inv_bpmk20",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf556",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_bullpupgearbox",1,"avanix_inv_kurzergaskolben",1]],
			["arifle_Katiba_F", ["avanix_inv_bpkatiba",1,"avanix_inv_lauf65",1,"avanix_inv_rueckstossfeder",1,"avanix_inv_verzoegertermasseverschluss",1,"avanix_inv_bullpupgearbox",1,"avanix_inv_tragegriff",1]],
			["srifle_DMR_01_F", ["avanix_inv_bprahim",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_bullpupgearbox",1,"avanix_inv_eichsystem",1]],
			["srifle_EBR_F", ["avanix_inv_bpmk18",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_eichsystem",1]],
			["srifle_DMR_05_tan_f", ["avanix_inv_bpcyrus",1,"avanix_inv_lauf93",1,"avanix_inv_rollenverschluss",1,"avanix_inv_rueckstossfeder",1,"avanix_inv_eichsystem",1,"avanix_inv_picatinnyschiene",1]],
			["srifle_DMR_05_hex_F", ["avanix_inv_bpcyrus",1,"avanix_inv_lauf93",1,"avanix_inv_rollenverschluss",1,"avanix_inv_rueckstossfeder",1,"avanix_inv_eichsystem",1,"avanix_inv_picatinnyschiene",1]],
			["srifle_DMR_05_blk_F", ["avanix_inv_bpcyrus",1,"avanix_inv_lauf93",1,"avanix_inv_rollenverschluss",1,"avanix_inv_rueckstossfeder",1,"avanix_inv_eichsystem",1,"avanix_inv_picatinnyschiene",1]],
			["srifle_DMR_06_camo_F", ["avanix_inv_bpmk14",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_eichsystem",1,"avanix_inv_holz",2]],
			["srifle_DMR_06_olive_F", ["avanix_inv_bpmk14",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_eichsystem",1,"avanix_inv_holz",2]],
			["srifle_DMR_04_Tan_F", ["avanix_inv_bpasp1",1,"avanix_inv_lauf127",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_drehkopfverschluss",1]],
			["srifle_DMR_04_F", ["avanix_inv_bpasp1",1,"avanix_inv_lauf127",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_drehkopfverschluss",1]],
			["srifle_DMR_03_multicam_F", ["avanix_inv_bpmk1",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_dichtungssystem",1]],
			["srifle_DMR_03_khaki_F", ["avanix_inv_bpmk1",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_dichtungssystem",1]],
			["srifle_DMR_03_tan_F", ["avanix_inv_bpmk1",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_dichtungssystem",1]],
			["srifle_DMR_03_F", ["avanix_inv_bpmk1",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_dichtungssystem",1]],
			["srifle_DMR_03_woodland_F", ["avanix_inv_bpmk1",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_dichtungssystem",1]],
			["srifle_DMR_02_camo_F", ["avanix_inv_bpmar10",1,"avanix_inv_lauf338",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_dichtungssystem",1]],
			["srifle_DMR_02_sniper_F", ["avanix_inv_bpmar10",1,"avanix_inv_lauf338",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_dichtungssystem",1]],
			["srifle_DMR_02_F", ["avanix_inv_bpmar10",1,"avanix_inv_lauf338",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_dichtungssystem",1]],
			["srifle_LRR_F", ["avanix_inv_bplrr",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf127",1,"avanix_inv_geradezugverschluss",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_eichsystem",1,"avanix_inv_dichtungssystem",1]],
			["srifle_LRR_camo_F", ["avanix_inv_bplrr",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf127",1,"avanix_inv_geradezugverschluss",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_eichsystem",1,"avanix_inv_dichtungssystem",1]],
			["srifle_GM6_F", ["avanix_inv_bpgm6lynx",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf127",1,"avanix_inv_rueckstossfeder",1,"avanix_inv_verzoegertermasseverschluss",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_eichsystem",1]],
			["srifle_GM6_camo_F", ["avanix_inv_bpgm6lynx",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf127",1,"avanix_inv_rueckstossfeder",1,"avanix_inv_verzoegertermasseverschluss",1,"avanix_inv_picatinnyschiene",1,"avanix_inv_eichsystem",1]]
		];
	};
	
	case "machinengewehre":
	{
		_return = 
		[
			["LMG_Mk200_F", ["avanix_inv_bpmk200",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf65",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_verzoegertermasseverschluss",1,"avanix_inv_rueckstossfeder",1,"avanix_inv_picatinnyschiene",1]],
			["LMG_Zafir_F", ["avanix_inv_bpzafir",1,"avanix_inv_lowerreceiver",1,"avanix_inv_lauf762",1,"avanix_inv_drehkopfverschluss",1,"avanix_inv_gasdrucksystem",1,"avanix_inv_geradezugverschluss",1,"avanix_inv_rueckstossfeder",1]]
		];
	};
	
	case "magazine":
	{
		_return = 
		[
			["11Rnd_45ACP_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["9Rnd_45ACP_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["6Rnd_45ACP_Cylinder", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["6Rnd_GreenSignal_F", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["6Rnd_RedSignal_F", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["10Rnd_127x54_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["10Rnd_93x64_DMR_05_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["5Rnd_127x108_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_65x39_caseless_green", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_65x39_caseless_green_mag_Tracer", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["7Rnd_408_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["10Rnd_338_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["20Rnd_762x51_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_556x45_Stanag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_556x45_Stanag_Tracer_Red", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_556x45_Stanag_Tracer_Green", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_556x45_Stanag_Tracer_Yellow", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_556x45_Stanag_red", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_556x45_Stanag_green", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["200Rnd_65x39_cased_Box", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["200Rnd_65x39_cased_Box_Tracer", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["150Rnd_93x64_Mag", ["avanix_inv_bleip",3,"avanix_inv_kohlep",4]],
			["30Rnd_9x21_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_9x21_Red_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_9x21_Yellow_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_9x21_Green_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["16Rnd_9x21_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["16Rnd_9x21_red_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["16Rnd_9x21_green_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["16Rnd_9x21_yellow_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["10Rnd_762x54_Mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["20Rnd_556x45_UW_mag", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["130Rnd_338_Mag", ["avanix_inv_bleip",2,"avanix_inv_kohlep",3]],
			["30Rnd_45ACP_Mag_SMG_01", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_45ACP_Mag_SMG_01_Tracer_Green", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_45ACP_Mag_SMG_01_Tracer_Red", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow", ["avanix_inv_bleip",1,"avanix_inv_kohlep",2]],
			["150Rnd_762x54_Box", ["avanix_inv_bleip",3,"avanix_inv_kohlep",4]],
			["150Rnd_762x54_Box_Tracer", ["avanix_inv_bleip",3,"avanix_inv_kohlep",4,"avanix_inv_uranp",2]]
		];
	};
	
	case "attachments":
	{
		_return = 
		[
			["acc_flashlight", ["avanix_inv_plastik",2,"avanix_inv_glass",1,"avanix_inv_iron_r",2,"avanix_inv_copper_r",2,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["acc_pointer_IR", ["avanix_inv_plastik",3,"avanix_inv_glass",1,"avanix_inv_iron_r",2,"avanix_inv_copper_r",2,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_MRD", ["avanix_inv_plastik",2,"avanix_inv_glass",1,"avanix_inv_iron_r",2,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_Aco_smg", ["avanix_inv_plastik",3,"avanix_inv_glass",1,"avanix_inv_iron_r",2,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_ACO_grn_smg", ["avanix_inv_plastik",3,"avanix_inv_glass",1,"avanix_inv_iron_r",2,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_Aco", ["avanix_inv_plastik",3,"avanix_inv_glass",1,"avanix_inv_iron_r",2,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_Aco_grn", ["avanix_inv_plastik",3,"avanix_inv_glass",1,"avanix_inv_iron_r",2,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_Holosight_smg", ["avanix_inv_plastik",4,"avanix_inv_glass",1,"avanix_inv_iron_r",3,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_Holosight", ["avanix_inv_plastik",4,"avanix_inv_glass",1,"avanix_inv_iron_r",3,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_MRCO", ["avanix_inv_plastik",4,"avanix_inv_glass",1,"avanix_inv_iron_r",3,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_Arco", ["avanix_inv_plastik",4,"avanix_inv_glass",1,"avanix_inv_iron_r",3,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_Hamr", ["avanix_inv_plastik",4,"avanix_inv_glass",1,"avanix_inv_iron_r",3,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_DMS", ["avanix_inv_plastik",4,"avanix_inv_panzerglass",1,"avanix_inv_iron_r",3,"avanix_inv_copper_r",3,"avanix_inv_batterie",1,"avanix_inv_electro",1]],
			["optic_SOS", ["avanix_inv_plastik",6,"avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_copper_r",4,"avanix_inv_batterie",1,"avanix_inv_electro",2]],
			["optic_LRPS", ["avanix_inv_plastik",6,"avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_copper_r",4,"avanix_inv_batterie",1,"avanix_inv_electro",2]],
			["optic_AMS", ["avanix_inv_plastik",6,"avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_copper_r",4,"avanix_inv_batterie",1,"avanix_inv_electro",2]],
			["optic_AMS_snd", ["avanix_inv_plastik",6,"avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_copper_r",4,"avanix_inv_batterie",1,"avanix_inv_electro",2]],
			["optic_AMS_khk", ["avanix_inv_plastik",6,"avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_copper_r",4,"avanix_inv_batterie",1,"avanix_inv_electro",2]],
			["optic_KHS_blk", ["avanix_inv_plastik",6,"avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_copper_r",4,"avanix_inv_batterie",1,"avanix_inv_electro",2]],
			["optic_KHS_tan", ["avanix_inv_plastik",6,"avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_copper_r",4,"avanix_inv_batterie",1,"avanix_inv_electro",2]],
			["optic_KHS_hex", ["avanix_inv_plastik",6,"avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_copper_r",4,"avanix_inv_batterie",1,"avanix_inv_electro",2]],
			["optic_KHS_old", ["avanix_inv_plastik",6,"avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_copper_r",4,"avanix_inv_batterie",1,"avanix_inv_electro",2]],
			["optic_NVS", ["avanix_inv_plastik",8,"avanix_inv_panzerglass",4,"avanix_inv_iron_r",5,"avanix_inv_copper_r",5,"avanix_inv_batterie",2,"avanix_inv_electro",6,"avanix_inv_gold",4]],
			["bipod_01_F_blk", ["avanix_inv_plastik",8,"avanix_inv_iron_r",6]],
			["bipod_01_F_snd", ["avanix_inv_plastik",8,"avanix_inv_iron_r",6]],
			["bipod_02_F_tan", ["avanix_inv_plastik",8,"avanix_inv_iron_r",6]],
			["bipod_03_F_blk", ["avanix_inv_plastik",8,"avanix_inv_iron_r",6]],
			["bipod_02_F_hex", ["avanix_inv_plastik",8,"avanix_inv_iron_r",6]],
			["bipod_01_F_mtp", ["avanix_inv_plastik",8,"avanix_inv_iron_r",6]],
			["bipod_03_F_oli", ["avanix_inv_plastik",8,"avanix_inv_iron_r",6]],
			["muzzle_snds_L", ["avanix_inv_plastik",2,"avanix_inv_iron_r",8,"avanix_inv_baumwolle",8]],
			["muzzle_snds_acp", ["avanix_inv_plastik",2,"avanix_inv_iron_r",8,"avanix_inv_baumwolle",8]],
			["muzzle_snds_M", ["avanix_inv_plastik",2,"avanix_inv_iron_r",8,"avanix_inv_baumwolle",8]],
			["muzzle_snds_H_MG", ["avanix_inv_plastik",2,"avanix_inv_iron_r",8,"avanix_inv_baumwolle",8]],
			["muzzle_snds_B", ["avanix_inv_plastik",2,"avanix_inv_iron_r",8,"avanix_inv_baumwolle",8]],
			["muzzle_snds_93mmg_tan", ["avanix_inv_plastik",2,"avanix_inv_iron_r",8,"avanix_inv_baumwolle",8]],
			["muzzle_snds_338_black", ["avanix_inv_plastik",2,"avanix_inv_iron_r",8,"avanix_inv_baumwolle",8]],
			["muzzle_snds_338_sand", ["avanix_inv_plastik",2,"avanix_inv_iron_r",8,"avanix_inv_baumwolle",8]]
		];
	};
	
	case "zubehoer":
	{
		_return = 
		[
			["ItemWatch", ["avanix_inv_glass",2,"avanix_inv_plastik",3]],
			["ItemCompass", ["avanix_inv_glass",2,"avanix_inv_plastik",3,"avanix_inv_iron_r",1]],
			["ItemMap", ["avanix_inv_stoff",2]],
			["ItemRadio", ["avanix_inv_iron_r",2,"avanix_inv_batterie",1,"avanix_inv_electro",3]],
			["ItemGPS", ["avanix_inv_iron_r",2,"avanix_inv_batterie",1,"avanix_inv_electro",3]],
			["FirstAidKit", ["avanix_inv_stoff",4,"avanix_inv_morphine",6,"avanix_inv_med_merijuana",6]],
			["ToolKit", ["avanix_inv_stoff",4,"avanix_inv_iron_r",8,"avanix_inv_glass",4]],
			["Binocular", ["avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_plastik",5]],
			["Rangefinder", ["avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_plastik",5,"avanix_inv_batterie",1,"avanix_inv_electro",3]],
			["NVGoggles", ["avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_plastik",6,"avanix_inv_batterie",2,"avanix_inv_electro",4]],
			["NVGoggles_Opfor", ["avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_plastik",6,"avanix_inv_batterie",2,"avanix_inv_electro",4]],
			["NVGoggles_INDEP", ["avanix_inv_panzerglass",2,"avanix_inv_iron_r",4,"avanix_inv_plastik",6,"avanix_inv_batterie",2,"avanix_inv_electro",4]]
		];
	};

	case "uniform":
	{
		_return = 
		[
			["U_IG_Guerilla1_1", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",6,"avanix_inv_stoff",6]],
            ["U_BG_Guerrilla_6_1", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",6,"avanix_inv_stoff",6]],
			["U_I_OfficerUniform", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",6,"avanix_inv_stoff",7]],
            ["U_BG_leader", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",6,"avanix_inv_stoff",8]],
			["U_BG_Guerilla1_1", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",6,"avanix_inv_stoff",8]],
			["U_I_pilotCoveralls", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",8,"avanix_inv_stoff",8]],
			["U_I_CombatUniform", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",8,"avanix_inv_stoff",9]],
            ["U_I_CombatUniform_shortsleeve", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",9,"avanix_inv_stoff",9]],
			["U_I_GhillieSuit", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",10,"avanix_inv_stoff",16]],
			["U_I_FullGhillie_sard", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",14,"avanix_inv_stoff",16]],
			["U_I_FullGhillie_lsh", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",14,"avanix_inv_stoff",16]],
			["U_I_FullGhillie_ard", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",14,"avanix_inv_stoff",16]],
			["U_B_HeliPilotCoveralls", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",10,"avanix_inv_stoff",8]]
		];
	};
	
	case "vest":
	{
		_return = [
			["V_RebreatherB", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4,"avanix_inv_plastik",2,"avanix_inv_iron_r",4]],
			["V_Press_F", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["V_BandollierB_khk", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["V_Chestrig_khk", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["V_TacVest_camo", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["V_TacVestCamo_khk", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["V_PlateCarrierIA1_dgtl", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["V_PlateCarrierIA2_dgtl", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["V_RebreatherIA", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4,"avanix_inv_plastik",2,"avanix_inv_iron_r",4]],
			["V_HarnessOGL_brn", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]]
		];
	};

	case "backpack":
	{
		_return = [
			["B_AssaultPack_sgg", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["B_AssaultPack_rgr", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["B_AssaultPack_dgtl", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",4,"avanix_inv_stoff",4]],
			["B_FieldPack_oli", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",6,"avanix_inv_stoff",7]],
			["B_Kitbag_sgg", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",9,"avanix_inv_stoff",8]],
			["B_Kitbag_mcamo", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",9,"avanix_inv_stoff",8]],
			["B_TacticalPack_rgr", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",11,"avanix_inv_stoff",13]],
			["B_Carryall_khk", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",12,"avanix_inv_stoff",16]],
			["B_Carryall_oli", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",12,"avanix_inv_stoff",16]],
			["B_Carryall_mcamo", ["avanix_inv_scalpel",1,"avanix_inv_baumwolle",12,"avanix_inv_stoff",16]]
		];
	};

	case "item":
	{
		_return = [
			["avanix_inv_pickaxe", ["avanix_inv_holz",2,"avanix_inv_stahl",1]],
			["avanix_inv_axt", ["avanix_inv_holz",2,"avanix_inv_stahl",1]],
			["avanix_inv_lockpick", ["avanix_inv_plastik",2,"avanix_inv_iron_r",1]],
			["avanix_inv_blastingcharge", ["avanix_inv_electro",6,"avanix_inv_uranp",8,"avanix_inv_glass",2]],
			["avanix_inv_crowbar", ["avanix_inv_stahl",6]],
			["avanix_inv_boltcutter", ["avanix_inv_stahl",6,"avanix_inv_plastik",2]],
			["avanix_inv_gpstracker", ["avanix_inv_electro",4,"avanix_inv_plastik",4,"avanix_inv_glass",1]],
			["avanix_inv_kabelbinder", ["avanix_inv_plastik",1]],
			["avanix_inv_truckstorage", ["avanix_inv_stahl",10]],
			["avanix_inv_speedtrapdetector", ["avanix_inv_iron_r",2,"avanix_inv_electro",8,"avanix_inv_glass",1]],
			["avanix_inv_laptop", ["avanix_inv_plastik",3,"avanix_inv_electro",4,"avanix_inv_glass",1]],
			["avanix_inv_fuelManipulator", ["avanix_inv_plastik",4,"avanix_inv_electro",3,"avanix_inv_glass",2]],
			["avanix_inv_fuelPipe", ["avanix_inv_plastik",4]],
			["avanix_inv_blaulicht", ["avanix_inv_plastik",5,"avanix_inv_electro",3,"avanix_inv_glass",2]],
			["avanix_inv_storagesmall", ["avanix_inv_iron_r",10,"avanix_inv_plastik",8,"avanix_inv_baumwolle",4]],
			["avanix_inv_storagebig", ["avanix_inv_iron_r",20,"avanix_inv_plastik",14,"avanix_inv_baumwolle",6]],
			["avanix_inv_methkueche", ["avanix_inv_stahl",22,"avanix_inv_plastik",14,"avanix_inv_blei_r",6,"avanix_inv_glass",2]]
		];
	};
	
	case "vehicle":
	{
		_return = 
		[
			["B_Quadbike_01_F", ["avanix_inv_bpquad",1,"avanix_inv_plastik",6,"avanix_inv_stahl",6,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",2]],
			["C_Hatchback_01_F", ["avanix_inv_bplimo",1,"avanix_inv_plastik",4,"avanix_inv_stahl",10,"avanix_inv_stoff",6,"avanix_inv_glass",6,"avanix_inv_electro",4]],
			["C_Hatchback_01_sport_F", ["avanix_inv_bplimosport",1,"avanix_inv_plastik",4,"avanix_inv_iron_r",10,"avanix_inv_stahl",10,"avanix_inv_stoff",6,"avanix_inv_glass",6,"avanix_inv_electro",4]],
			["C_Offroad_01_F", ["avanix_inv_bpoffroad",1,"avanix_inv_plastik",4,"avanix_inv_stahl",16,"avanix_inv_stoff",4,"avanix_inv_glass",6,"avanix_inv_electro",4]],
			["B_G_Offroad_01_F", ["avanix_inv_bpoffroadr",1,"avanix_inv_plastik",4,"avanix_inv_stahl",20,"avanix_inv_stoff",4,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["C_SUV_01_F", ["avanix_inv_bpsuv",1,"avanix_inv_plastik",6,"avanix_inv_stahl",20,"avanix_inv_stoff",8,"avanix_inv_glass",8,"avanix_inv_electro",4]],
			["C_Van_01_transport_F", ["avanix_inv_bpvan",2,"avanix_inv_plastik",4,"avanix_inv_iron_r",16,"avanix_inv_stahl",12,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",4]],
			["C_Van_01_fuel_F", ["avanix_inv_bpvan",2,"avanix_inv_plastik",4,"avanix_inv_iron_r",16,"avanix_inv_stahl",12,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",4]],
			["C_Van_01_box_F", ["avanix_inv_bpvan",2,"avanix_inv_plastik",4,"avanix_inv_iron_r",26,"avanix_inv_stahl",12,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",4]],
			["I_Truck_02_transport_F", ["avanix_inv_bpzamak",3,"avanix_inv_plastik",4,"avanix_inv_iron_r",30,"avanix_inv_stahl",18,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",4]],
			["O_Truck_02_fuel_F", ["avanix_inv_bpzamak",3,"avanix_inv_plastik",4,"avanix_inv_iron_r",30,"avanix_inv_stahl",18,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",4]],
			["I_Truck_02_covered_F", ["avanix_inv_bpzamak",3,"avanix_inv_plastik",4,"avanix_inv_iron_r",30,"avanix_inv_stahl",18,"avanix_inv_stoff",16,"avanix_inv_glass",4,"avanix_inv_electro",4]],
			["O_Truck_02_box_F", ["avanix_inv_bptempest",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",38,"avanix_inv_stahl",26,"avanix_inv_stoff",10,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["O_Truck_03_transport_F", ["avanix_inv_bptempest",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",38,"avanix_inv_stahl",26,"avanix_inv_stoff",18,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["O_Truck_03_fuel_F", ["avanix_inv_bptempest",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",42,"avanix_inv_stahl",26,"avanix_inv_stoff",10,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["O_Truck_03_covered_F", ["avanix_inv_bptempest",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",45,"avanix_inv_stahl",32,"avanix_inv_stoff",10,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["O_Truck_03_ammo_F", ["avanix_inv_bptempest",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",38,"avanix_inv_stahl",40,"avanix_inv_stoff",10,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["O_Truck_03_device_F", ["avanix_inv_bptempest",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",52,"avanix_inv_stahl",54,"avanix_inv_stoff",10,"avanix_inv_glass",6,"avanix_inv_electro",18]],
			["B_Truck_01_transport_F", ["avanix_inv_bphemtt",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",60,"avanix_inv_stahl",48,"avanix_inv_stoff",10,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["B_Truck_01_fuel_F", ["avanix_inv_bphemtt",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",60,"avanix_inv_stahl",52,"avanix_inv_stoff",10,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["B_Truck_01_covered_F", ["avanix_inv_bphemtt",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",60,"avanix_inv_stahl",48,"avanix_inv_stoff",32,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["B_Truck_01_ammo_F", ["avanix_inv_bphemtt",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",60,"avanix_inv_stahl",56,"avanix_inv_stoff",32,"avanix_inv_glass",6,"avanix_inv_electro",12]],
			["B_Truck_01_box_F", ["avanix_inv_bphemtt",4,"avanix_inv_plastik",4,"avanix_inv_iron_r",60,"avanix_inv_stahl",68,"avanix_inv_stoff",10,"avanix_inv_glass",6,"avanix_inv_electro",6]],
			["B_MRAP_01_F", ["avanix_inv_bphunter",1,"avanix_inv_plastik",4,"avanix_inv_iron_r",30,"avanix_inv_stahl",18,"avanix_inv_stoff",16,"avanix_inv_panzerglass",22,"avanix_inv_electro",4]],
			["O_MRAP_02_F", ["avanix_inv_bpifrit",1,"avanix_inv_plastik",4,"avanix_inv_iron_r",30,"avanix_inv_stahl",18,"avanix_inv_stoff",16,"avanix_inv_panzerglass",28,"avanix_inv_electro",4]],
			["B_Heli_Light_01_F", ["avanix_inv_bpm900",1,"avanix_inv_plastik",10,"avanix_inv_iron_r",16,"avanix_inv_stahl",22,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",8]],
			["C_Heli_Light_01_civil_F", ["avanix_inv_bpm900",1,"avanix_inv_plastik",10,"avanix_inv_iron_r",16,"avanix_inv_stahl",22,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",8]],
			["O_Heli_Light_02_unarmed_F", ["avanix_inv_bporca",2,"avanix_inv_plastik",10,"avanix_inv_iron_r",22,"avanix_inv_stahl",26,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",12]],
			["I_Heli_Transport_02_F", ["avanix_inv_bpmohawk",3,"avanix_inv_plastik",10,"avanix_inv_iron_r",24,"avanix_inv_stahl",34,"avanix_inv_stoff",4,"avanix_inv_glass",4,"avanix_inv_electro",18]],
			["I_Heli_light_03_unarmed_F", ["avanix_inv_bphellcat",3,"avanix_inv_plastik",10,"avanix_inv_iron_r",28,"avanix_inv_stahl",34,"avanix_inv_stoff",4,"avanix_inv_panzerglass",18,"avanix_inv_electro",22]],
			["O_Heli_Transport_04_F", ["avanix_inv_bptaru",4,"avanix_inv_plastik",12,"avanix_inv_iron_r",34,"avanix_inv_stahl",38,"avanix_inv_stoff",4,"avanix_inv_panzerglass",26,"avanix_inv_electro",22]],
			["O_Heli_Transport_04_covered_F", ["avanix_inv_bptaru",4,"avanix_inv_plastik",12,"avanix_inv_iron_r",35,"avanix_inv_stahl",40,"avanix_inv_stoff",4,"avanix_inv_panzerglass",28,"avanix_inv_electro",28]],
			["O_Heli_Transport_04_bench_F", ["avanix_inv_bptaru",4,"avanix_inv_plastik",12,"avanix_inv_iron_r",32,"avanix_inv_stahl",36,"avanix_inv_stoff",20,"avanix_inv_panzerglass",22,"avanix_inv_electro",26]],
			["B_Heli_Transport_03_unarmed_F", ["avanix_inv_bphuron",6,"avanix_inv_plastik",20,"avanix_inv_iron_r",52,"avanix_inv_stahl",60,"avanix_inv_stoff",20,"avanix_inv_panzerglass",36,"avanix_inv_electro",22]],
			["B_SDV_01_F", ["avanix_inv_bpsdv",1,"avanix_inv_plastik",8,"avanix_inv_stahl",6,"avanix_inv_stoff",6,"avanix_inv_electro",4]],
			["C_Boat_Civil_01_F", ["avanix_inv_bpboat",1,"avanix_inv_plastik",8,"avanix_inv_stahl",6,"avanix_inv_stoff",6,"avanix_inv_electro",4]]
		];
	};
};

_return; 