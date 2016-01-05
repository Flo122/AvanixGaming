/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

ctrlSetText[2902, format["%1", tawvd_foot]];
ctrlSetText[2912, format["%1", tawvd_car]];
ctrlSetText[2922, format["%1", tawvd_air]];

//Setup Sliders range
{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
//Setup Sliders speed
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,tawvd_foot],[2911,tawvd_car],[2921,tawvd_air]];

private["_display","_side","_tags","_objs"];
_display = findDisplay 2900;
_side = _display displayCtrl 2971;
_tags = _display displayCtrl 2970;
_objs = _display displayCtrl 2972;

if(isNil "avanix_tagson") then {
	avanix_sidechat = true;
	avanix_tagson = true;
	avanix_revealObjects = true;
};

if(avanix_revealObjects) then {
	_objs ctrlSetTextColor [0,1,0,1];
	_objs ctrlSetText "ON";
	_objs buttonSetAction "[avanix_ID_RevealObjects,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; avanix_revealObjects = false; [] call avanix_fnc_settingsMenu;";
} else {
	_objs ctrlSetTextColor [1,0,0,1];
	_objs ctrlSetText "OFF";
	_objs buttonSetAction "avanix_ID_RevealObjects = [""avanix_RevealObjects"",""onEachFrame"",""avanix_fnc_revealObjects""] call BIS_fnc_addStackedEventHandler; avanix_revealObjects = true; [] call avanix_fnc_settingsMenu;";
};

if(avanix_tagson) then {
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText "ON";
	_tags buttonSetAction "[avanix_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; avanix_tagson = false; [] call avanix_fnc_settingsMenu;";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText "OFF";
	_tags buttonSetAction "avanix_ID_PlayerTags = [""avanix_PlayerTags"",""onEachFrame"",""avanix_fnc_playerTags""] call BIS_fnc_addStackedEventHandler; avanix_tagson = true; [] call avanix_fnc_settingsMenu;";
};

if(avanix_sidechat) then {
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "ON";
} else {
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "OFF";
};