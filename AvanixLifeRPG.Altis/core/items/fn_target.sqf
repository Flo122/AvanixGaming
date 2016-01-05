/*
    File: fn_target.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_target"];
_target = "Target_F" createVehicle [0,0,0];
_target attachTo[player,[0,5.5,0.2]];
_target setDir 90;
_target setVariable["item","targetDeployed",true];
avanix_action_targetDeploy = player addAction["<t color='#00FF00'>Zielscheibe aufstellen</t>",{if(!isNull avanix_target) then {detach avanix_target; avanix_target = ObjNull;}; player removeAction avanix_action_targetDeploy; avanix_action_targetDeploy = nil;},"",999,false,false,"",'!isNull avanix_target'];
avanix_target = _target;
waitUntil {isNull avanix_target};
if(!isNil "avanix_action_targetDeploy") then {player removeAction avanix_action_targetDeploy;};
if(isNull _target) exitWith {avanix_target = ObjNull;};
_target setPos [(getPos _target select 0),(getPos _target select 1),0];
_target allowDamage false;
avanix_action_pickupTarget = player addAction["Zielscheibe abbauen",avanix_fnc_packupTarget,"",0,false,false,"",
' _target = nearestObjects[getPos player,["Target_F"],8] select 0; !isNil "_target" && !isNil {(_target getVariable "item")}'];