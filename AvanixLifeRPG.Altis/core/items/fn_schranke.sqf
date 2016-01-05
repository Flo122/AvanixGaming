/*
    File: fn_schranke.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_schranke"];
_schranke = "Land_BarGate_F" createVehicle [0,0,0];
_schranke attachTo[player,[0,5.5,0.2]];
_schranke setDir 90;
_schranke setVariable["item","schrankeDeployed",true];
avanix_action_schrankeDeploy = player addAction["<t color='#00FF00'>Schranke aufstellen</t>",{if(!isNull avanix_schranke) then {detach avanix_schranke; avanix_schranke = ObjNull;}; player removeAction avanix_action_schrankeDeploy; avanix_action_schrankeDeploy = nil;},"",999,false,false,"",'!isNull avanix_schranke'];
avanix_schranke = _schranke;
waitUntil {isNull avanix_schranke};
if(!isNil "avanix_action_schrankeDeploy") then {player removeAction avanix_action_schrankeDeploy;};
if(isNull _schranke) exitWith {avanix_schranke = ObjNull;};
_schranke setPos [(getPos _schranke select 0),(getPos _schranke select 1),0];
_schranke allowDamage false;
avanix_action_pickupSchranke = player addAction["Schranke abbauen",avanix_fnc_packupSchranke,"",0,false,false,"",
' _schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0; !isNil "_schranke" && !isNil {(_schranke getVariable "item")}'];