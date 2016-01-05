class avanix_taxiMenu {
	idd = 6600;
	name= "avanix_taxiMenu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {

		class HG: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\tablet.paa";
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.572344 * safezoneW;
			h = 0.473 * safezoneH;
		};
	};
	
		class controls 
		{
			class RscText_1001: avanix_RscText
			{
				idc = -1;
				colorBackground[] = {-1,-1,-1,0.7};
				text = "Zurzeit aktive Aufträge"; //--- ToDo: Localize;
				x = 0.340156 * safezoneW + safezoneX;
				y = 0.302 * safezoneH + safezoneY;
				w = 0.319688 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class RscListbox_6601: avanix_RscListbox
			{
				idc = 6601;
				sizeEx = 0.03;
				x = 0.340156 * safezoneW + safezoneX;
				y = 0.335 * safezoneH + safezoneY;
				w = 0.319688 * safezoneW;
				h = 0.33 * safezoneH;
			};
			class RscButtonMenu_2400: avanix_RscButtonMenu
			{
				idc = -1;
				text = "Akzeptiere augewählten Auftrag"; //--- ToDo: Localize;
				onButtonClick = "[] spawn avanix_fnc_taxi_acceptCall;";
				colorBackground[] = {-1,-1,-1,0.7};
				x = 0.489687 * safezoneW + safezoneX;
				y = 0.672 * safezoneH + safezoneY;
				w = 0.170156 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class RscButtonMenu_2401: avanix_RscButtonMenu
			{
				idc = -1;
				text = "Abbrechen"; //--- ToDo: Localize;
				onButtonClick = "closeDialog 0;";
				colorBackground[] = {-1,-1,-1,0.7};
				x = 0.340156 * safezoneW + safezoneX;
				y = 0.672 * safezoneH + safezoneY;
				w = 0.0876563 * safezoneW;
				h = 0.022 * safezoneH;
			};
		};
	};