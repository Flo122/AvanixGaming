/*
        Written by Florian, DerOnkel
       
        All rights by Silentlife RPG and Avanix Gaming RPG
*/
if (isServer) then 
{
	private["_SpMarker","_dealer_1","_SelMarker_1","_pos_1","_posdir_1","_marker_1","_dir_1","_dealer_2","_SelMarker_2","_pos_2","_posdir_2","_marker_2","_dir_2"];
	//Dealer
	_dealer_1 = Dealer_1;
	_dealer_2 = Dealer_2;
	
	// Spawns
	_SpMarker = ["dealerpos_1","dealerpos_2","dealerpos_3","dealerpos_4","dealerpos_5","dealerpos_6","dealerpos_7","dealerpos_8","dealerpos_9","dealerpos_10","dealerpos_11"];
	
	_SelMarker_1 = _SpMarker call BIS_fnc_selectRandom;
	_SelMarker_2 = _SpMarker call BIS_fnc_selectRandom;

	while{_SelMarker_1 == _SelMarker_2} do {	
		_SelMarker_1 = _SpMarker call BIS_fnc_selectRandom;
	};
	
	_marker_1 = _SelMarker_1;
	_marker_2 = _SelMarker_2;
	_pos_1 = getMarkerPos _marker_1;
	_pos_2 = getMarkerPos _marker_2;
	_posdir_1 = markerDir _marker_1;
	_posdir_2 = markerDir _marker_2;
	_dealer_1 setPos _pos_1;
	_dealer_2 setPos _pos_2;
	_dealer_1 setDir _posdir_1;
	_dealer_2 setDir _posdir_2;
	_dir_1 = getDir _dealer_1;
	_dir_2 = getDir _dealer_2;

	if(_dir_1 != _posdir_1) then {uisleep 0.5; _dealer_1 setDir _posdir_1;};
	if(_dir_2 != _posdir_2) then {uisleep 0.5; _dealer_2 setDir _posdir_2;};	

	uisleep 5;
	{
		_x setMarkerType "Empty";	
	} forEach _SpMarker;

	_marker_1 = createMarker ["Marker997", _dealer_1];
	"Marker997" setMarkerColor "ColorRed";
	"Marker997" setMarkerText "DROGENDEALER";
	"Marker997" setMarkerType "hd_warning"; 
	
	_marker_2 = createMarker ["Marker998", _dealer_2]; 
	"Marker998" setMarkerColor "ColorRed";
	"Marker998" setMarkerText "DROGENDEALER";
	"Marker998" setMarkerType "hd_warning";
};