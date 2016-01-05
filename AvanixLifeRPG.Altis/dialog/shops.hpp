class avanix_weapon_shop
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Background: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\shops\waffenladen.paa";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.726 * safezoneH;
		};
		
		class itemInfo : avanix_RscStructuredText
		{
			idc = 38404;
			text = "";
			sizeEx = 0.035;
			x = 0.505624 * safezoneW + safezoneX;
			y = 0.61337 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class FilterList : avanix_RscCombo
		{
			idc = 38402;
			onLBSelChanged = "_this call avanix_fnc_weaponShopFilter";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.427083 * safezoneW + safezoneX;
			y = 0.658333 * safezoneH + safezoneY;
			w = 0.145938 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
	};
	
	class controls
	{
		class itemList : avanix_RscListBox
		{
			idc = 38403;
			onLBSelChanged = "_this call avanix_fnc_weaponShopSelection";
			sizeEx = 0.035;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.426561 * safezoneW + safezoneX;
			y = 0.350001 * safezoneH + safezoneY;
			w = 0.146459 * safezoneW;
			h = 0.258556 * safezoneH;
		};
		
		class ButtonSell : avanix_RscButtonMenu
		{
			idc = 38405;
			text = "";
			onButtonClick = "[] spawn avanix_fnc_weaponShopBuySell; true";
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
		
		class ButtonBuy : avanix_RscButtonMenu
		{
			idc = 38406;
			text = "";
			onButtonClick = "[] spawn avanix_fnc_weaponShopBuySell; true";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.427604 * safezoneW + safezoneX;
			y = 0.690741 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0198149 * safezoneH;
		};
		
		class ButtonClose : avanix_RscButtonMenu 
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
	};
};
