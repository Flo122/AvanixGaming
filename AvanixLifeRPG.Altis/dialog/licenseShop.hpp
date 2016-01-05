class LicenseShop {
idd = 5546;
name= "avanix_license_shop";
movingEnable = false;
enableSimulation = true;
onLoad = "uiNamespace setVariable [""LicenseShop"", _this select 0];";
objects[] = { };

	class controlsBackground 
	{
		class Background : avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\shops\license.paa";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.443959 * safezoneW;
			h = 0.759 * safezoneH;
		};
		
		class listbox: avanix_RscListBox
		{
			idc = 55126;
			sizeEx = 0.035;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.314583 * safezoneW + safezoneX;
			y = 0.321297 * safezoneH + safezoneY;
			w = 0.175104 * safezoneW;
			h = 0.330926 * safezoneH;
		};
		
		class ShowLicenseslistbox: avanix_RscListBox
		{
			idc = 55131;
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
			y = 0.321296 * safezoneH + safezoneY;
			w = 0.175625 * safezoneW;
			h = 0.330926 * safezoneH;
		};
		
		class buybutton: avanix_RscButtonMenu
		{
			idc = 55127;
			action = "if( (lbData[55126,lbCurSel (55126)] != """") ) then { [false, false, false, lbData[55126,lbCurSel (55126)]] call avanix_fnc_buyLicense;}; closeDialog 0;";
			text = ""; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.406769 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0829167 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class sellButton: avanix_RscButtonMenu
		{
			idc = 55128;
			action = "if( (lbData[55131,lbCurSel (55131)] != """") ) then { [false, false, false, lbData[55131,lbCurSel (55131)]] call avanix_fnc_sellLicense;}; closeDialog 0;";
			text = ""; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.677778 * safezoneH + safezoneY;
			w = 0.0834375 * safezoneW;
			h = 0.0198148 * safezoneH;
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
	};
};