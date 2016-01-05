class avanix_key_management {
	idd = 2700;
	name= "avanix_key_chain";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn avanix_fnc_keyMenu;";
	
	class controlsBackground {
		class Key_HG: avanix_RscPicture
		{
			idc = 1202;
			text = "textures\menus\tablet\tablet.paa";
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.572344 * safezoneW;
			h = 0.473 * safezoneH;
		};
	};
	
	class controls {
		class Title: avanix_RscTitle
		{
			idc = -1;
			text = "Schlüsselbund - Aktuelle Liste";
			x = 0.339 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.324844 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		
		class KeyChainList: avanix_RscListbox
		{
			idc = 2701;
			text = "";
			sizeEx = 0.035;
			x = 0.339 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.324844 * safezoneW;
			h = 0.308 * safezoneH;
		};
		
		class NearPlayers: avanix_RscCombo
		{
			idc = 2702;
			x = 0.339 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class GiveKey_ICON: avanix_RscPicture
		{
			idc = 1204;
			text = "textures\menus\tablet\givekey.paa";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class GiveKey: avanix_RscButtonMenu
		{
			idc = 2703;
			onButtonClick = "[] call avanix_fnc_keyGive";
			x = 0.593656 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			tooltip = $STR_Keys_GiveKey;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class DropKey_ICON: avanix_RscPicture
		{
			idc = 1203;
			text = "textures\menus\tablet\dropkey.paa";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class DropKey: avanix_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call avanix_fnc_keyDrop";
			x = 0.634906 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			tooltip = $STR_Keys_DropKey;
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