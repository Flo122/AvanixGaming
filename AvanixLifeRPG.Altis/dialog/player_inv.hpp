#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class HG: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\tablet.paa";
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.572344 * safezoneW;
			h = 0.473 * safezoneH;
		};
		
		class moneyTitle: avanix_RscText
		{
			idc = -1;
			text = "Geld Statistiken";
			colorBackground[] = {-1,-1,-1,0.7};
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class moneyStatusInfo: avanix_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.077 * safezoneH;
		};
		
		class PlayersName: avanix_RscText
		{	
			idc = carry_weight;
			colorBackground[] = {-1,-1,-1,0.7};
			style = 1;
			text = "";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
	
		class moneyEdit: avanix_RscEdit
		{
			idc = 2018;
			text = "1";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.030;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class NearPlayers: avanix_RscCombo
		{
			idc = 2022;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class moneyDrop: avanix_RscButtonMenu
		{
			idc = 2001;
			text = "Geben";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.482 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] call avanix_fnc_giveMoney";
			tooltip = "Geben";
		};
		
		class refreshButton: avanix_RscButtonMenu
		{
			idc = 2002;
			text = "Aktualisieren";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.508 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] call avanix_fnc_p_UpdatePlayer;";
			tooltip = "Aktualisieren";
		};
		
		class licenseHeader: avanix_RscStructuredText
		{
			idc = -1;
			text = "Lizenzen";
			colorBackground[] = {-1,-1,-1,0.7};
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Licenses_Menu: avanix_RscControlsGroup
		{
			idc = -1;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.308 * safezoneH;
			class controls
			{
				class avanix_licenses: avanix_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.93125 * safezoneW;
					h = 0.505 * safezoneH;
				};
			};
		}
		
		class itemList: avanix_RscListbox
		{
			idc = item_list;
			sizeEx = 0.03;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.176 * safezoneH;
		};
		
		class itemEdit: avanix_RscEdit
		{
			idc = item_edit;
			text = "1";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class iNearPlayers: avanix_RscCombo
		{
			idc = 2023;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RemoveButton_ICON: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\loeschen.paa";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class UseButton_ICON: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\benutzen.paa";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class DropButton_ICON: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\geben.paa";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonSyncData_ICON: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\save.paa";
			x = 0.340312 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonSettings_ICON: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\setting.paa";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonKeys_ICON: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\keys.paa";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonCell_ICON: avanix_RscPicture
		{
			idc = -1;
			text = "textures\menus\tablet\phone.paa";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonGang_ICON: avanix_RscPicture
		{
			idc = 2030;
			text = "textures\menus\tablet\gang.paa";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonWanted_ICON: avanix_RscPicture
		{
			idc = 2031;
			text = "textures\menus\tablet\wanted.paa";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class ButtonAdminMenu_ICON: avanix_RscPicture
		{
			idc = 2032;
			text = "textures\menus\tablet\admin.paa";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.532 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonSiren_ICON: avanix_RscPicture
		{
			idc = 2033;
			text = "textures\menus\tablet\siren.paa";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonTaxi_ICON: avanix_RscPicture
		{
			idc = 2034;
			text = "textures\menus\tablet\taxi.paa";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class ButtonMedicAuftrag_ICON: avanix_RscPicture
		{
			idc = 2035;
			text = "textures\menus\tablet\notarzt_auftrag.paa";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class RemoveButton: avanix_RscButtonMenu
		{
			idc = -1;
			x = 0.552406 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[] call avanix_fnc_removeItem;";
			tooltip = $STR_Global_Remove;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class UseButton: avanix_RscButtonMenu
		{
			idc = -1;
			x = 0.593656 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[] call avanix_fnc_useItem;";
			tooltip = $STR_Global_Use;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class DropButton: avanix_RscButtonMenu
		{
			idc = -1;
			x = 0.634906 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[] call avanix_fnc_giveItem;";
			tooltip = $STR_Global_Give;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};

		class ButtonSyncData: avanix_RscButtonMenu
		{
			idc = -1;
			x = 0.346156 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			tooltip = $STR_PM_SyncData;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonSettings: avanix_RscButtonMenu
		{
			idc = -1;
			x = 0.387406 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[] call avanix_fnc_settingsMenu;";
			tooltip = $STR_Global_Settings;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonKeys: avanix_RscButtonMenu
		{
			idc = -1;
			x = 0.428656 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "createDialog ""avanix_key_management"";";
			tooltip = $STR_PM_KeyChain;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonCell: avanix_RscButtonMenu
		{
			idc = -1;
			x = 0.469906 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[] call avanix_fnc_callCellphone";
			//onButtonClick = "closedialog 0; [] spawn avanix_fnc_openMessages;";
			tooltip = $STR_PM_CellPhone;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonGang: avanix_RscButtonMenu
		{
			idc = 2036;
			x = 0.511156 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "if(isNil ""avanix_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""avanix_Create_Gang_Diag"";} else {[] spawn avanix_fnc_gangMenu;};};";
			tooltip = "Meine Gang";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonWanted: avanix_RscButtonMenu
		{
			idc = 2037;
			x = 0.511156 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[] call avanix_fnc_wantedMenu";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			tooltip = $STR_PM_WantedList;
		};
		
		class ButtonAdmin: avanix_RscButtonMenu
		{
			idc = 2038;
			x = 0.387406 * safezoneW + safezoneX;
			y = 0.541 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			tooltip = "Adminmenu";
			onButtonClick = "createDialog ""avanix_admin_menu"";";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonSiren: avanix_RscButtonMenu
		{
			idc = 2039;
			x = 0.552406 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			tooltip = "Sirenmenü"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;createDialog ""siren_menu"";";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonTaxi: avanix_RscButtonMenu
		{
			idc = 2040;
			x = 0.634906 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			tooltip = "Taximenü"; //--- ToDo: Localize;
			onButtonClick = "if (license_civ_taxi AND avanix_isOnDutyTaxi) then { [] spawn avanix_fnc_openTaxiMenu; } else { hint ""Du bist kein Taxifahrer oder bist nicht im Dienst!""; };";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonNotarztAuftrag: avanix_RscButtonMenu
		{
			idc = 2041;
			x = 0.511156 * safezoneW + safezoneX;
			y = 0.655 * safezoneH + safezoneY;
			w = 0.0189375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "if (playerside == independent AND avanix_isOnDutyMedic) then { [] spawn avanix_fnc_openMedicMenu; } else { hint ""Du bist nicht im Dienst!""; };";
			tooltip = "Auftragsbuch";
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