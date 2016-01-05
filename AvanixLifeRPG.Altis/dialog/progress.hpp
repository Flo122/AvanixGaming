class avanix_progress
{
	name = "avanix_progress";
	idd = 38200;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['avanix_progress',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		class background : avanix_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65; h = 0.05;
		};
		class ProgressBar : avanix_RscProgress
		{
			idc = 38201;
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65; h = 0.05;
		};
		
		class ProgressText : avanix_RscText
		{
			idc = 38202;
			text = "Führe Helikopterservice aus (50%)...";
			x = 0.386 * safezoneW + safezoneX;
			y = 0.0635 * safezoneH + safezoneY;
			w = 0.65; h = (1 / 25);
		};
	};
};

class avanix_timer
{
	name = "avanix_timer";
	idd = 38300;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['avanix_timer',_this select 0]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : avanix_RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText : avanix_RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38301;
			text = "";
			x = 0.0204688 * safezoneW + safezoneX;
			y = 0.2778 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};
