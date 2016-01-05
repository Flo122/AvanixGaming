/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorTarget;
avanix_interrupted = false;
if(avanix_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in avanix_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave";};
if(!(player distance (getMarkerPos "civ_spawn_kavala") > 100)) exitwith {};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
avanix_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["avanix_progress","PLAIN"];
_ui = uiNamespace getVariable "avanix_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	uisleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["avanix_progress","PLAIN"];
		_ui = uiNamespace getVariable "avanix_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(avanix_istazed) exitWith {}; //Tazed
	if(avanix_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR avanix_istazed) exitWith {avanix_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {avanix_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; avanix_action_inUse = false;};
if(avanix_interrupted) exitWith {avanix_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; avanix_action_inUse = false;};
if(!([false,"lockpick",1] call avanix_fnc_handleInv)) exitWith {avanix_action_inUse = false;};

avanix_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice < 30) then {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		avanix_vehicles pushBack _curTarget;
		[[getPlayerUID player,profileName,"487"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
	} else {
		[[_curTarget],"avanix_fnc_carAlarmSound",nil,true] spawn avanix_fnc_MP;
		[[getPlayerUID player,profileName,"215"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
		[[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;
		titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
	};
};