/*
    File: fn_strahler.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_strahler"];
_strahler = "Land_PortableLight_double_F" createVehicle [0,0,0];
_strahler attachTo[player,[0,5.5,0.2]];
_strahler setDir 90;
_strahler setVariable["item","strahlerDeployed",true];
avanix_action_strahlerDeploy = player addAction["<t color='#00FF00'>Strahler aufstellen</t>",{if(!isNull avanix_strahler) then {detach avanix_strahler; avanix_strahler = ObjNull;}; player removeAction avanix_action_strahlerDeploy; avanix_action_strahlerDeploy = nil;},"",999,false,false,"",'!isNull avanix_strahler'];
avanix_strahler = _strahler;
waitUntil {isNull avanix_strahler};
if(!isNil "avanix_action_strahlerDeploy") then {player removeAction avanix_action_strahlerDeploy;};
if(isNull _strahler) exitWith {avanix_strahler = ObjNull;};
_strahler setPos [(getPos _strahler select 0),(getPos _strahler select 1),0];
_strahler allowDamage false;
avanix_action_pickupStrahler = player addAction["Strahler abbauen",avanix_fnc_packupStrahler,"",0,false,false,"",
' _strahler = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0; !isNil "_strahler" && !isNil {(_strahler getVariable "item")}'];