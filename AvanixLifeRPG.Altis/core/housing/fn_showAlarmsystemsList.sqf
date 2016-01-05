/*
	File: fn_showAlarmsystemsList.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	shows a list of the alarmsystems
*/
private ["_house","_inventory","_hint_text","_itemName"];
_house = cursorTarget;
if(isNull _house) exitwith {};

_hint_text = "Das Sicherheitssystem:\n";
_hint_text = _hint_text + "--------------------------------------------\n";

_alarmsystems = [_house] call avanix_fnc_getAlarmsystems;
{
    _itemName = [([_x, 0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
    _hint_text = _hint_text + _itemName + "\n";
} foreach (_alarmsystems);

hint _hint_text;