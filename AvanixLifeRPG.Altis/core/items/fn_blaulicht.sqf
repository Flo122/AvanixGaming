/*
	File: fn_blaulicht.sqf
	Author: Poseidon
	Edit: Avanix Gaming Community
	
	Description: Attaches a blaulicht to selected vehicle
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!(_unit isKindOf "C_Offroad_01_F")) exitWith {hint "Das Blaulicht passt nur auf einen Offroader";};
if(player distance _unit > 7) exitWith {hint "Du musst dich näher an das Fahrzeug stellen!";};
if(!([false,"blaulicht",1] call avanix_fnc_handleInv)) exitWith {};
closeDialog 0;

avanix_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uisleep 4;
avanix_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Du bist nicht in der Nähe eines Fahrzeugs!","PLAIN"];};
titleText["Du hast das Blaulicht an diesem Fahrzeug angebracht.","PLAIN"];
_unit animate ["HidePolice", 0];