class avanix_my_gang_Diag {
	idd = 2620;
	name= "avanix_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
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

		class Title : avanix_RscTitle {
			colorBackground[] = {-1,-1,-1,0.7};
			idc = -1;
			text = "Gang Verwaltung";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.022 * safezoneH;
		};
	
		class GangMemberList : avanix_RscListBox 
		{
			idc = 2621;
			text = "";
			sizeEx = 0.035;
			
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.352 * safezoneH;
		};
		
		class GangLeave : avanix_RscButtonMenu {
			idc = -1;
			text = "Verlassen";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] call avanix_fnc_gangLeave";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class GangLock : avanix_RscButtonMenu 
		{
			idc = 2622;
			text = "Slots erweitern";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] spawn avanix_fnc_gangUpgrade";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class GangKick : avanix_RscButtonMenu 
		{
			idc = 2624;
			text = "Kicken";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] call avanix_fnc_gangKick";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class GangLeader : avanix_RscButtonMenu 
		{
			idc = 2625;
			text = "Neuer Anführer";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] spawn avanix_fnc_gangNewLeader";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		/*
		class GangWar : avanix_RscButtonMenu 
		{
			idc = 2633;
			text = "Gangkriegmenü";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] spawn avanix_fnc_AS_GANG_openMenu;";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		*/
		
		class InviteMember : avanix_RscButtonMenu 
		{
			idc = 2630;
			text = "Spieler einladen";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] spawn avanix_fnc_gangInvitePlayer";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class DisbandGang : avanix_RscButtonMenu 
		{
			idc = 2631;
			text = "Gang auflösen";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] spawn avanix_fnc_gangDisband";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ColorList : avanix_RscCombo
		{
			idc = 2632;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class GangBank : avanix_RscStructuredText 
		{
			idc = 601;
			style = 1;
			text = "";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class avanix_Create_Gang_Diag {
	idd = 2520;
	name= "avanix_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(call avanix_gangPrice)] call avanix_fnc_numberText]};";
	
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
	
		class InfoMsg : avanix_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Title : avanix_RscTitle {
			colorBackground[] = {-1,-1,-1,0.7};
			idc = -1;
			text = "Gang Verwaltung";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class GangCreateField : avanix_RscButtonMenu {
			idc = -1;
			text = "Erstellen";
			colorBackground[] = {-1,-1,-1,0.7};
			onButtonClick = "[] call avanix_fnc_createGang";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CreateGangText : avanix_RscEdit
		{
			idc = 2522;
			text = "Dein Gang Name";
			
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
