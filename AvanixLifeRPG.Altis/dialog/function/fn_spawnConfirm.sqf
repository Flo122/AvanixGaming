/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
if(count avanix_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call avanix_fnc_spawnPointCfg;
	_sp = _spCfg select 0;
	
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1", _sp select 0])}) then {
			player setPos (getMarkerPos (_sp select 0));
		} else {
			_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (_sp select 0));
	};
	titleText[format["%2 %1",_sp select 1,"Du bist gespawnt in"],"BLACK IN"];
}
	else
{
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1",avanix_spawn_point select 0])}) then {
			if((["house",avanix_spawn_point select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (avanix_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call avanix_fnc_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (avanix_spawn_point select 0));
				};
				
				{_bPos = _bPos - [(_house buildingPos _x)];} foreach (_house getVariable ["slots",[]]);
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (avanix_spawn_point select 0));
			};
		} else {
			_spawnPos = (call compile format["%1", avanix_spawn_point select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (avanix_spawn_point select 0));
	};
	titleText[format["%2 %1",avanix_spawn_point select 1,"Du bist gespawnt in"],"BLACK IN"];
};

if(avanix_firstSpawn) then {
	avanix_firstSpawn = false;
    [] execVM "core\avanix\misc\fn_welcomecredits.sqf";
	[] execVM "core\avanix\misc\fn_monitor.sqf";
    //[] call avanix_fnc_welcomeNotification;
};
[] call avanix_fnc_hudSetup;