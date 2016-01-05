/*
	File: fn_clothingFilter.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Functionality for filtering clothing types in the menu.
*/
disableSerialization;
private["_control","_selection","_list","_filter"];
_control = _this select 0;
_selection = _this select 1;
avanix_clothing_filter = _selection;

if(_selection == 4) then
{
	avanix_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
	avanix_shop_cam camSetPos (player modelToWorld [1,-4,2]);
	avanix_shop_cam camCommit 1;
}
	else
{
	avanix_shop_cam camSetTarget (player modelToWorld [0,0,1]);
	avanix_shop_cam camSetPos (player modelToWorld [1,4,2]);
	avanix_shop_cam camCommit 1;
};

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
lbClear _filter;
lbClear _list;

//Temp code, subjected to become one master config in future
_clothes = switch (avanix_clothing_store) do
{
	case "bruce": {[_selection] call avanix_fnc_clothing_bruce;};
	case "cop": {[_selection] call avanix_fnc_clothing_cop;};
	case "dive": {[_selection] call avanix_fnc_clothing_dive;};
	case "kart": {[_selection] call avanix_fnc_clothing_kart;};
	case "med": {[_selection] call avanix_fnc_clothing_med;};
	case "donator": {[_selection] call avanix_fnc_clothing_donator;};
	case "schwarzmarkt_clothing": {[_selection] call avanix_fnc_clothing_schwarzmarkt;};
	case "taxi": {[_selection] call avanix_fnc_clothing_taxi;};
	case "gang": {[_selection] call avanix_fnc_clothing_gang;};
};

if(count _clothes == 0) exitWith {};
{
	_details = [_x select 0] call avanix_fnc_fetchCfgDetails;
	if(isNil {_x select 1}) then
	{
		_list lbAdd format["%1",(getText(configFile >> (_details select 6) >> (_x select 0) >> "DisplayName"))];
	}
		else
	{
		_list lbAdd format["%1", _x select 1];
	};
	_pic = getText(configFile >> (_details select 6) >> (_x select 0) >> "picture");
	_list lbSetData [(lbSize _list)-1,_x select 0];
	_list lbSetValue [(lbSize _list)-1,_x select 2];
	_list lbSetPicture [(lbSize _list)-1,_pic];
} foreach _clothes;