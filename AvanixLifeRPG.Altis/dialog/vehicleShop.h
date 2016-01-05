class avanix_Vehicle_Shop_v2
{
	idd = 2300;
	name="avanix_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground 
	{
		class Background : avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\shops\vehicleshop.paa";
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
			x = 0.659375 * safezoneW + safezoneX;
			y = 0.251852 * safezoneH + safezoneY;
			w = 0.044375 * safezoneW;
			h = 0.0244444 * safezoneH;
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
			onButtonClick = "[false] spawn avanix_fnc_vehicleShopBuy;";
			x = 0.406769 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0829167 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class BuyCar : avanix_RscButtonMenu 
		{
			idc = 2309;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[true] spawn avanix_fnc_vehicleShopBuy;";
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0834375 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
	};
	
	class controls
	{
		class VehicleList : avanix_RscListBox
		{
			idc = 2302;
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
			onLBSelChanged = "_this call avanix_fnc_vehicleShopLBChange";
			x = 0.314583 * safezoneW + safezoneX;
			y = 0.322223 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.303148 * safezoneH;
		};
		
		class ColorList : avanix_RscCombo
		{
			idc = 2304;
			x = 0.314583 * safezoneW + safezoneX;
			y = 0.62963 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class vehicleInfomationList : avanix_RscStructuredText
		{
			idc = 2303;
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
			x = 0.510938 * safezoneW + safezoneX;
			y = 0.322222 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.329074 * safezoneH;
		};
	};
};