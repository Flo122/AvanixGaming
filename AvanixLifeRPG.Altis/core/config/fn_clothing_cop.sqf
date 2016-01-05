#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Polizei Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_Rangemaster","Polizei",250]];
		_ret set[count _ret,["U_B_Wetsuit","Taucheranzug",250]];
		if(__GETC__(avanix_coplevel) > 5) then
        {
            _ret set[count _ret,["U_B_CombatUniform_mcam_vest","Kommissar Uniform",550]];
        };
        
		if(__GETC__(avanix_coplevel) > 8) then
        {
            _ret set[count _ret,["U_B_CombatUniform_mcam_worn","Einsatzleiter",550]];
        };
        
		if(__GETC__(avanix_coplevel) > 9) then
        {
            _ret set[count _ret,["U_B_CombatUniform_mcam","Bundespolizei",550]];
        };
        
        if(__GETC__(avanix_coplevel) > 10) then
        {
            _ret set[count _ret,["U_BG_Guerrilla_6_1","GSG9",750]];
            _ret set[count _ret,["U_B_survival_uniform","Militär-Taucheranzug",250]];
        };
        
        if(__GETC__(avanix_coplevel) > 11) then
        {
            _ret set[count _ret,["U_B_CTRG_1",nil,750]];
            _ret set[count _ret,["U_B_CTRG_2",nil,750]];
            _ret set[count _ret,["U_B_CTRG_3",nil,750]];
            _ret set[count _ret,["U_I_pilotCoveralls","Piloten Anzug",750]];
			_ret set[count _ret,["U_B_GhillieSuit","Scharfschütze",2500]];
			_ret set[count _ret,["U_B_FullGhillie_sard","SP - Grün-Sand",7500]];
			_ret set[count _ret,["U_B_FullGhillie_ard","SP - Sand",7500]];
            _ret set[count _ret,["U_B_FullGhillie_lsh","SP - Braun-Grün",7500]];
        };
	};

	//Hats
	case 1:
	{
		if(__GETC__(avanix_coplevel) > 1) then
		{
			_ret set[count _ret,["H_Cap_blk",nil,50]];
			_ret set[count _ret,["H_Cap_police",nil,50]];
			_ret set[count _ret,["H_MilCap_blue",nil,50]];
			_ret set[count _ret,["H_Watchcap_blk",nil,120]];
            _ret set[count _ret,["H_Beret_blk_POLICE",nil,90]];
			
		};
        
        if(__GETC__(avanix_coplevel) > 4) then
		{
			_ret set[count _ret,["H_Beret_02",nil,70]];
		};
		
		if(__GETC__(avanix_coplevel) > 6) then
		{
			_ret set[count _ret,["H_BandMask_khk",nil,2500]];
            _ret set[count _ret,["H_Beret_Colonel",nil,90]];
            _ret set[count _ret,["H_CrewHelmetHeli_B","Crew Helm Schwarz",2500]];
            _ret set[count _ret,["H_PilotHelmetHeli_B","Piloten Helm Schwarz",2500]];
		};
        
		if(__GETC__(avanix_coplevel) > 11) then
		{
			_ret set[count _ret,["H_Bandanna_khk_hs",nil,90]];
            _ret set[count _ret,["H_MilCap_gry",nil,90]];
            _ret set[count _ret,["H_Cap_headphones",nil,90]];
            _ret set[count _ret,["H_Cap_oli_hs",nil,90]];
			_ret set[count _ret,["H_HelmetSpecB","GSG9 Helm",2500]];
            _ret set[count _ret,["H_CrewHelmetHeli_O","Crew Helm Grün",2500]];
            _ret set[count _ret,["H_PilotHelmetHeli_O","Piloten Helm Grün",2500]];
            _ret set[count _ret,["H_HelmetLeaderO_oucamo","GSG9 SP Helm",2500]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret set[count _ret,["G_Shades_Black",nil,5]];
		_ret set[count _ret,["G_Shades_Blue",nil,5]];
		_ret set[count _ret,["G_Aviator",nil,5]];
		_ret set[count _ret,["G_Squares",nil,5]];
		_ret set[count _ret,["G_Lowprofile",nil,5]];
		_ret set[count _ret,["G_Tactical_Black",nil,5]];
		_ret set[count _ret,["G_Diving",nil,500]];
        
        if(__GETC__(avanix_coplevel) > 6) then
		{
			_ret set[count _ret,["G_Combat",nil,5]];
            _ret set[count _ret,["G_Bandanna_aviator",nil,350]];
		};
        
		if(__GETC__(avanix_coplevel) > 11) then
		{
            _ret set[count _ret,["G_Bandanna_oli",nil,350]];
			_ret set[count _ret,["G_Balaclava_blk",nil,350]];
			_ret set[count _ret,["G_Balaclava_combat",nil,350]];
		};
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["V_Rangemaster_belt",nil,2500]];
		_ret set[count _ret,["V_TacVest_blk_POLICE","Polizei Weste",7500]];
        _ret set[count _ret,["V_RebreatherB","Tauchgerät",7500]];
        if(__GETC__(avanix_coplevel) > 6) then
		{
			_ret set[count _ret,["V_Chestrig_blk",nil,9000]];
            _ret set[count _ret,["V_PlateCarrier1_blk",nil,9000]];
            _ret set[count _ret,["V_PlateCarrierSpec_blk",nil,9000]];
		};
        
        if(__GETC__(avanix_coplevel) > 11) then
		{
            _ret set[count _ret,["V_Chestrig_rgr",nil,9000]];
            _ret set[count _ret,["V_HarnessOGL_gry",nil,9000]];
            _ret set[count _ret,["V_TacVestIR_blk",nil,8500]];
            _ret set[count _ret,["V_PlateCarrierL_CTRG",nil,9000]];
            _ret set[count _ret,["V_PlateCarrierH_CTRG",nil,9000]];
            _ret set[count _ret,["V_PlateCarrierSpec_rgr",nil,9000]];
			_ret set[count _ret,["V_PlateCarrierSpec_blk",nil,9000]];
            _ret set[count _ret,["V_PlateCarrierGL_rgr",nil,9000]];
			_ret set[count _ret,["V_PlateCarrierGL_blk",nil,12000]];			
		};        
	};
	
	//Backpacks
	case 4:
	{
		_ret set[count _ret,["B_Carryall_oli",nil,600]];
		_ret set[count _ret,["B_Parachute",nil,3000]];
		if(__GETC__(avanix_coplevel) > 6) then
		{
			_ret set[count _ret,["B_UAV_01_backpack_F","UAV Drone",15000]];
		};
		if(__GETC__(avanix_coplevel) > 10) then
		{
			_ret set[count _ret,["B_Static_Designator_01_weapon_F","Mobiler Designator",20000]];
		};
	};
};

_ret;