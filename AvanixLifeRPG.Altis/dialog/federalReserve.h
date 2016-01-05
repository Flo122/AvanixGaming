class Federal_Safe
{
	idd = 3500;
	name = "Federal_Safe";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class HG: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\trunk\federalReserve.paa";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.726 * safezoneH;
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
			x = 0.407813 * safezoneW + safezoneX;
			y = 0.276851 * safezoneH + safezoneY;
			w = 0.0714583 * safezoneW;
			h = 0.0229259 * safezoneH;
		};
	};
	
	class Controls
	{
		class TrunkGear : avanix_RscListBox
		{
			idc = 3502;
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
			x = 0.422396 * safezoneW + safezoneX;
			y = 0.343519 * safezoneH + safezoneY;
			w = 0.1475 * safezoneW;
			h = 0.285556 * safezoneH;
		};
		
		class TrunkEdit : avanix_RscEdit
		{
			idc = 3505;
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
			x = 0.421875 * safezoneW + safezoneX;
			y = 0.650926 * safezoneH + safezoneY;
			w = 0.148021 * safezoneW;
			h = 0.017963 * safezoneH;
		};
		
		class TakeItem : avanix_RscButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call avanix_fnc_safeTake;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.5 * safezoneW + safezoneX;
			y = 0.684259 * safezoneH + safezoneY;
			w = 0.0698959 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class ButtonClose : avanix_RscButtonMenu {
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
			x = 0.547396 * safezoneW + safezoneX;
			y = 0.276851 * safezoneH + safezoneY;
			w = 0.0381251 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
	};
};