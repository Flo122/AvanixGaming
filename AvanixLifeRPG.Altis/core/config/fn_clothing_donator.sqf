/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Poor_1","Normales Outfit",25],
			["U_C_Poloshirt_stripped","Avanix Outfit",50],
			["U_NikosBody","Zuhälter Outfit",60],
			["U_OrestesBody","Surfer Outfit",60],
			["U_NikosAgedBody","Anzug",60]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_red","Rotes Cap",5],
			["H_Cap_blu","Blaues Cap",5],
			["H_Cap_oli","Oliv Cap",5],
			["H_Cap_tan","Tan Cap",5],
			["H_Cap_blk","Schwarzes Cap",5],
			["H_Cap_grn","Grünes Cap",5],
			["H_Bandanna_surfer","Surfer Bandana",10],
			["H_Bandanna_cbr","Koyote Bandana",10],
			["H_Bandanna_gry","Graues Bandana",10],
			["H_StrawHat","Strohhut Hell",10],
			["H_StrawHat_dark","Strohut Dunkel",10],
			["H_Hat_blue","Blauer Hut",15],
			["H_Hat_brown","Brauner Hut",15],
			["H_Hat_grey","Grauer Hut",15],
			["H_Hat_checker","Checker Hut",15],
			["H_Booniehat_khk","Anglerhut",15]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,5],
			["G_Shades_Blue",nil,5],
			["G_Sport_Blackred",nil,5],
			["G_Sport_Checkered",nil,5],
			["G_Sport_Blackyellow",nil,5],
			["G_Sport_BlackWhite",nil,5],
			["G_Squares",nil,5],
			["G_Aviator",nil,5],
			["G_Lady_Mirror",nil,5],
			["G_Lady_Dark",nil,5],
			["G_Lady_Blue",nil,5],
			["G_Lowprofile",nil,5]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,300],
			["B_Kitbag_mcamo",nil,450],
			["B_TacticalPack_oli",nil,450],
			["B_FieldPack_ocamo",nil,500],
			["B_Bergen_sgg",nil,600],
			["B_Kitbag_cbr",nil,700],
			["B_Carryall_khk",nil,900]
		];
	};
};