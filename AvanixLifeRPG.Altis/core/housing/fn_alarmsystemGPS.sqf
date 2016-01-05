/*
	File: fn_alarmsystemGPS.sqf
	Edit: Avanix Gaming Community
	
	Description:
*/
private["_robbername","_house","_ownername","_ownerID","_robber"];
_robbername = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_ownername = [_this,2,"",[""]] call BIS_fnc_param;
_ownerID = [_this,3,-1,[1]] call BIS_fnc_param;
_robber = [_this,4,Objnull,[Objnull]] call BIS_fnc_param;

[_robber] spawn {
	_markerName = format["%1_gpstracker",_ownerID];
	_marker = createMarkerLocal [_markerName, visiblePosition _robber];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Einbrecher ",_robbername;
	_marker setMarkerPosLocal getPos _robber;
	
	uisleep 300;
	deleteMarkerLocal _MarkerName;
};
