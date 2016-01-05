class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "['guns'] execVM 'gear\switch.sqf'";
	
	class controlsBackground 
	{
		class Background : avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\shops\itemshop.paa";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.759 * safezoneH;
		};
	};
	
	class controls {

		class itemList : avanix_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			//onLBSelChanged = "[] call fnc_selection";
			x = 0.314583 * safezoneW + safezoneX;
			y = 0.322222 * safezoneH + safezoneY;
			w = 0.174583 * safezoneW;
			h = 0.297593 * safezoneH;
		};
		
		class pItemlist : avanix_RscListBox 
		{
			idc = 2402;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			//onLBSelChanged = "[2502] execVM 'gear\selection.sqf'";
			x = 0.510937 * safezoneW + safezoneX;
			y = 0.322222 * safezoneH + safezoneY;
			w = 0.174583 * safezoneW;
			h = 0.297593 * safezoneH;
		};
		
		/*
		class Title : avanix_RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 2403;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class PlayersName : Title 
		{
			idc = 601;
			style = 1;
			text = "";
		};
		*/
		
		class buyEdit : avanix_RscEdit 
		{
			idc = 2404;
			
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.314584 * safezoneW + safezoneX;
			y = 0.642592 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
	
		class ButtonAddG : avanix_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] spawn avanix_fnc_virt_buy;";
			x = 0.40677 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0829167 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class sellEdit : avanix_RscEdit 
		{
			idc = 2405;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			text = "1";
			sizeEx = 0.030;
			x = 0.510938 * safezoneW + safezoneX;
			y = 0.643519 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		class ButtonRemoveG : avanix_RscButtonMenu
		{
			idc = 38404;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[0] call avanix_fnc_virt_sell";
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0829167 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class sellall: avanix_RscButtonMenu
		{
			idc = 38405;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[1] call avanix_fnc_virt_sell";
			x = 0.603801 * safezoneW + safezoneX;
			y = 0.677444 * safezoneH + safezoneY;
			w = 0.0829687 * safezoneW;
			h = 0.0192222 * safezoneH;
		};
		
		class ButtonClose : avanix_RscButtonMenu 
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.659375 * safezoneW + safezoneX;
			y = 0.251852 * safezoneH + safezoneY;
			w = 0.044323 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
	};
};