#include <macro.h>
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

if(_curTarget isKindOf "House_F" && playerside == west) exitWith 
{
	if(!isNil {_curTarget getVariable "house_owner"}) then {
		_Btn1 ctrlSetText "Hausbesitzer";
		_Btn1 buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_copHouseOwner;";
		_Btn1 ctrlShow true;
			
		_Btn2 ctrlSetText "Aufbrechen";
		_Btn2 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_copBreakDoor; closeDialog 0;";
		_Btn2 ctrlShow true;
			
		_Btn3 ctrlSetText "Durchsuchen";
		_Btn3 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_raidHouse; closeDialog 0;";
		_Btn3 ctrlShow true;
			
		if(player distance _curTarget > 3.6) then {
			_Btn3 ctrlEnable false;
		};
			
		_Btn4 ctrlSetText "Zusperren";
		_Btn4 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_lockupHouse; closeDialog 0;";
		_Btn4 ctrlShow true;
	} else {
		closeDialog 0;
	};
};

_houseCfg = [(typeOf _curTarget)] call avanix_fnc_houseConfig;
if(_houseCfg isEqualTo []) exitWith {closeDialog 0;};

if(!(_curTarget in avanix_vehicles) OR isNil {_curTarget getVariable "house_owner"}) then {
	if(_curTarget in avanix_vehicles) then {avanix_vehicles = avanix_vehicles - [_curTarget];};
	_Btn1 ctrlSetText "Mieten";
	_Btn1 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_rentHouse;";
	_Btn1 ctrlShow true;
	
	_Btn2 ctrlSetText "Ausspionieren";
	_Btn2 buttonSetAction "closeDialog 0;[avanix_vInact_curTarget] spawn avanix_fnc_spyOutHouse;";
	_Btn2 ctrlShow true;
		
	_Btn3 ctrlSetText "Aufbrechen";
	_Btn3 buttonSetAction "closeDialog 0;[avanix_vInact_curTarget] spawn avanix_fnc_lockpickHouse;";
	_Btn3 ctrlShow true;
	
	if(__GETC__(avanix_adminlevel) == 2) then
	{
		_Btn4 ctrlSetText "Kaufen";
		_Btn4 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_buyHouse;";
		_Btn4 ctrlShow true;
	} else {_Btn4 ctrlEnable false;};
	
	if(!isNil {_curTarget getVariable "house_owner"}) then {
		_Btn1 ctrlEnable false;
		_Btn4 ctrlEnable false;
	};
} else {
	if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) then {
		if (_curTarget getVariable["rented",""] == 0) then {
			_Btn1 ctrlSetText "Verkaufen";
			_Btn1 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_sellHouse; closeDialog 0;";
			_Btn1 ctrlShow true;
		};
		
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};
		
		_Btn2 ctrlSetText "Garage";
		_Btn2 buttonSetAction "[avanix_pInact_curTarget,""Car""] spawn avanix_fnc_vehicleGarage; closeDialog 0;";
		_Btn2 ctrlShow true;
		
		_Btn3 ctrlSetText "Einparken";
		_Btn3 buttonSetAction "[avanix_pInact_curTarget,player] spawn avanix_fnc_storeVehicle; closeDialog 0;";
		_Btn3 ctrlShow true;
		
		if (_curTarget getVariable["rented",""] == 1) then {
			_Btn4 ctrlSetText "Mietvertrag";
			_Btn4 buttonSetAction "[avanix_pInact_curTarget,player] spawn avanix_fnc_rentmenu; closeDialog 0;";
			_Btn4 ctrlShow true;
		};
	} else {
		if (_curTarget getVariable["rented",""] == 0) then {
			_Btn1 ctrlSetText "Verkaufen";
			_Btn1 buttonSetAction "[avanix_pInact_curTarget] spawn avanix_fnc_sellHouse; closeDialog 0;";
			_Btn1 ctrlShow true;
		};
		
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};
		
		if(_curTarget getVariable ["locked",false]) then {
			_Btn2 ctrlSetText "Lager aufschließen";
		} else {
			_Btn2 ctrlSetText "Lager abschließen";
		};
		_Btn2 buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_lockHouse; closeDialog 0;";
		_Btn2 ctrlShow true;
		
		if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
			_Btn3 ctrlSetText "Licht anschalten";
		} else {
			_Btn3 ctrlSetText "Licht ausschalten";
		};
		_Btn3 buttonSetAction "[avanix_pInact_curTarget] call avanix_fnc_lightHouseAction; closeDialog 0;";
		_Btn3 ctrlShow true;
		
		_Btn4 ctrlSetText "Sicherheit";
		_Btn4 buttonSetAction "closeDialog 0;[avanix_vInact_curTarget] spawn avanix_fnc_showAlarmsystemsList;";
		_Btn4 ctrlShow true;
		
		if (_curTarget getVariable["rented",""] == 1) then {
			_Btn5 ctrlSetText "Mietvertrag";
			_Btn5 buttonSetAction "[avanix_pInact_curTarget,player] spawn avanix_fnc_rentmenu; closeDialog 0;";
			_Btn5 ctrlShow true;
		};
	};
};