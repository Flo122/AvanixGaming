////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Shinji, v1.063, #Worery)
////////////////////////////////////////////////////////
class avanix_messages 
{
	idd = 10000;
	name= "avanix_messages";
	onLoad = "uiNamespace setVariable ['avanix_messages', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['avanix_messages', nil]";
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
	class controls 
	{
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = "Nachricht eingeben..."; //--- ToDo: Localize;
			lineSpacing = 1; 
			style = ST_MULTI;
			x = 0.444792 * safezoneW + safezoneX;
			y = 0.320371 * safezoneH + safezoneY;
			w = 0.219375 * safezoneW;
			h = 0.271667 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			onLBSelChanged = "_this call avanix_fnc_getMessage;";
			x = 0.339063 * safezoneW + safezoneX;
			y = 0.344444 * safezoneH + safezoneY;
			w = 0.104687 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Senden"; //--- ToDo: Localize;
			action = "[0]spawn avanix_fnc_playerSent;";
			x = 0.444948 * safezoneW + safezoneX;
			y = 0.618074 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "An Polizei"; //--- ToDo: Localize;
			action = "[1]spawn avanix_fnc_playerSent;";
			x = 0.518386 * safezoneW + safezoneX;
			y = 0.618296 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "An Feuerwehr"; //--- ToDo: Localize;
			action = "[2]spawn avanix_fnc_playerSent;";
			x = 0.591823 * safezoneW + safezoneX;
			y = 0.618778 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscCheckbox_2800: RscCheckbox
		{
			idc = 2800;
			x = 0.650521 * safezoneW + safezoneX;
			y = 0.593519 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.44474 * safezoneW + safezoneX;
			y = 0.296296 * safezoneH + safezoneY;
			w = 0.219947 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Gespeicherte Nachrichten"; //--- ToDo: Localize;
			x = 0.339062 * safezoneW + safezoneX;
			y = 0.32037 * safezoneH + safezoneY;
			w = 0.104531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1401;
			onKeyUp = "[] call avanix_fnc_findUser;";
			x = 0.339063 * safezoneW + safezoneX;
			y = 0.296296 * safezoneH + safezoneY;
			w = 0.104531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,1};
			text = "Position per GPS melden?"; //--- ToDo: Localize;
			x = 0.444636 * safezoneW + safezoneX;
			y = 0.59363 * safezoneH + safezoneY;
			w = 0.205364 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = "Leeren"; //--- ToDo: Localize;
			onMouseButtonDblClick = "[] call avanix_fnc_clearMessages;";
			x = 0.339009 * safezoneW + safezoneX;
			y = 0.675926 * safezoneH + safezoneY;
			w = 0.104532 * safezoneW;
			h = 0.0210741 * safezoneH;
		};
		class RscButton_1604: RscButton
		{
			idc = 1604;
			text = "Taxi rufen"; //--- ToDo: Localize;
			action = "[] call avanix_fnc_taxi_call;";
			x = 0.444948 * safezoneW + safezoneX;
			y = 0.643074 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

