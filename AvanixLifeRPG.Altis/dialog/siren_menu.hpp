class siren_menu {
    idd = 4850;
    name= "siren_menu";
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
		
		class sirenTitle: avanix_RscText
		{
			idc = -1;
			text = "Stadtalarm System";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.022 * safezoneH;
		};
    };
    
    class controls {
        
        class Kavala_Picture: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\sirenmenu\kavala.paa";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.121 * safezoneH;
		};
		
        class ButtonKavala : avanix_RscButtonMenu
        {
            idc = 4802;
            text = "Kavala";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[0] spawn avanix_fnc_sirene;";
            
            x = 0.340156 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
        };
		
		class Athira_Picture: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\sirenmenu\athira.paa";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.121 * safezoneH;
		};
        
        class ButtonAthira : avanix_RscButtonMenu
        {
            idc = 4803;
            text = "Athira";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[1] spawn avanix_fnc_sirene;";
            
            x = 0.505156 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
        };
		
		class Pyrgos_Picture: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\sirenmenu\pyrgos.paa";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.121 * safezoneH;
		};
        
        class ButtonPyrgos : avanix_RscButtonMenu
        {
            idc = 4804;
            text = "Pyrgos";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[2] spawn avanix_fnc_sirene;";
            
            x = 0.340156 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
        };
        
		class Sofia_Picture: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\sirenmenu\sofia.paa";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.121 * safezoneH;
		};
		
        class ButtonSofia : avanix_RscButtonMenu
        {
            idc = 4805;
            text = "Sofia";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[3] spawn avanix_fnc_sirene;";
            
            x = 0.505156 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
        };
    };
};