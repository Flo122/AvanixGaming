/*
    File: fn_sandsack.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_sandsack"];
_sandsack = "Land_HBarrierBig_F" createVehicle [0,0,0];
_sandsack attachTo[player,[0,5.5,0.2]];
_sandsack setDir 90;
_sandsack setVariable["item","sandsackDeployed",true];
avanix_action_sandsackDeploy = player addAction["<t color='#00FF00'>Sandsackmauer aufstellen</t>",{if(!isNull avanix_sandsack) then {detach avanix_sandsack; avanix_sandsack = ObjNull;}; player removeAction avanix_action_sandsackDeploy; avanix_action_sandsackDeploy = nil;},"",999,false,false,"",'!isNull avanix_sandsack'];
avanix_sandsack = _sandsack;
waitUntil {isNull avanix_sandsack};
if(!isNil "avanix_action_sandsackDeploy") then {player removeAction avanix_action_sandsackDeploy;};
if(isNull _sandsack) exitWith {avanix_sandsack = ObjNull;};
_sandsack setPos [(getPos _sandsack select 0),(getPos _sandsack select 1),0];
_sandsack allowDamage false;
avanix_action_pickupSandsack = player addAction["Sandsackmauer abbauen",avanix_fnc_packupSandsack,"",0,false,false,"",
' _sandsack = nearestObjects[getPos player,["Land_HBarrierBig_F"],8] select 0; !isNil "_sandsack" && !isNil {(_sandsack getVariable "item")}'];