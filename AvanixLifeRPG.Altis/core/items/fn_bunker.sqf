/*
    File: fn_bunker.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_bunker"];
_bunker = "Land_BagBunker_Small_F" createVehicle [0,0,0];
_bunker attachTo[player,[0,5.5,0.2]];
_bunker setDir 90;
_bunker setVariable["item","bunkerDeployed",true];
avanix_action_bunkerDeploy = player addAction["<t color='#00FF00'>Bunker aufstellen</t>",{if(!isNull avanix_bunker) then {detach avanix_bunker; avanix_bunker = ObjNull;}; player removeAction avanix_action_bunkerDeploy; avanix_action_bunkerDeploy = nil;},"",999,false,false,"",'!isNull avanix_bunker'];
avanix_bunker = _bunker;
waitUntil {isNull avanix_bunker};
if(!isNil "avanix_action_bunkerDeploy") then {player removeAction avanix_action_bunkerDeploy;};
if(isNull _bunker) exitWith {avanix_bunker = ObjNull;};
_bunker setPos [(getPos _bunker select 0),(getPos _bunker select 1),0];
_bunker allowDamage false;
avanix_action_pickupBunker = player addAction["Bunker abbauen",avanix_fnc_packupBunker,"",0,false,false,"",
' _bunker = nearestObjects[getPos player,["Land_BagBunker_Small_F"],8] select 0; !isNil "_bunker" && !isNil {(_bunker getVariable "item")}'];