#include <macro.h>
/*
	File: fn_clothing_med.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Notarzt & THW Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_I_CombatUniform","Rettungsdienst Uniform",650]];           
	};

	//Hats
	case 1:
	{
		if(__GETC__(avanix_medicLevel) > 0) then
		{
			_ret set[count _ret,["H_PilotHelmetFighter_I",nil,1500]];			
		};
        
        if(__GETC__(avanix_medicLevel) > 5) then
		{
			_ret set[count _ret,["H_Beret_02",nil,350]];
		};
	};
	
	//Glasses
	case 2:
	{
        if(__GETC__(avanix_medicLevel) > 1) then
		{
			_ret set[count _ret,["G_Shades_Black",nil,5]];
			_ret set[count _ret,["G_Shades_Blue",nil,5]];
			_ret set[count _ret,["G_Sport_Blackred",nil,5]];
			_ret set[count _ret,["G_Sport_Checkered",nil,5]];
			_ret set[count _ret,["G_Sport_Blackyellow",nil,5]];
			_ret set[count _ret,["G_Sport_BlackWhite",nil,5]];
			_ret set[count _ret,["G_Squares",nil,5]];
			_ret set[count _ret,["G_Aviator",nil,5]];
			_ret set[count _ret,["G_Lowprofile",nil,5]];
		};
	};
	
	//Vest
	case 3:
	{       
	};
	
	//Backpacks
	case 4:
	{
		if(__GETC__(avanix_medicLevel) > 1) then
		{
			_ret set[count _ret,["B_Carryall_oli",nil,500]];
		};
	};
};

_ret;