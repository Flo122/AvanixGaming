class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	
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
		
		//Playertags
		class PlayerTagsHeader : avanix_RscText
		{
			idc = -1;
			text = "Spielernamen";
			colorBackground[] = {-1,-1,-1,0.7};
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		//Sidechat
		class SideChatHeader : avanix_RscText
		{
			idc = -1;
			text = "Sidechat Einstellungen";
			colorBackground[] = {-1,-1,-1,0.7};
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		//Objects
		class RevealNearestHeader : avanix_RscText
		{
			idc = -1;
			text = "Objekte in der Nähe";
			colorBackground[] = {-1,-1,-1,0.7};
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		//Einstellungen Überschirft
		class Title : avanix_RscTitle
		{
			idc = -1;
			colorBackground[] = {-1,-1,-1,0.7};
			text = "Einstellungen";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class ButtonFoot_ICON: avanix_RscPicture
		{
			idc = 2033;
			text = "textures\menus\tablet\settings_foot.paa";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonCar_ICON: avanix_RscPicture
		{
			idc = 2033;
			text = "textures\menus\tablet\settings_car.paa";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonAir_ICON: avanix_RscPicture
		{
			idc = 2033;
			text = "textures\menus\tablet\settings_air.paa";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		//Sliderpfeil Links Foot 
		class VD_onfoot_slider : avanix_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call avanix_fnc_s_onSliderChange;";
			tooltip = "Sichtweite zu Fuss";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		//Sliderpfeil Rechts Foot 
		class VD_onfoot_value : avanix_RscText
		{
			idc = 2902;
			text = "";
			
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		//Sliderpfeil Links Car 
		class VD_car_slider : avanix_RscXSliderH 
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call avanix_fnc_s_onSliderChange;";
			tooltip = "Sichtweite in Fahrzeugen";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		//Sliderpfeil Rechts Car 
		class VD_car_value : avanix_RscText
		{
			idc = 2912;
			text = "";
			
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		//Sliderpfeil Links Air
		class VD_air_slider : avanix_RscXSliderH 
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call avanix_fnc_s_onSliderChange;";
			tooltip = "Sichtweite in Helikoptern";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		//Sliderpfeil Rechts Air
		class VD_air_value : avanix_RscText
		{
			idc = 2922;
			text = "";
			
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		//Playertag ONOFF
		class PlayerTagsONOFF : avanix_RscButtonMenu
		{
			text = "AN";
			tooltip = "Regelt, ob Spieler Namensschilder über dem Kopf haben.";
			idc = 2970;
			sizeEx = 0.04;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		//Sidechat ONOFF
		class SideChatONOFF : avanix_RscButtonMenu
		{
			idc = 2971;
			tooltip = "";
			action = "[] call avanix_fnc_sidechat;";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		//Objects ONOFF
		class RevealONOFF : avanix_RscButtonMenu
		{
			tooltip = "Zeigt automatisch nächstgelegene Objekte innerhalb von 15m an, deaktiviere es, wenn du Leistungprobleme hast.";
			idc = 2972;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};