/*
	File: fn_civInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine // Tabakhase
	
	Description:
	Replaces the mass addactions for various actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Title","_button","_button_list","_idx"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?
//if(!((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !avanix_knockout && !(player getVariable["restrained",false]) && !avanix_istazed)) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
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
				_Btn7
               ];

{
    _x ctrlShow false;
} foreach _button_list;              
               
_idx = 0;

if((_curTarget getVariable["hostage",false]) && playerSide == civilian && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "") then
{
    //Set Unrestrain Button
    _button = (_button_list select _idx);
    _idx = _idx + 1;
    _button ctrlSetText localize "STR_pInAct_Unrestrain";
    _button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_unrestrainCiv; closeDialog 0;";
    _button ctrlShow true;

    _button = (_button_list select _idx);
    _idx = _idx + 1;
    _button ctrlSetText "Ausrauben";
    _button buttonSetAction "[false,false,avanix_pInact_curTarget] call avanix_fnc_robAction; closeDialog 0;";
    _button ctrlShow true;

    //Set Escort Button
    _button = (_button_list select _idx);
    _idx = _idx + 1;
    if((_curTarget getVariable["Escorting",false])) then
    {
        _button ctrlSetText localize "STR_pInAct_StopEscort";
        _button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_stopEscorting; [avanix_pInact_curTarget] call avanix_fnc_civInteractionMenu;";
    }
    else
    {
        _button ctrlSetText localize "STR_pInAct_Escort";
        _button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_escortAction; closeDialog 0;";
    };
    _button ctrlShow true;

    _button = (_button_list select _idx);
    _idx = _idx + 1;
    _button ctrlSetText localize "STR_pInAct_PutInCar";
    _button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_putInCar; closeDialog 0;";
    _button ctrlShow true;
}
else
{
    _button = (_button_list select _idx);
    _idx = _idx + 1;
    _button ctrlSetText "Lizenzen zeigen";
    _button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_showLicensesMenu;";
    _button ctrlShow true;
};

if((_curTarget getVariable["hostage",false]) && (license_civ_schwarzmarkt) && playerSide == civilian) then
{
    _button = (_button_list select _idx);
    _idx = _idx + 1;
    _button ctrlSetText "Foltern";
    _button buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_rebInteractionMenu;";
	_button ctrlShow true;
};