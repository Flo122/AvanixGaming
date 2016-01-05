/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
avanix_shop_type = _shop;
avanix_shop_npc = _this select 0;
createDialog "shops_menu";

if(_shop == "cop" && playerSide != west) exitWith {hint "Du bist kein Polizist!"; closeDialog 0;};
if(_shop == "medic" && playerSide != independent) exitWith {hint "Du bist kein Feuerwehrmann!"; closeDialog 0;};
if(_shop == "schwarzmarkt" && !license_civ_schwarzmarkt) exitWith {hint "Du hast keine Schwarzmarktlizenz!"; closeDialog 0;};
if(_shop == "kiosk" && !license_civ_taxi) exitWith {hint "Du hast kein Taxischein!"; closeDialog 0;};

[] call avanix_fnc_virt_update;