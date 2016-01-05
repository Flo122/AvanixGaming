/*
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Building interaction menu
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];

if(!dialog) then {
	createDialog "pInteraction_Menu";
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
_Btn7 = _display displayCtrl Btn7;
_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;

avanix_pInact_curTarget = _curTarget;

if(_curTarget isKindOf "House_F" && playerside == west) exitWith {
	if((nearestObject [[16778.1,13636.8,0],"Land_Offices_01_V1_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget) then {
		_Btn1 ctrlSetText "Reparieren";
		_Btn1 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_repairDoor; closeDialog 0;";
		_Btn1 ctrlShow true;
			
		_Btn2 ctrlSetText "Öffnen/Schliessen";
		_Btn2 buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_doorAnimate; closeDialog 0;";
		_Btn2 ctrlShow true;		
	} else {
		closeDialog 0;
	};
};

if(_curTarget isKindOf "House_F" && playerside == civilian) exitWith {
	if((nearestObject [[16778.1,13636.8,0],"Land_Offices_01_V1_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget) then {
		_Btn1 ctrlSetText "Code eingeben";
		_Btn1 buttonSetAction "closeDialog 0; [avanix_pInact_curTarget] call avanix_fnc_enterFedKey;";
		_Btn1 ctrlShow true;
		
		_Btn2 ctrlSetText "Aufbrechen";
		_Btn2 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_crowbar; closeDialog 0;";
		_Btn2 ctrlShow true;
	} else {
		closeDialog 0;
	};
};