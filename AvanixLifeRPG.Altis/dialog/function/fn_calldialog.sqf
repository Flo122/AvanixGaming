/*
    File: fn_calldialog.sqf
    Author: alleskapot & Lifted
    Thanks again for all the help alleskapot!
	Edit: Avanix Gaming Community
    Description:
    Calls the Dialog.
    
*/
if(!createDialog "channel") exitWith {hint "Fehler beim Dialog erstelle";}; //Couldn't create the menu?
disableSerialization;