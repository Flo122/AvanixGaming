/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;

if(avanix_is_arrested) exitWith {
	[] call avanix_fnc_respawned;
};

if(avanix_respawned) then {
	[] call avanix_fnc_respawned;
};
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
if(!(createDialog "avanix_spawn_selection")) exitWith {[] call avanix_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call avanix_fnc_displayHandler"];

_spCfg = [playerSide] call avanix_fnc_spawnPointCfg;

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
	_ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
	_ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
	_ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
} foreach _spCfg;

_sp = _spCfg select 0; //First option is set by default

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call avanix_fnc_setMapPosition;
avanix_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,"Aktueller Spawnpunkt"]];