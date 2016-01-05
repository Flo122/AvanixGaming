/*
    File: fn_barriere_k.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_barriere_k"];
_barriere_k = "RoadBarrier_small_F" createVehicle [0,0,0];
_barriere_k attachTo[player,[0,5.5,0.2]];
_barriere_k setDir 90;
_barriere_k setVariable["item","barriere_kDeployed",true];
avanix_action_barriere_kDeploy = player addAction["<t color='#00FF00'>Barriere aufstellen</t>",{if(!isNull avanix_barriere_k) then {detach avanix_barriere_k; avanix_barriere_k = ObjNull;}; player removeAction avanix_action_barriere_kDeploy; avanix_action_barriere_kDeploy = nil;},"",999,false,false,"",'!isNull avanix_barriere_k'];
avanix_barriere_k = _barriere_k;
waitUntil {isNull avanix_barriere_k};
if(!isNil "avanix_action_barriere_kDeploy") then {player removeAction avanix_action_barriere_kDeploy;};
if(isNull _barriere_k) exitWith {avanix_barriere_k = ObjNull;};
_barriere_k setPos [(getPos _barriere_k select 0),(getPos _barriere_k select 1),0];
_barriere_k allowDamage false;
avanix_action_pickupBarriere_k = player addAction["Kleine Barriere abbauen",avanix_fnc_packupBarriere_k,"",0,false,false,"",
' _barriere_k = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0; !isNil "_barriere_k" && !isNil {(_barriere_k getVariable "item")}'];