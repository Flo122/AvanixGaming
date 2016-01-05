class avanix_impound_menu
{
	idd = 2800;
	name="avanix_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground 
	{
		class Background : avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\garage\garage.paa";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.759 * safezoneH;
		};
		
		class CloseBtn : avanix_RscButtonMenu
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
			x = 0.659374 * safezoneW + safezoneX;
			y = 0.251852 * safezoneH + safezoneY;
			w = 0.0448958 * safezoneW;
			h = 0.0253703 * safezoneH;
		};
		
		class RentCar : avanix_RscButtonMenu
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
			onButtonClick = "[] call avanix_fnc_unimpound;";
			x = 0.40677 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0829166 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class BuyCar : avanix_RscButtonMenu 
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
			onButtonClick = "[] call avanix_fnc_sellGarage;  closeDialog 0;";
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0829167 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
	};
	
	class controls
	{
		class VehicleList : avanix_RscListBox
		{
			idc = 2802;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onLBSelChanged = "_this call avanix_fnc_garageLBChange;";
			x = 0.315104 * safezoneW + safezoneX;
			y = 0.321296 * safezoneH + safezoneY;
			w = 0.174583 * safezoneW;
			h = 0.33 * safezoneH;
		};
		
		class vehicleInfomationList : avanix_RscStructuredText
		{
			idc = 2803;
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
			x = 0.510937 * safezoneW + safezoneX;
			y = 0.322223 * safezoneH + safezoneY;
			w = 0.174583 * safezoneW;
			h = 0.329074 * safezoneH;
		};
		
		class MainHideText : avanix_RscText
		{
			idc = 2811;
			text = "Durchsuche nach Fahrzeugen...";
			sizeEx = 0.035;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.324074 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.0229259 * safezoneH;
		};
	};
};