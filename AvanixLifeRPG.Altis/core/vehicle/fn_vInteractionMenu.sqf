#include <macro.h>
/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Replaces the mass addactions for various vehicle actions
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
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
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
avanix_vInact_curTarget = _curTarget;

if(playerSide == west) then {

	//Set Repair Action
	_Btn1 ctrlSetText "Reparieren";
	_Btn1 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_repairTruck;";
	if("ToolKit" in (items player)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
	
	_Btn2 ctrlSetText "Halter prüfen";
	_Btn2 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_searchVehAction;";
	
	_Btn3 ctrlSetText "Durchsuchen";
	_Btn3 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_vehInvSearch; closeDialog 0;";

	_Btn4 ctrlSetText "Sp. rausziehen";
	_Btn4 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
	
	_Btn5 ctrlSetText "Beschlagnahmen";
	_Btn5 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_impoundPermAction;";
	
	_Btn6 ctrlSetText "Abschleppen";
	_Btn6 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_impoundAction;";
	
	if(_curTarget isKindOf "Ship") then {
		_Btn7 ctrlSetText "Schieben";
		_Btn7 buttonSetAction "[] spawn avanix_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn7 ctrlEnable true;} else {_Btn7 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F"]) then {
			_Btn7 ctrlSetText "Einsteigen";
			_Btn7 buttonSetAction "player moveInDriver avanix_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn7 ctrlEnable true;} else {_Btn7 ctrlEnable false};
		} else {
			_Btn7 ctrlSetText "Drehen";
			_Btn7 buttonSetAction "avanix_vInact_curTarget setPos [getPos avanix_vInact_curTarget select 0, getPos avanix_vInact_curTarget select 1, (getPos avanix_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn7 ctrlEnable false;} else {_Btn7 ctrlEnable true;};
		};
	};
	
	_Btn7 ctrlSetText "ADAC beauftragen";
	_Btn7 buttonSetAction "closeDialog 0;[] call avanix_fnc_adac_call;[avanix_vInact_curTarget] spawn avanix_fnc_adacCallAction;";
	
	_Btn8 ctrlSetText "TÜV prüfen";
	_Btn8 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_searchtuv; closeDialog 0;";
	
	_Btn9 ctrlShow false;
};
if(playerSide == civilian) then {
	
	//Set Repair Action
	_Btn1 ctrlSetText "Reparieren";
	_Btn1 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_repairTruck;";
	
	if("ToolKit" in (items player)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
	
	if(_curTarget isKindOf "Ship") then {
		_Btn2 ctrlSetText "Schieben";
		_Btn2 buttonSetAction "[] spawn avanix_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F"]) then {
			_Btn2 ctrlSetText "Einsteigen";
			_Btn2 buttonSetAction "player moveInDriver avanix_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			_Btn2 ctrlSetText "Drehen";
			_Btn2 buttonSetAction "avanix_vInact_curTarget setPos [getPos avanix_vInact_curTarget select 0, getPos avanix_vInact_curTarget select 1, (getPos avanix_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
		};
	};
	
	if(license_civ_schwarzmarkt) then
	{
		_Btn3 ctrlSetText "Sp. rausziehen";
		_Btn3 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_pulloutAction;";
	} else {
		_Btn3 ctrlShow false;
	};
	
	_Btn4 ctrlSetText "ADAC beauftragen";
	//_Btn4 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_adacCallAction; closeDialog 0;";
	_Btn4 buttonSetAction "closeDialog 0;[] call avanix_fnc_adac_call;[avanix_vInact_curTarget] spawn avanix_fnc_adacCallAction;";

	/*
	_Btn5 ctrlSetText "Teile abbauen";
	_Btn5 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_dismantleVehicleMenu; closeDialog 0;";
	*/
	
	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		_Btn6 ctrlSetText "Abbauen";
		_Btn6 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in avanix_vehicles}) then {
			_Btn6 ctrlEnable false;
		} else {
			_Btn6 ctrlEnable true;
		};
	} else {
		_Btn6 ctrlShow false;
	};
	
	if((vehicle player) getVariable ["copcar", false]) then
    {
        //Wantedlist in cop cars
        _Btn7 ctrlSetText"Wantedlist";
        _Btn7 buttonSetAction  "[""wanted""] spawn avanix_fnc_wantedMenuPublic;closeDialog 0;";
	} else {
        _Btn7 ctrlShow false;
    };
	
	_Btn5 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
};

if(playerSide == independent) then {

	//Set Repair Action
_Btn1 ctrlSetText "Reparieren";
_Btn1 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_repairTruck;";

if("ToolKit" in (items player)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
	if(_curTarget isKindOf "Ship") then {
		_Btn2 ctrlSetText "Schieben";
		_Btn2 buttonSetAction "[] spawn avanix_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F"]) then {
			_Btn2 ctrlSetText "Einsteigen";
			_Btn2 buttonSetAction "player moveInDriver avanix_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			_Btn2 ctrlSetText "Drehen";
			_Btn2 buttonSetAction "avanix_vInact_curTarget setPos [getPos avanix_vInact_curTarget select 0, getPos avanix_vInact_curTarget select 1, (getPos avanix_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
		};
	};
	
	_Btn3 ctrlSetText "Aufbrechen";
	_Btn3 buttonSetAction "closeDialog 0;[[cursorTarget,0], ""avanix_fnc_lockVehicle"",cursorTarget,false] spawn avanix_fnc_MP;";
	
	_Btn4 ctrlSetText "Sp. rausziehen";
	_Btn4 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
	
	_Btn5 ctrlSetText "Abschleppen";
	_Btn5 buttonSetAction "[avanix_vInact_curTarget] spawn avanix_fnc_impoundAction;";
	
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
};
