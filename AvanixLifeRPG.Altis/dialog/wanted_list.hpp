class avanix_wanted_menu {
idd = 2400;
name= "avanix_wanted_menu";
movingEnable = false;
enableSimulation = true;

		class controlsBackground 
		{
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

		class controls {


		class Title : avanix_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Fahndungsliste";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class WantedConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
			x = 0.08;
		};

		class WantedList : avanix_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call avanix_fnc_wantedInfo";

			x = 0.340156 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.343 * safezoneH;
		};

		class WantedDetails : avanix_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};

			x = 0.469062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.297 * safezoneH;
		};

		class BountyPrice : avanix_RscText
		{
			idc = 2403;
			text = "";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonPardon_ICON: avanix_RscPicture
		{
			idc = 2406;
			text = "textures\menus\tablet\pardon.paa";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonSettings_ICON: avanix_RscPicture
		{
			idc = 2407;
			text = "textures\menus\tablet\phinzufuegen.paa";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonHinzufuegen: avanix_RscButtonMenu
		{
			idc = 2409;		
			x = 0.634906 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "createDialog ""avanix_wantedadd2"";";
			tooltip = "Hinzufügen";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};

		class ButtonPardon: avanix_RscButtonMenu
		{
			idc = 2410;
			x = 0.593656 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[] call avanix_fnc_pardon;";
			tooltip = "Erlassen";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
	};
};