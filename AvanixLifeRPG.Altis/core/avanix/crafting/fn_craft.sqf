/*
	File: fn_craft.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
private["_dialog","_inv","_itemInfo","_filter"]; //Declare all private variables
if(!dialog) then { //Verify if the window is open
	createDialog "avanix_craft";
};
disableSerialization; //Disable Serialization

if(avanix_is_processing) exitWith{
	closeDialog 2001;
	closeDialog 0;
};

_dialog = findDisplay 666; //find the craft dialog/window
_inv = _dialog displayCtrl 669; //find the listbox of items can be created
lbClear _inv; //clear the listbox

_filter = _dialog displayCtrl 673;
_filter lbAdd "Handfeuerwaffen";
_filter lbSetData[(lbSize _filter)-1,"handfeuerwaffen"];
_filter lbAdd "Machinenpistolen";
_filter lbSetData[(lbSize _filter)-1,"machinenpistolen"];
_filter lbAdd "Gewehre";
_filter lbSetData[(lbSize _filter)-1,"gewehre"];
_filter lbAdd "Machinengewehre";
_filter lbSetData[(lbSize _filter)-1,"machinengewehre"];
_filter lbAdd "Magazine";
_filter lbSetData[(lbSize _filter)-1,"magazine"];
_filter lbAdd "Attachments";
_filter lbSetData[(lbSize _filter)-1,"attachments"];
_filter lbAdd "Zubehör";
_filter lbSetData[(lbSize _filter)-1,"zubehoer"];
_filter lbAdd "Uniformen";
_filter lbSetData[(lbSize _filter)-1,"uniform"];
_filter lbAdd "Westen";
_filter lbSetData[(lbSize _filter)-1,"vest"];
_filter lbAdd "Rucksäcke";
_filter lbSetData[(lbSize _filter)-1,"backpack"];
_filter lbAdd "Items";
_filter lbSetData[(lbSize _filter)-1,"item"];
_filter lbAdd "Fahrzeuge";
_filter lbSetData[(lbSize _filter)-1,"vehicle"];


_filter lbSetCurSel 0;