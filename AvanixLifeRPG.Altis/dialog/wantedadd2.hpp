class avanix_wantedadd2 {
idd = 9900;
name= "avanix_wantedadd2";
movingEnable = false;
enableSimulation = true;
onLoad = "[] spawn avanix_fnc_wantedadd2;";

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
		
		class bountyTitle: avanix_RscText
		{
			idc = -1;
			text = "Kriminelle hinzufügen";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

		class controls {


		class PlayerList_Admin : avanix_RscListBox 
		{
			idc = 9902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn avanix_fnc_adminQuery";

			x = 0.340156 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.363 * safezoneH;
		};


		class RSUCombo_2101: avanix_RscListBox
		{
			idc = 9991;
			text = "";
			sizeEx = 0.035;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.297 * safezoneH;
			// onLBSelChanged="call fnc_Cmb_changed;";
			//--- action/function to call when listbox or combobox has been changed
		};
		
		class ButtonSettings_ICON: avanix_RscPicture
		{
			idc = 2406;
			text = "textures\menus\tablet\phinzufuegen.paa";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonHinzufuegen: avanix_RscButtonMenu
		{
			idc = 2408;		
			x = 0.634906 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[] call avanix_fnc_wanted2;";
			tooltip = "Hinzufügen";
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