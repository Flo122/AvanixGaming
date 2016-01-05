/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(str(_target) in avanix_dp_points) then
{
	private["_point"];
	_point = avanix_dp_points - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
}
	else
{
	_dp = avanix_dp_points call BIS_fnc_selectRandom;
};

avanix_dp_start = _target;

avanix_delivery_in_progress = true;
avanix_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
avanix_cur_task = player createSimpleTask [format["Delivery_%1",avanix_dp_point]];
avanix_cur_task setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
avanix_cur_task setTaskState "Assigned";
player setCurrentTask avanix_cur_task;

["DeliveryAssigned",[format[localize "STR_NOTF_DPTask",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!avanix_delivery_in_progress OR !alive player};
	if(!alive player) then
	{
		avanix_cur_task setTaskState "Failed";
		player removeSimpleTask avanix_cur_task;
		["DeliveryFailed",[localize "STR_NOTF_DPFailed"]] call BIS_fnc_showNotification;
		avanix_delivery_in_progress = false;
		avanix_dp_point = nil;
	};
};