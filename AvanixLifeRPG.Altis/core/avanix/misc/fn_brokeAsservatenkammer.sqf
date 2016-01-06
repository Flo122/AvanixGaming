/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_asservatenkammer","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_asservatenkammer = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _asservatenkammer) exitWith {};
if({side _x == west} count playableUnits < 5) exitWith {hint "Es sind zu wenig Polizisten Online, das Gold wurde vorher an einem geheimen Ort versteckt."};
if(avanix_inv_crowbar == 0) exitWith {
	titleText["Du hast kein Brecheisen.","PLAIN"];
};
if((nearestObject [[15334.2,17452.3,0],"CargoNet_01_box_F"]) == _asservatenkammer) then {
	if((random 2) > 1) then {
		[[[1,2],"!!!!! DIE ASSERVATENKAMMER WIRD AUSGERAUBT !!!!!!"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
	} else {
		hint "DEINE MUTTER DU FICKER!";
	};
};
avanix_action_inUse = true;

if(currentWeapon player != "") then {
	avanix_curWep_h = currentWeapon player;
	player action ["SwitchWeapon", player, player, 100];
};
//Setup the progress bar
disableSerialization;
_title = "Die Asservatenkammer wird aufgebrochen...";
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
if(!isNil "avanix_curWep_h" && {(avanix_curWep_h != "")}) then {
	if(avanix_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
		player selectWeapon avanix_curWep_h;
	};
};
if(!alive player OR avanix_istazed) exitWith {avanix_action_inUse = false;};
if((player getVariable["restrained",false]) OR (player getVariable["hostage",false])) exitWith {avanix_action_inUse = false;};
if(avanix_interrupted) exitWith {avanix_interrupted = false; titleText["Action cancelled","PLAIN"]; avanix_action_inUse = false;};
avanix_action_inUse = false;
[false,"crowbar",1] call avanix_fnc_handleInv;

_asservatenkammer setVariable["locked",false,true];
