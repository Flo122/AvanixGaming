/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
removeAllContainers player;
removeAllWeapons player;
removeUniform player;
removeVest player;
removeGoggles player;
removeHeadGear player;
player forceAddUniform  "U_I_CombatUniform";
player addBackpack "B_Carryall_oli";
player addItem "FirstAidKit";
player addItem "Medikit";
if(hmd player != "") then {
	player unlinkItem (hmd player);
};

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";

[] call avanix_fnc_saveGear;