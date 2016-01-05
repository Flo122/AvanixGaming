/*
	File: fn_revokeLicense.sqf
	Author: Michael Francis
	
	Description:
	Allows cops to revoke individual licenses, or all licenses. Vehicle related only.
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
createDialog "revokeLicense_Menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {hint "Wrong target!"; closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {hint "Cannot perform this action!"; closeDialog 0;}; //Bad side check?

_display = findDisplay 41000;
_Btn1 = _display displayCtrl 41002;
_Btn2 = _display displayCtrl 41003;
_Btn3 = _display displayCtrl 41004;
_Btn4 = _display displayCtrl 41005;
_Btn5 = _display DisplayCtrl 41006;
_Btn6 = _display DisplayCtrl 41007;
_Btn7 = _display DisplayCtrl 41008;
_Btn8 = _display DisplayCtrl 41009;
_Btn9 = _display DisplayCtrl 41010;
avanix_pInact_curTarget = _curTarget;
//Driver License
_Btn1 buttonSetAction "[[18],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";

//PKW Führerschein
_Btn2 buttonSetAction "[[4],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";

//LKW Führerschein
_Btn3 buttonSetAction "[[11],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";

//Pilotenschein
_Btn4 buttonSetAction "[[12],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";

//Bootsschein
_Btn5 buttonSetAction "[[13],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";

//Taucherschein
_Btn6 buttonSetAction "[[14],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";

//Transportlizenz
_Btn7 buttonSetAction "[[15],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";

//Alle Führerschein
_Btn8 buttonSetAction "[[16],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";

//Waffenschein
_Btn9 buttonSetAction "[[17],""avanix_fnc_removeLicenses"",avanix_pInact_curTarget,FALSE] spawn avanix_fnc_MP; closeDialog 0;";