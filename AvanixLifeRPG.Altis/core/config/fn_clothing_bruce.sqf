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
			["U_C_Poor_1","Normales Outfit",120],
			["U_C_HunterBody_grn","Jagdkleidung",120],
			["U_NikosAgedBody",nil,120],
			["U_C_Poloshirt_stripped","Avanix Outfit",120],
			["U_NikosBody","Zuhälter Outfit",180],
			["U_OrestesBody","Surfer Outfit",220],
			["U_C_Journalist","Journalist",200],
			["U_Competitor",nil,200]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_red","Rotes Cap",10],
			["H_Cap_blu","Blaues Cap",10],
			["H_Cap_oli","Oliv Cap",10],
			["H_Cap_tan","Tan Cap",10],
			["H_Cap_blk","Schwarzes Cap",10],
			["H_Cap_grn","Grünes Cap",10],
			["H_Bandanna_surfer","Surfer Bandana",20],
			["H_Bandanna_cbr","Koyote Bandana",20],
			["H_Bandanna_gry","Graues Bandana",20],
			["H_StrawHat","Strohhut Hell",20],
			["H_StrawHat_dark","Strohut Dunkel",20],
			["H_Hat_blue","Blauer Hut",30],
			["H_Hat_brown","Brauner Hut",30],
			["H_Hat_grey","Grauer Hut",30],
			["H_Hat_checker","Checker Hut",30],
			["H_Booniehat_khk","Anglerhut",30]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,15],
			["G_Shades_Blue",nil,15],
			["G_Sport_Blackred",nil,15],
			["G_Sport_Checkered",nil,15],
			["G_Sport_Blackyellow",nil,15],
			["G_Sport_BlackWhite",nil,15],
			["G_Squares",nil,15],
			["G_Aviator",nil,15],
			["G_Lady_Mirror",nil,15],
			["G_Lady_Dark",nil,15],
			["G_Lady_Blue",nil,15],
			["G_Lowprofile",nil,15]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_Press_F",nil,3000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_sgg",nil,1600],
			["B_FieldPack_oli",nil,2100],
			["B_Kitbag_sgg",nil,2600],
			["B_TacticalPack_rgr",nil,3000],
			["B_Carryall_khk",nil,5000]
		];
	};
};