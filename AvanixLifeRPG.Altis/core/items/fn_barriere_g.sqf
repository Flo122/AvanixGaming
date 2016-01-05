/*
    File: fn_barriere_g.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_barriere_g"];
_barriere_g = "RoadBarrier_F" createVehicle [0,0,0];
_barriere_g attachTo[player,[0,5.5,0.2]];
_barriere_g setDir 90;
_barriere_g setVariable["item","barriere_gDeployed",true];
avanix_action_barriere_gDeploy = player addAction["Barriere aufstellen",{if(!isNull avanix_barriere_g) then {detach avanix_barriere_g; avanix_barriere_g = ObjNull;}; player removeAction avanix_action_barriere_gDeploy; avanix_action_barriere_gDeploy = nil;},"",999,false,false,"",'!isNull avanix_barriere_g'];
avanix_barriere_g = _barriere_g;
waitUntil {isNull avanix_barriere_g};
if(!isNil "avanix_action_barriere_gDeploy") then {player removeAction avanix_action_barriere_gDeploy;};
if(isNull _barriere_g) exitWith {avanix_barriere_g = ObjNull;};
_barriere_g setPos [(getPos _barriere_g select 0),(getPos _barriere_g select 1),0];
_barriere_g allowDamage false;
avanix_action_pickupBarriere_g = player addAction["Grosse Barriere abbauen",avanix_fnc_packupBarriere_g,"",0,false,false,"",
' _barriere_g = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_barriere_g" && !isNil {(_barriere_g getVariable "item")}'];