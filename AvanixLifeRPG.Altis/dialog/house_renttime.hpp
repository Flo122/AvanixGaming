class renthouse
{
	idd = 9000;
	name= "renthouse";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class avanix_RscTitleBackground: avanix_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.341 * safezoneH;
		};
	};

	class controls 
	{
		class Infotext: avanix_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class renttime: avanix_RscStructuredText
		{
			idc = 1101;
			text = "Tage:";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class renttime_edit: avanix_RscEdit
		{
			idc = 2101;
			text = "1";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class rentprice: avanix_RscStructuredText
		{
			idc = 1102;
			text = "Kosten:";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class rentprice_edit: avanix_RscStructuredText
		{
			idc = 2102;
			text = "0";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RentButton: avanix_RscButtonMenu
		{
			idc = 1601;
			text = "Mietvertrag verlängern";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] call avanix_fnc_updateRenttime";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};