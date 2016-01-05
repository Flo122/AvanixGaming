/*
	File: craft.hpp
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
class avanix_craft {
	idd = 666;
	name= "avanix_craft";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn avanix_fnc_craft";

	class controlsBackground {
		
		class HG: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\tablet.paa";
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.572344 * safezoneW;
			h = 0.473 * safezoneH;
		};

		class Title : avanix_RscTitle {
			colorBackground[] = {-1,-1,-1,0.7};
			idc = 667;
			text = "Baumenü";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {


		//Craft list
		class craftList : avanix_RscListBox
		{
			idc = 669;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn avanix_fnc_craft_update";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.359 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.33 * safezoneH;
		};

		//Materials list header
		class materialListHeader : avanix_RscText
		{
			idc = 670;
			colorBackground[] = {-1,-1,-1,0.7};
			text = "Benötigte Materialien";
			sizeEx = 0.04;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};

		//Materials list
		class materialList : avanix_RscControlsGroup
		{
			idc = 671;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.319 * safezoneH;


			class Controls
			{
				class mats : avanix_RscStructuredText
				{
					idc = 672;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.118906 * safezoneW;
					h = 0.309 * safezoneH;
				};
			};
		};

		//FILTER
		class FilterList : avanix_RscCombo
		{
			idc = 673;
			colorBackground[] = {-1,-1,-1,0.7};
			onLBSelChanged  = "[] call avanix_fnc_craft_updateFilter";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonCraft_ICON: avanix_RscPicture
		{
			idc = 675;
			text = "textures\menus\tablet\craft.paa";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonCraft: avanix_RscButtonMenu
		{
			idc = 674;
			x = 0.634906 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			tooltip = "Herstellen";
			onButtonClick = "if(!avanix_is_processing) then {[] spawn avanix_fnc_craftAction};";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
	};
};