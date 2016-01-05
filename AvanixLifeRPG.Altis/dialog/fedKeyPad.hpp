class keypad_menu
{
	idd = 9000;
	name= "keypad_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class avanix_RscTitleBackground: avanix_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};

	class controls 
	{
		class Keygen: avanix_RscStructuredText
		{
			idc = 1100;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Key_1: avanix_RscButtonMenu
		{
			idc = 2400;
			text = "1"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 1] call avanix_fnc_enterFedKey";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_2: avanix_RscButtonMenu
		{
			idc = 2401;
			text = "2"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 2] call avanix_fnc_enterFedKey";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_3: avanix_RscButtonMenu
		{
			idc = 2402;
			text = "3"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 3] call avanix_fnc_enterFedKey";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_4: avanix_RscButtonMenu
		{
			idc = 2403;
			text = "4"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 4] call avanix_fnc_enterFedKey";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_5: avanix_RscButtonMenu
		{
			idc = 2404;
			text = "5"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 5] call avanix_fnc_enterFedKey";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_6: avanix_RscButtonMenu
		{
			idc = 2405;
			text = "6"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 6] call avanix_fnc_enterFedKey";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_7: avanix_RscButtonMenu
		{
			idc = 2406;
			text = "7"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 7] call avanix_fnc_enterFedKey";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_8: avanix_RscButtonMenu
		{
			idc = 2407;
			text = "8"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 8] call avanix_fnc_enterFedKey";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_9: avanix_RscButtonMenu
		{
			idc = 2408;
			text = "9"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 9] call avanix_fnc_enterFedKey";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_Del: avanix_RscButtonMenu
		{
			idc = 2409;
			text = "DEL"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""clear"", 0] call avanix_fnc_enterFedKey";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Key_0: avanix_RscButtonMenu
		{
			idc = 2410;
			text = "0"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""number"", 0] call avanix_fnc_enterFedKey";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Key_Enter: avanix_RscButtonMenu
		{
			idc = 2411;
			text = "ENTER"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""enter"", 0] call avanix_fnc_enterFedKey";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Key_Hack: avanix_RscButtonMenu
		{
			idc = 2412;
			text = "Hack"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[""hack"", 0] call avanix_fnc_enterFedKey";
			x = 0.616614 * safezoneW + safezoneX;
			y = 0.534185 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};