/*
    File: fn_medicInteractionMenu.sqf
	Based on fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Replaces the mass addactions for various MEDIC actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];
if(!dialog) then {
	createDialog "pInteraction_Medic";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
		
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
avanix_pInact_curTarget = _curTarget;

//actually the Breathalyser button
_Btn1 ctrlSetText "Ausweis zeigen";
_Btn1 buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_medShowLicense; closeDialog 0;";

//actually the Breathalyser button
_Btn2 ctrlSetText "Alkohol/Drogentest";
_Btn2 buttonSetAction "[[player],""avanix_fnc_alkoholdrugtester"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0";

//Gebe Mitgliedschaft an Target
_Btn3 ctrlSetText "KV geben";
_Btn3 buttonSetAction "['kvcard',avanix_pInact_curTarget] call avanix_fnc_givekvcard; closeDialog 0;";

//Entziehe dem Target die Mitgliedschaft
_Btn4 ctrlSetText "KV nehmen";
_Btn4 buttonSetAction "[[6],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";

//Stelle Rechnung aus
_Btn5 ctrlSetText "Rechnung austellen";
_Btn5 buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_medAction;";

//Operieren
_Btn6 ctrlSetText "Operieren";
_Btn6 buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_medOperieren; closeDialog 0;";



