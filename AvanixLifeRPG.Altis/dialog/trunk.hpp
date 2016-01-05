class TrunkMenu
{
	idd = 3500;
	name = "TrunkMenu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Background : avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\trunk\trunk.paa";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.759 * safezoneH;
		};
		
		class VehicleWeight : avanix_RscText
		{
			idc = 3504;
			style = 1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.58177 * safezoneW + safezoneX;
			y = 0.25163 * safezoneH + safezoneY;
			w = 0.0761458 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
	};
	
	class Controls
	{
		class TrunkGear : avanix_RscListBox
		{
			idc = 3502;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.030;
			x = 0.314583 * safezoneW + safezoneX;
			y = 0.322222 * safezoneH + safezoneY;
			w = 0.174583 * safezoneW;
			h = 0.297593 * safezoneH;
		};
		
		class PlayerGear : avanix_RscListBox
		{
			idc = 3503;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.030;
			x = 0.510937 * safezoneW + safezoneX;
			y = 0.322222 * safezoneH + safezoneY;
			w = 0.174583 * safezoneW;
			h = 0.297593 * safezoneH;
		};
		
		class TrunkEdit : avanix_RscEdit
		{
			idc = 3505;
			text = "1";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.030;
			x = 0.314584 * safezoneW + safezoneX;
			y = 0.642592 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class PlayerEdit : avanix_RscEdit
		{
			idc = 3506;
			text = "1";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.030;
			x = 0.510938 * safezoneW + safezoneX;
			y = 0.643519 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class TakeItem : avanix_RscButtonMenu
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
			onButtonClick = "[] call avanix_fnc_vehTakeItem;";
			x = 0.40677 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0829167 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class StoreItem : avanix_RscButtonMenu
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
			onButtonClick = "[] call avanix_fnc_vehStoreItem;";
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0829167 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class ButtonClose : avanix_RscButtonMenu 
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
			onButtonClick = "closeDialog 0;";
			x = 0.659375 * safezoneW + safezoneX;
			y = 0.251852 * safezoneH + safezoneY;
			w = 0.044323 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
	};
};