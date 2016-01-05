/*
    file: fn_takeOrgans.sqf
    author: [midgetgrimm] - www.grimmlife.com
	Edit: Avanix Gaming Community
    
    taken from the same idea of robbing script by tonic
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if((_unit getVariable ["missingOrgan",FALSE])) exitWith {};
if((player getVariable ["hasOrgan",FALSE])) exitWith {};
if((animationState _unit != "Incapacitated")) exitWith {};
if(!([false,"scalpel",1] call avanix_fnc_handleInv)) exitWith {hint "Du hast kein Scalpel!"};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(avanix_inv_kidney >= 2) exitWith {hint"Dieser Spieler hat keine Niere mehr!"};
if(!([true,"kidney",1] call avanix_fnc_handleInv)) exitWith {hint "Kein Platz für eine Niere."};
avanix_action_inUse = true;
player setVariable["hasOrgan",true,true];
player playMove "AinvPknlMstpSnonWnonDnon_medic";
[player,"organ"] call avanix_fnc_globalSound;
uisleep 3;
_unit setVariable["missingOrgan",true,true];
avanix_action_inUse = false;
[[player], "avanix_fnc_hasOrgan", _unit, false] spawn avanix_fnc_MP;