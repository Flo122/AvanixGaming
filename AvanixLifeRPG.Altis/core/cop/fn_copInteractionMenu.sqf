#include <macro.h>
/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Title","_button","_button_list","_idx"];
if(!dialog) then {
	createDialog "pInteraction_Cop";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Title = _display displayCtrl Title;
avanix_pInact_curTarget = _curTarget;

//_Title ctrlSetText name _curTarget;

_button_list = [
                _Btn1,
                _Btn2,
                _Btn3,
                _Btn4,
                _Btn5,
                _Btn6,
                _Btn7,
                _Btn8,
                _Btn9,
				_Btn10
               ];

{
    _x ctrlShow false;
} foreach _button_list;

_idx = 0;

if((_curTarget getVariable["restrained",false]) && playerSide == west) then
{  
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Marke zeigen";
	_button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_copShowLicense; closeDialog 0;";
	_button ctrlShow true;
	
	//Set Unrestrain Button
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Freilassen";
	_button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_unrestrainCop; closeDialog 0;";
	_button ctrlShow true;

	//Set Escort Button
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	if((_curTarget getVariable["Escorting",false])) then {
		_button ctrlSetText "Esk. beenden";
		_button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_stopEscorting; [avanix_pInact_curTarget] call avanix_fnc_copInteractionMenu;";
	} else {
		_button ctrlSetText "Eskortieren";
		_button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_escortAction; closeDialog 0;";
	};
	_button ctrlShow true;

    _button = (_button_list select _idx);
    _idx = _idx + 1;
    _button ctrlSetText "Durchsuchen";
    _button buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_searchAction; closeDialog 0;";
    _button ctrlShow true;

    _button = (_button_list select _idx);
    _idx = _idx + 1;
    _button ctrlSetText "Ticket geben";
    _button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_ticketAction;";
    _button ctrlShow true;

    _button = (_button_list select _idx);
    _idx = _idx + 1;
    _button ctrlSetText "Ins Gefängnis";
	_button buttonSetAction "closeDialog 0; [] call avanix_fnc_showArrestDialog;";
    if(!((player distance (getMarkerPos "jail_marker_1") < 30))) then 
    {
        _button ctrlEnable false;
    };
    _button ctrlShow true;
   
    _button = (_button_list select _idx);
    _idx = _idx + 1;
    _button ctrlSetText "Ins Fahrzeug";
    _button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_putInCar;";
    _button ctrlShow true;
	
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Kl.Durchsuchen";
	_button buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_copSearchPlayer; closeDialog 0;";
	_button ctrlShow true;
	
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Geg.Beschlagnahm";
	_button buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_seizeCheck;";
	_button ctrlShow true;
	
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Lizenz abnehmen";
	_button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_revokeLicense;";
	_button ctrlShow true;
	
} else {

	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Marke zeigen";
	_button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_copShowLicense; closeDialog 0;";
	_button ctrlShow true;
	
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Ausweis geben";
	_button buttonSetAction "['ausweis',avanix_pInact_curTarget] call avanix_fnc_giveausweis; closeDialog 0;";
	_button ctrlShow true;
	
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Lizenz abnehmen";
	_button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_revokeLicense;";
	_button ctrlShow true;
};

if((_curTarget getVariable["hostage",false]) OR (_curTarget getVariable["hostages",false])) then
{  
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Freilassen";
	_button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_unrestrainCiv; closeDialog 0;";
	_button ctrlShow true;
	
	_button = (_button_list select _idx);
	_idx = _idx + 1;
	_button ctrlSetText "Sack abnehmen";
	_button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_bagOff; closeDialog 0;";
	_button ctrlShow true;
};
	