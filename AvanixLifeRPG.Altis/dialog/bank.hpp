class avanix_atm_management {
	idd = 2700;
	name= "avanix_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class HG: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\atm\atm.paa";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.715 * safezoneH;
		};
	};
	
	class controls {

		class CashTitle : avanix_RscStructuredText
		{
			idc = 2701;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.126146 * safezoneW;
			h = 0.110555 * safezoneH;
		};
		
		class WithdrawButton : avanix_RscButtonMenu 
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call avanix_fnc_bankWithdraw";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.500521 * safezoneW + safezoneX;
			y = 0.602778 * safezoneH + safezoneY;
			w = 0.0683334 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class DepositButton : avanix_RscButtonMenu 
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call avanix_fnc_bankDeposit";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.424479 * safezoneW + safezoneX;
			y = 0.602778 * safezoneH + safezoneY;
			w = 0.0683333 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class moneyEdit : avanix_RscEdit 
		{
			idc = 2702;
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.423958 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.144896 * safezoneW;
			h = 0.0179629 * safezoneH;
		};
		
		class PlayerList : avanix_RscCombo 
		{
			idc = 2703;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.423959 * safezoneW + safezoneX;
			y = 0.534259 * safezoneH + safezoneY;
			w = 0.144896 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class TransferButton : avanix_RscButtonMenu 
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call avanix_fnc_bankTransfer";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.461979 * safezoneW + safezoneX;
			y = 0.572222 * safezoneH + safezoneY;
			w = 0.0683333 * safezoneW;
			h = 0.017963 * safezoneH;
		};
		
		class GangDeposit : avanix_RscButtonMenu
		{
			idc = 2705;
			text = "";
			onButtonClick = "[] call avanix_fnc_gangDeposit";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.424479 * safezoneW + safezoneX;
			y = 0.672222 * safezoneH + safezoneY;
			w = 0.0683333 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class GangWitdraw : avanix_RscButtonMenu
		{
			idc = 2706;
			text = "";
			onButtonClick = "[] call avanix_fnc_gangWithdraw";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.500521 * safezoneW + safezoneX;
			y = 0.672222 * safezoneH + safezoneY;
			w = 0.0683333 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class CloseButtonKey : avanix_RscButtonMenu {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.546874 * safezoneW + safezoneX;
			y = 0.277777 * safezoneH + safezoneY;
			w = 0.0370833 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
	};
};