/*
    File: fn_pylone.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_pylone"];
_pylone = "RoadCone_L_F" createVehicle [0,0,0];
_pylone attachTo[player,[0,5.5,0.2]];
_pylone setDir 90;
_pylone setVariable["item","pyloneDeployed",true];
avanix_action_pyloneDeploy = player addAction["<t color='#00FF00'>Pylone aufstellen</t>",{if(!isNull avanix_pylone) then {detach avanix_pylone; avanix_pylone = ObjNull;}; player removeAction avanix_action_pyloneDeploy; avanix_action_pyloneDeploy = nil;},"",999,false,false,"",'!isNull avanix_pylone'];
avanix_pylone = _pylone;
waitUntil {isNull avanix_pylone};
if(!isNil "avanix_action_pyloneDeploy") then {player removeAction avanix_action_pyloneDeploy;};
if(isNull _pylone) exitWith {avanix_pylone = ObjNull;};
_pylone setPos [(getPos _pylone select 0),(getPos _pylone select 1),0];
_pylone allowDamage false;
avanix_action_pickupPylone = player addAction["Pylone abbauen",avanix_fnc_packupPylone,"",0,false,false,"",
' _pylone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_pylone" && !isNil {(_pylone getVariable "item")}'];