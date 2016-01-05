class Chop_Shop
{
	idd = 39400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground : avanix_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1; y = 0.2;
			w = 0.32; h = (1 / 25);
		};
		
		class MainBackGround : avanix_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1; y = 0.2 + (11 / 250);
			w = 0.32; h = 0.6 - (22 / 250);
		};
		
		class Title : avanix_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "Illegaler Fahrzeughändler";
			x = 0.1; y = 0.2;
			w = 0.32; h = (1 / 25);
		};
		
		class priceInfo : avanix_RscStructuredText
		{
			idc = 39401;
			text = "";
			sizeEx = 0.035;
			x = 0.11; y = 0.68;
			w = 0.2; h = 0.2;
		};
	};
	
	class controls
	{
		class vehicleList : avanix_RscListBox
		{
			idc = 39402;
			onLBSelChanged = "_this call avanix_fnc_chopShopSelection";
			sizeEx = 0.04;
			x = 0.11; y = 0.25;
			w = 0.3; h = 0.38;
		};
		
		class BtnSell : avanix_RscButtonMenu
		{
			idc = -1;
			text = "Verkaufen";
			onButtonclick = "[] call avanix_fnc_chopShopSell;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BtnClose : avanix_RscButtonMenu
		{
			idc = -1;
			text = "Schliessen";
			onButtonClick = "closeDialog 0";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};