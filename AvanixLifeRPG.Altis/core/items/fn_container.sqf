/*
    File: fn_container.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_container"];
_container = "Land_Medevac_house_V1_F" createVehicle [0,0,0];
_container attachTo[player,[0,5.5,0.2]];
_container setDir 90;
_container setVariable["item","containerDeployed",true];
avanix_action_containerDeploy = player addAction["<t color='#00FF00'>Container aufstellen</t>",{if(!isNull avanix_container) then {detach avanix_container; avanix_container = ObjNull;}; player removeAction avanix_action_containerDeploy; avanix_action_containerDeploy = nil;},"",999,false,false,"",'!isNull avanix_container'];
avanix_container = _container;
waitUntil {isNull avanix_container};
if(!isNil "avanix_action_containerDeploy") then {player removeAction avanix_action_containerDeploy;};
if(isNull _container) exitWith {avanix_container = ObjNull;};
_container setPos [(getPos _container select 0),(getPos _container select 1),0];
_container allowDamage false;
avanix_action_pickupContainer = player addAction["Container abbauen",avanix_fnc_packupContainer,"",0,false,false,"",
' _container = nearestObjects[getPos player,["Land_Medevac_house_V1_F"],8] select 0; !isNil "_container" && !isNil {(_container getVariable "item")}'];