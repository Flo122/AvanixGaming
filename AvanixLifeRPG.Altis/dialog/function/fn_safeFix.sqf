/*
	I am so tired of writing this.
*/
private["_vault"];
_vault = _this select 0;
if(!(_vault getVariable["safe_open",false])) exitWith {hint "Der Tresor ist abgeschlossen?"};

avanix_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Tresor wird repariert...";
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
	_cP = _cP + .012;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(avanix_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {avanix_action_inUse = false;};
if(avanix_interrupted) exitWith {avanix_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; avanix_action_inUse = false;};

avanix_action_inUse = false;

_vault setVariable["safe_open",false,true];
hint "Der Tresor wurde repariert.";