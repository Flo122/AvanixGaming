/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Gang Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,9000],
            ["U_BG_Guerrilla_6_1",nil,9000],
			["U_I_OfficerUniform",nil,10400],
            ["U_BG_leader",nil,10400],
			["U_BG_Guerilla1_1",nil,11200],
			["U_I_pilotCoveralls",nil,12200],
			["U_I_CombatUniform",nil,12600],
            ["U_I_CombatUniform_shortsleeve",nil,12600],
			["U_I_GhillieSuit",nil,24000],
			["U_I_Wetsuit","Tauchanzug",15000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_brn_SPECOPS",nil,100],
			["H_Cap_blk_Raven",nil,100],
			["H_MilCap_ocamo",nil,140],
			["H_MilCap_mcamo",nil,140],
			["H_Booniehat_indp",nil,220],
			["H_Hat_camo",nil,240],
			["H_Bandanna_camo",nil,300],
			["H_Bandanna_mcamo",nil,300],
			["H_ShemagOpen_tan",nil,1200],
			["H_Shemag_olive",nil,1200],
			["H_ShemagOpen_khk",nil,1200],
			["H_HelmetIA_camo",nil,5200],
			["H_HelmetB_light_grass",nil,8000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,10],
			["G_Shades_Blue",nil,10],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,10],
			["G_Combat",nil,10],
			["G_Diving",nil,10]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_BandollierB_khk",nil,5200],
			["V_Chestrig_khk",nil,5800],
			["V_TacVest_camo",nil,6800],
			["V_TacVestCamo_khk",nil,8200],
			["V_PlateCarrierIA1_dgtl",nil,13000],
			["V_PlateCarrierIA2_dgtl",nil,15800],
			["V_RebreatherIA","Rebreather",20000],
			["V_HarnessOGL_brn","Bombenweste",500000] 
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_rgr",nil,5000],
			["B_AssaultPack_dgtl",nil,5600],
			["B_FieldPack_oli",nil,7000],
			["B_Kitbag_mcamo",nil,7800],
			["B_Carryall_mcamo",nil,10000]
		];
	};
};