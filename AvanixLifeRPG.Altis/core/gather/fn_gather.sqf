/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	Edit:Avanix Gaming Community
	
	Description:
	Main functionality for gathering.
*/
if(isNil "avanix_action_gathering") then {avanix_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["mango_1","mango_2","mango_3","mango_4","ananas_1","ananas_2","ananas_4","zucker_1","weed_1","heroin_1","baumwolle_1"];
_zone = "";

if(avanix_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
avanix_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	avanix_action_inUse = false;
};

//if (_zone == "uran_1") exitWith {avanix_action_inUse = false; [] call avanix_fnc_searchProteus};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["mango_1","mango_2","mango_3","mango_4"]): {_gather = "mango"; _val = 3;};
	case (_zone in ["ananas_1","ananas_2","ananas_4"]): {_gather = "ananas"; _val = 3;};
	case (_zone in ["weed_1"]): {_gather = "hanf"; _val = 3;};
	case (_zone in ["heroin_1"]): {_gather = "opium"; _val = 3;};
	case (_zone in ["baumwolle_1"]): {_gather = "baumwolle"; _val = 3;};
	case (_zone in ["zucker_1"]): {_gather = "zuckerrohr"; _val = 3;};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [_gather,_val,avanix_carryWeight,avanix_maxWeight] call avanix_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Dein Inventar ist voll."};
avanix_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uisleep 2.5;
};

if(([true,_gather,_diff] call avanix_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
	titleText[format["Du hast %2 %1 gesammelt",_itemName,_diff],"PLAIN"];
};

avanix_action_inUse = false;
