/*
	File: fn_placeAlarmsystem.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	place a alarmsystem in a house
*/
private["_item", "_house", "_alarmsystems", "_inventory", "_new_inventory", "_houseId", "_owners", "_uid", "_maxCount", "_count", "_handle", "_box", "_containers", "_containerId", "_pos", "_storageData", "_positions"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_house = getPos player nearestObject "House_F"; 
_owners = _house getVariable["house_owner", []];
_uid = getPlayerUID player;

if (player distance _house > 20) exitWith { hint "Du musst in einem Haus sein um das Alarmsystem einzubauen"; };

if (!(_uid in _owners)) exitWith { hint "Das ist nicht dein Haus!"; };

_alarmsystems = [_house] call avanix_fnc_getAlarmsystems;
_inventory = _house getVariable ["avanix_inventory", []];

if((_item == "alarmsystemGPS") && !("alarmsystem" in _alarmsystems)) exitWith { hint "Du hast keine Alarmanlage installiert an die der GPS-Sender passt."; };
if(_item in _alarmsystems) exitWith { hint "Dieses Alarmsystem hast du bereits eingebaut"; };

_houseId = [_house] call avanix_fnc_getBuildID;

_new_inventory = [];
_new_inventory set [0, _item];
_new_inventory set [1, 1];
_inventory set [count _inventory, _new_inventory];

_house setVariable ["avanix_inventory", _inventory, true];

hint "Baue jetzt das Sicherheitssystem ein...";

[false,_item,1] call avanix_fnc_handleInv;
[3] call SOCK_fnc_updatePartial;
//uisleep 0.5;
[[_house, _inventory, playerSide],"TON_fnc_updateHouseTrunk",false,false] spawn avanix_fnc_MP;