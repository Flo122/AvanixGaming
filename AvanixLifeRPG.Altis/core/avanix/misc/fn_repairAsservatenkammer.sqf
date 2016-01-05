/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Re-locks the door mainly for the federal reserve structures.
*/
private["_asservatenkammer","_doors","_door","_cP","_cpRate","_ui","_title","_titleText"];
_asservatenkammer = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _asservatenkammer) exitWith {};
avanix_action_inUse = true;
closeDialog 0;
//Setup the progress bar
disableSerialization;
_title = "Die Asservatenkammer wird repariert...";
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
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(avanix_interrupted) exitWith {};
	
	uisleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["avanix_progress","PLAIN"];
		_ui = uiNamespace getVariable "avanix_progress";
	};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {avanix_action_inUse = false;};
if(avanix_interrupted) exitWith {avanix_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; avanix_action_inUse = false;};
avanix_action_inUse = false;
_asservatenkammer setVariable["locked",true,true];