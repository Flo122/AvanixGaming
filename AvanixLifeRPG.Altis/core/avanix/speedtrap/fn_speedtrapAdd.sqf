/*
	File: fn_speedtrapAdd.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	speedtrap is a speedtrap and sometimes a speedtrap
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/
if(isNil "avanix_speedtrap") then {avanix_speedtrap = ObjNull;};

private["_speedtrap","_var_speedtrap","_value_speedtrap"];

if(playerSide != west) exitWith {hint "Dafür hast du keine Ausbildung.";};
if(vehicle player != player) exitWith {hint "Hast du das schonmal in einem Fahrzeug versucht?";};
if(!isNull avanix_speedtrap) exitWith {hint "Du stellst doch schon einen Blitzer auf... nach 1 kommt 2... man man man";};

_var_speedtrap = ["speedtrap",0] call avanix_fnc_varHandle;
_value_speedtrap = missionNamespace getVariable _var_speedtrap;
if(_value_speedtrap <= 0) exitWith {};

_speedtrap = "Land_Runway_PAPI_4" createVehicle (position player);
_speedtrap setpos  (player modelToWorld [0,1,0]);
_speedtrap setDir ([_speedtrap, player] call BIS_fnc_dirTo);
_speedtrap allowdamage false;
_speedtrap attachTo[player,[0,1.5,0.5]];
_speedtrap setDir 180;

avanix_action_speedtrapDeploy = player addAction["Platziere Blitzer",{if(!isNull avanix_speedtrap) then {detach avanix_speedtrap; avanix_speedtrap = ObjNull;}; player removeAction avanix_action_speedtrapDeploy; avanix_action_speedtrapDeploy = nil;},"",999,false,false,"",'!isNull avanix_speedtrap'];
avanix_speedtrap = _speedtrap;
waitUntil {isNull avanix_speedtrap};
if(!isNil "avanix_action_speedtrapDeploy") then {player removeAction avanix_action_speedtrapDeploy;};
if(isNull _speedtrap) exitWith {};
_speedtrap setPos [(getPos _speedtrap select 0),(getPos _speedtrap select 1),0];

_speedtrap setVariable ["speedtrap_registered", true, true];
_speedtrap setVariable ["speedtrap_active", true, true];
_speedtrap setVariable ["speedtrap_speedlimit", 50, true];
_speedtrap setVariable ["speedtrap_photos", [], true];

if(!([false,"speedtrap",1] call avanix_fnc_handleInv)) exitWith
{
    deleteVehicle _speedtrap;
};

[["", _speedtrap, "Radarfalle", 9999999],"avanix_fnc_addTracavanixInfosToPlayers",west,false] spawn avanix_fnc_MP;

diag_log format ["::Avanix:: speedtrap id=%1 pos=%2 add...", _speedtrap, position _speedtrap];
