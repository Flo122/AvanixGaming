/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _target) exitWith {};

_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if(player distance _target > 5) exitWith {}; //Not close enough.

//Fetch their name so we can shout it.
_targetName = _target getVariable["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];
[player,"revive"] call avanix_fnc_globalSound;
avanix_action_inUse = true; //Lockout the controls.

_target setVariable["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["avanix_progress","PLAIN"];
_ui = uiNamespace getVariable ["avanix_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

//Lets reuse the same thing!
while {true} do
{
	if(animationState player != "ainvpknlmstpsnonwnondr_medic0") then 
	{   
		uisleep 0.4;
		player playMoveNow "ainvpknlmstpsnonwnondr_medic0";   
	};
	uisleep 0.15;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(avanix_istazed) exitWith {}; //Tazed
	if(avanix_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["Reviving",ObjNull] != player) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
_target setVariable["Reviving",NIL,TRUE];
if(!alive player OR avanix_istazed) exitWith {avanix_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned";};
if((player getVariable["restrained",false])) exitWith {avanix_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; avanix_action_inUse = false;};
if(avanix_interrupted) exitWith {avanix_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; avanix_action_inUse = false;};

avanix_atmcash = avanix_atmcash + (call avanix_revive_fee);
avanix_action_inUse = false;
_target setVariable["Revive",TRUE,TRUE];
[[profileName],"avanix_fnc_revived",_target,FALSE] spawn avanix_fnc_MP;
titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[(call avanix_revive_fee)] call avanix_fnc_numberText],"PLAIN"];
uisleep 0.6;
player reveal _target;