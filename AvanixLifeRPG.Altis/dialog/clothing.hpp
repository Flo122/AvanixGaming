class avanix_Clothing {
	idd = 3100;
	name= "avanix_Clothing";
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'core\client\keychain\init.sqf'";
	
	class controlsBackground 
	{
		class Background: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\shops\clothingshop.paa";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.726 * safezoneH;
		};
	};
	
	class controls 
	{		
		class ClothingList : avanix_RscListBox 
		{
			idc = 3101;
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
			onLBSelChanged = "[_this] call avanix_fnc_changeClothes;";
			x = 0.426561 * safezoneW + safezoneX;
			y = 0.350001 * safezoneH + safezoneY;
			w = 0.146459 * safezoneW;
			h = 0.258556 * safezoneH;
		};
		
		class PriceTag : avanix_RscStructuredText
		{
			idc = 3102;
			text = "";
			sizeEx = 0.035;
			x = 0.505624 * safezoneW + safezoneX;
			y = 0.61337 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TotalPrice : avanix_RscStructuredText
		{
			idc = 3106;
			text = "";
			sizeEx = 0.035;
			x = 0.427291 * safezoneW + safezoneX;
			y = 0.612778 * safezoneH + safezoneY;
			w = 0.0690312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class FilterList : avanix_RscCombo
		{
			idc = 3105;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onLBSelChanged  = "_this call avanix_fnc_clothingFilter";
			x = 0.427083 * safezoneW + safezoneX;
			y = 0.658333 * safezoneH + safezoneY;
			w = 0.145938 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class CloseButtonKey : avanix_RscButtonMenu 
		{
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
			x = 0.550521 * safezoneW + safezoneX;
			y = 0.284259 * safezoneH + safezoneY;
			w = 0.0376042 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		
		class BuyButtonKey : avanix_RscButtonMenu 
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call avanix_fnc_buyClothes;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.504166 * safezoneW + safezoneX;
			y = 0.690741 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
	};
};