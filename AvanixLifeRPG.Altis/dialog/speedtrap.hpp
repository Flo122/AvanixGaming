class avanix_speedtrap {
	idd = 8000;
	name= "avanix_speedtrap";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class avanix_RscTitleBackground:avanix_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:avanix_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : avanix_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Blitzermenü";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
        class SpeedlimitEditText : avanix_RscStructuredText
		{
			idc = -1;
			text = "Limit:";
			x = 0.12;
            y = 0.4;
			w = 0.2;
			h = 0.1;
		};

		class SpeedlimitEdit : avanix_RscEdit
        {
            idc = 8001;
            text = "";
            sizeEx = 0.04;
            x = 0.275; 
            y = 0.4;
            w = 0.4; 
            h = 0.04;	
		};

        class SpeedlimitDescription : avanix_RscStructuredText
		{
			idc = -1;
			text = "Eine Toleranz von 3km/h wird automatisch berücksichtigt.";
			x = 0.12;
            y = 0.5;
			w = 0.5;
			h = 0.1;
		};       
        
		class CloseButtonKey : avanix_RscButtonMenu {
			idc = -1;
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SaveButtonKey : avanix_RscButtonMenu {
			idc = 8005;
			text = "Speichern";
			onButtonClick = "[] call avanix_fnc_setSpeedtrapLimit;closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};