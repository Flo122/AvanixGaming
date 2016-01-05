/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_fuelstation","_upp","_ui","_progress","_pgText","_cP","_previousState","_refill"];
_fuelstation = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;;
avanix_interrupted = false;
if(isNull _fuelstation) exitWith {hint "Du musst die Zapfsäule anschauen!";};
if(!(_fuelstation isKindOF "Land_fs_feed_F")) exitWith {};
if(player distance _fuelstation > 7.5) exitWith {hint "Du musst näher an der Zapfsäule sein!";};

if(!([false,"fuelE",1] call avanix_fnc_handleInv)) exitWith {};
avanix_action_inUse = true;

_upp = format["Kanister wird vollgetankt..."];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["avanix_progress","PLAIN"];
_ui = uiNameSpace getVariable "avanix_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	uisleep 0.2;
	if(isNull _ui) then {
		5 cutRsc ["avanix_progress","PLAIN"];
		_ui = uiNamespace getVariable "avanix_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(avanix_interrupted) exitWith {};
};
avanix_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(avanix_interrupted) exitWith {avanix_interrupted = false; titleText["Aktion abgebrochen","PLAIN"];};

titleText[format["Du hast einen Kanister aufgetankt"],"PLAIN"];
[true,"fuelF",1] call avanix_fnc_handleInv;