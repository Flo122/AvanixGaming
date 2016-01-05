#include <macro.h>
/*
	File: fn_progressWaitUntilFinished.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	Progressbar mit diversen Abbruchbedingungen
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

private["_progress_time","_progress_text","_ui","_progress","_pgText","_cP","_distance","_success","_time_counter"];

_progress_time = [_this,0,10,[1]] call BIS_fnc_param;
_progress_text = [_this,1,"Bitte warten",[""]] call BIS_fnc_param;
_progress_object = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

//Setup our progress bar.
disableSerialization;
5 cutRsc ["avanix_progress","PLAIN"];
_ui = uiNameSpace getVariable "avanix_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_progress_text];
_progress progressSetPosition 0.01;
_cP = 0.01;
_distance = 0;
_success = false;

if(!isNull _progress_object) then
{
    _distance = player distance _progress_object;
};

avanix_action_inUse = true; //Lock out other actions
avanix_interrupted = false;
_time_counter = 0;

while{true} do
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
    _time_counter = _time_counter + 0.26;
    _cP = (_time_counter / _progress_time);
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_progress_text];
    
    if(_cP >= 1) exitWith
    {
        _success = true;
    };
    
    if(avanix_interrupted) exitWith
    {
        titleText["Aktion abgebrochen","PLAIN"];
        avanix_interrupted = false;
        _success = false;
    };
    
    if(!alive player) exitWith
    {
        titleText["Sie sind tot.","PLAIN"];
        _success = false;
    };
    
    if(!isNull _progress_object && floor(player distance _progress_object) != floor(_distance)) exitWith
    {
        titleText["Sie sind zu weit entfernt.","PLAIN"];
        _success = false;
    };
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
avanix_action_inUse = false;

_success