/*
	File: fn_civInteractionMenu.sqf
	Author: Audacious
	Edit: Avanix Gaming Community
	
	Description:
	Replaces the mass addactions for various civ actions towards another player.
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
	createDialog "pInteraction_Reb";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?
if(!((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !avanix_knockout && !(player getVariable["hostage",false]) && !avanix_istazed)) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
avanix_pInact_curTarget = _curTarget;

//Set _bTorture Button
_Btn1 ctrlSetText "Schlagen";
_Btn1 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_TorturePlayer; closeDialog 0;";

//Set _bTorture Button
_Btn2 ctrlSetText "Elektroschock";
_Btn2 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_elektroschock; closeDialog 0;";

//Set _bTorture Button
_Btn3 ctrlSetText "Waterboarding";
_Btn3 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_waterboarding; closeDialog 0;";

_Btn4 ctrlSetText "Telefon abnehmen";
_Btn4 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_robsmartphoneAction; closeDialog 0;";

_Btn5 ctrlSetText "Sack überziehen";
_Btn5 buttonSetAction "[false,false,avanix_pInact_curTarget] spawn avanix_fnc_bagUse; closeDialog 0;";
	
_Btn6 ctrlSetText "Sack abnehmen";
_Btn6 buttonSetAction "[false,false,avanix_pInact_curTarget] spawn avanix_fnc_removeBag; closeDialog 0;";	