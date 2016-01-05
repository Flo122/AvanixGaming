class ausweiserstellen
{
	idd = 8888;
	name= "ausweiserstellen";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Background: avanix_RscText
		{
			idc = -1;
			colorBackground[] = {-1,-1,-1,0.7};
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.352 * safezoneH;
		};
		
		class header: avanix_RscText
		{	
			idc = -1;
			colorBackground[] = {-1,-1,-1,0.7};
			style = 1;
			text = "Personalausweis Bundesrepublik Altis";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls 
	{
		class bewohner_waehlen_text: avanix_RscText
		{
			idc = -1;
			text = "Bewohner wählen";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class name_text: avanix_RscText
		{
			idc = -1;
			text = "Name:";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class vorname_text: avanix_RscText
		{
			idc = -1;
			text = "Vorname:";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class geburtsdatum_text: avanix_RscText
		{
			idc = -1;
			text = "Geburstdatum:";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class geschlecht_text: avanix_RscText
		{
			idc = -1;
			text = "Geschlecht:";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class staatsangehoerigkeit_text: avanix_RscText
		{
			idc = -1;
			text = "Staatsangehörigkeit:";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class wohnort_text: avanix_RscText
		{
			idc = -1;
			text = "Wohnort:";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class einreisedatum_text: avanix_RscText
		{
			idc = -1;
			text = "Einreisedatum:";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class nearestPlayer_combo: avanix_RscCombo
		{
			idc = 88880;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class name_edit: avanix_RscEdit
		{
			idc = 88881;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			text = "";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class vorname_edit: avanix_RscEdit
		{
			idc = 88882;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			text = "";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class geburtsdatum_edit: avanix_RscEdit
		{
			idc = 88883;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			text = "TT.MM.JJJJ";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class geschlecht_combo: avanix_RscCombo
		{
			idc = 88884;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class staatsangehoerigkeit_edit: avanix_RscEdit
		{
			idc = 88885;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			text = "Land";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class wohnort_combo: avanix_RscCombo
		{
			idc = 88886;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class einreisedatum_edit: avanix_RscStructuredText
		{
			idc = 88887;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			text = "TT.MM.JJJJ"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ausweisnummer_text: avanix_RscStructuredText
		{
			idc = 88888;
			text = "Ausweisnr.: "; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.180437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class passbild: avanix_RscPicture
		{
			idc = 88889;
			text = "";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.132 * safezoneH;
		};
		
		class bild_waehlen_combo: avanix_RscCombo
		{
			idc = 88890;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class logo: avanix_RscPicture
		{
			idc = -1;
			text = "";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
		};
		
		class erstellen_button: avanix_RscButtonMenu
		{
			idc = 88891;
			text = "Ausweis erstellen"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};