/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
avanix_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"avanix_fnc_animSync",nil,false] spawn avanix_fnc_MP;
[player,"knock"] call avanix_fnc_globalSound;	
uisleep 0.08;
[[_target,profileName],"avanix_fnc_knockedOut",_target,false] spawn avanix_fnc_MP;

uisleep 3;
avanix_knockout = false;