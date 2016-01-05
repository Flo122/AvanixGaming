class avanix_impounded_menu
{
    idd = 28000;
    name="avanix_impounded_menu";
    movingEnabled = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [23300,false];";
    
    class controlsBackground
    {
        class avanix_RscTitleBackground : avanix_RscText
        {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };
        
        class MainBackground : avanix_RscText
        {
            colorBackground[] = {0,0,0,0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.7 - (22 / 250);
        };
        
        class Title : avanix_RscTitle
        {
            idc = 28010;
            text = "Beschlagnahmte/Abgeschleppte Fahrzeuge";
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };
        
        class VehicleTitleBox : avanix_RscText
        {
            idc = -1;
            text = "Deine Fahrzeuge";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.11; y = 0.26;
            w = 0.3;
            h = (1 / 25);
        };
        
        class VehicleInfoHeader : avanix_RscText
        {
            idc = 28300;
            text = "Fahrzeuginfo";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.42; y = 0.26;
            w = 0.46;
            h = (1 / 25);
        };
        
        class CloseBtn : avanix_RscButtonMenu
        {
            idc = -1;
            text = "Schliessen";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
        
        class RentCar : avanix_RscButtonMenu
        {
            idc = -1;
            text = "Kaution bezahlen";
            onButtonClick = "[] call avanix_fnc_willswieder; closeDialog 0;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
    
    class controls
    {
        class VehicleList : avanix_RscListBox
        {
            idc = 28020;
            text = "";
            sizeEx = 0.04;
            colorBackground[] = {0.1,0.1,0.1,0.9};
            onLBSelChanged = "_this call avanix_fnc_impoundLBChange;";
            
            //Position & height
            x = 0.11; y = 0.302;
            w = 0.303; h = 0.49;
        };
        
        class vehicleInfomationList : avanix_RscStructuredText
        {
            idc = 28030;
            text = "";
            sizeEx = 0.035;
            
            x = 0.41; y = 0.3;
            w = 0.5; h = 0.5;
        };
        
        class MainBackgroundHider : avanix_RscText
        {
            colorBackground[] = {0,0,0,1};
            idc = 28100;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.7 - (22 / 250);
        };
        
        class MainHideText : avanix_RscText
        {
            idc = 28110;
            text = "Fahrzeuge werden geladen";
            sizeEx = 0.06;
            x = 0.24; y = 0.5;
            w = 0.6;
            h = (1 / 15);
        };
    };
};