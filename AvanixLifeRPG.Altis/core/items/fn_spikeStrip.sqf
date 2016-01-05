/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a spike strip and preps it.
*/
private["_position","_spikeStrip"];
_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable["item","spikeDeployed",true];

avanix_action_spikeStripDeploy = player addAction["Platziere Nagelketten",{if(!isNull avanix_spikestrip) then {detach avanix_spikeStrip; avanix_spikeStrip = ObjNull;}; player removeAction avanix_action_spikeStripDeploy; avanix_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull avanix_spikestrip'];
avanix_spikestrip = _spikeStrip;
waitUntil {isNull avanix_spikeStrip};
if(!isNil "avanix_action_spikeStripDeploy") then {player removeAction avanix_action_spikeStripDeploy;};
if(isNull _spikeStrip) exitWith {avanix_spikestrip = ObjNull;};
_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;
avanix_action_spikeStripPickup = player addAction["Nagelketten aufheben",avanix_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
[[_spikeStrip],"TON_fnc_spikeStrip",false,false] spawn avanix_fnc_MP; //Send it to the server for monitoring.