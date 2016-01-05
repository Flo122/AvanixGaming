class nanoEMPConsole {
	idd = 3494;
	name= "nanoEMPConsole";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn avanix_fnc_openEmpMenu;";
	
	class controlsBackground 
	{
		class HG: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\emp\emp.paa";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.726 * safezoneH;
		};
	};
	
	class controls 
	{	
		class PlayerList_Admin : avanix_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			//onLBSelChanged = "hint format [""%1"",_this select 1];";
			x = 0.427083 * safezoneW + safezoneX;
			y = 0.346297 * safezoneH + safezoneY;
			w = 0.145937 * safezoneW;
			h = 0.285556 * safezoneH;
		};
		
		class PlayerBInfo : avanix_RscStructuredText
		{
			idc = 2903;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.50151 * safezoneW + safezoneX;
			y = 0.648148 * safezoneH + safezoneY;
			w = 0.0746354 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseButtonKey : avanix_RscButtonMenu {
			idc = -1;
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
			x = 0.551041 * safezoneW + safezoneX;
			y = 0.279629 * safezoneH + safezoneY;
			w = 0.0370833 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		
		class Refresh : avanix_RscButtonMenu {
			idc = -1;
			text = "";
			onButtonClick = "[] spawn avanix_fnc_scanVehicles;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.427083 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0188889 * safezoneH;
		};

		class ExecEMP : avanix_RscButtonMenu {
			idc = 2070;
			text = "";
			onButtonClick = "[] spawn avanix_fnc_empVehicle;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.503646 * safezoneW + safezoneX;
			y = 0.687036 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0188889 * safezoneH;
		};

		class WarnEMP : avanix_RscButtonMenu {
			idc = 2060;
			text = "";
			onButtonClick = "[] spawn avanix_fnc_warnVehicle;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.427083 * safezoneW + safezoneX;
			y = 0.687037 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
	};
};