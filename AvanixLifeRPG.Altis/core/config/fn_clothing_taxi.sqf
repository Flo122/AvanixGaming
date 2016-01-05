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
ctrlSetText[3103,"Taxifahrer Oufit´s"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla2_1",nil,120]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_blu","Rotes Cap",10],
			["H_Cap_blk_ION",nil,10],
			["H_StrawHat",nil,10],
			["H_StrawHat_dark",nil,10],
			["H_Hat_blue",nil,10],
			["H_Hat_brown",nil,10],
			["H_Hat_grey",nil,10],
			["H_Hat_checker",nil,10]
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
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		];
	};
};