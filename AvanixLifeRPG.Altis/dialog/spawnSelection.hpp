class avanix_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		
		class BGha: avanix_RscPicture
		{
			idc = 38531;
			text = "textures\menus\spawnmenu\spawnmenu_background.paa";
			x = -0.75;
			y = -0.5;
			w = 2.5;
			h = 2;
		};
		
		class Hintergrund: avanix_RscPicture
		{
			idc = 38311;
			text = "textures\menus\spawnmenu\spawnmenu2.paa";
			/*
			x = -0.25;
			y = -0.1;
			w = 1.5;
			h = 1.2;
			*/
			x = 0.26849 * safezoneW + safezoneX;
			y = 0.0480741 * safezoneH + safezoneY;
			w = 0.463541 * safezoneW;
			h = 0.814926 * safezoneH;
		};
		
		class SpawnPointTitle : avanix_RscTitle
		{
			idc = 38501;
			style = 1;
			text = "";
			sizeEx = 0.03;
			align = "center";
			x = 0.458334 * safezoneW + safezoneX;
			y = 0.683333 * safezoneH + safezoneY;
			w = 0.250625 * safezoneW;
			h = 0.0262963 * safezoneH;
		};
		
		class MapView : avanix_RscMapControl 
		{
			idc = 38502;
			colorBackground[] = {0.47,0.45,0,0.1};
			x = 0.456354 * safezoneW + safezoneX;
			y = 0.312037 * safezoneH + safezoneY;
			w = 0.255729 * safezoneW;
			h = 0.348519 * safezoneH;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: avanix_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			colorBackground[] = {0.47,0.45,0,0.1};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.308854 * safezoneW + safezoneX;
			y = 0.312037 * safezoneH + safezoneY;
			w = 0.133437 * safezoneW;
			h = 0.351296 * safezoneH;
			onLBSelChanged = "_this call avanix_fnc_spawnPointSelected;";
		};
		
		class spawnButton : avanix_RscButtonMenu
		{
			idc = -1;
			text = "";
			align = "center";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] call avanix_fnc_spawnConfirm";
			x = 0.311979 * safezoneW + safezoneX;
			y = 0.683334 * safezoneH + safezoneY;
			w = 0.127708 * safezoneW;
			h = 0.0262963 * safezoneH;	
		};
		/*
		class tsConnectButton : avanix_RscButtonMenu
		{
			idc = 38512;
			text = "";
			align = "center";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "";
			x = 0.298437 * safezoneW + safezoneX;
			y = 0.231481 * safezoneH + safezoneY;
			w = 0.0902083 * safezoneW;
			h = 0.0355556 * safezoneH;
		};
		*/
	};
};