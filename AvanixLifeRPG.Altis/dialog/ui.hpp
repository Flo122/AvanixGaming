#define COLOR_HALF_BLACK { 0, 0, 0, 0.5 }
	
class playerHUD
{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
  	fadeout=0;
	name="playerHUD";
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[]={};
		
	class controlsBackground 
	{
		/*
		class foodHIcon : avanix_RscPicture 
		{
			idc = -1;
			text = "textures\icons\food.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.575;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};
		
		class waterHIcon : avanix_RscPicture 
		{
			idc = -1;
			text = "textures\icons\water.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.510;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};
			
		class healthHIcon : avanix_RscPicture
		{
			idc = -1;
			text = "textures\icons\health.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.445;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};
		*/
			
		class watermark : avanix_RscPicture
		{
			idc = -1;
			text = "textures\icons\watermark.paa";
			x = 0.000 * safezoneW + safezoneX;
			y = 0.810 * safezoneH + safezoneY;
			w = 0.256;
			h = 0.350;
		};
	};
		
	class controls
	{
		/*
		class foodtext
		{
			type=0;
			idc=23500;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
			
		class watertext
		{
			type=0;
			idc=23510;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
			
		class healthtext
		{
			type=0;
			idc=23515;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		*/
	};   
 };