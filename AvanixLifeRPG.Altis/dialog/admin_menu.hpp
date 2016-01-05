class avanix_admin_menu {
	idd = 2900;
	name= "avanix_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn avanix_fnc_adminMenu;";
	
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
	
	class controls {

		
		class Title : avanix_RscTitle 
		{
			idc = 2901;
			text = "Admin Menü";
			colorBackground[] = {-1,-1,-1,0.7};
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class PlayerList_Admin : avanix_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn avanix_fnc_adminQuery";
			
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.31 * safezoneH;
		};
		
		class PlayerBInfo : avanix_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.31 * safezoneH;
		};

		class CloseButtonKey : avanix_RscButtonMenu {
			idc = -1;
			text = "Schliessen";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "closeDialog 0;";
			x = 0.338156 * safezoneW + safezoneX;
			y = 0.672 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class AdminID : avanix_RscButtonMenu 
		{
			idc = -1;
			text = "ID abfragen";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] call avanix_fnc_admingetID;";
			x = 0.420656 * safezoneW + safezoneX;
			y = 0.672 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};