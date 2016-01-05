/*
    File: fn_axtUse.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
    
    Description:
    Main functionality for Axt in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];

if(avanix_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.

if(avanix_inv_axt > 1) exitWith {};

switch (true) do
{
    case (player distance (getMarkerPos "holz_1") < 30): {_mine = "holz"; _val = 3;};       //den Wert ändern für die Abbauanzahl
    default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {hint "Du bist nicht in der Nähe einer Schürfstelle!";};
if(avanix_inv_pickaxe > 0) exitWith {hint "Du darfst nur mit einem Abbaugerät arbeiten!";};
_diff = [_mine,_val,avanix_carryWeight,avanix_maxWeight] call avanix_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Dein Inventar ist voll."};
delay_pickaxe = true;
avanix_action_gathering = true;
for "_i" from 0 to 1 do
{
    player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uisleep 2.5;
};
if(([true,_mine,_diff] call avanix_fnc_handleInv)) then
{
    _itemName = [([_mine,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
    titleText[format["Du hast %2 %1 abgebaut.",_itemName,_diff],"PLAIN"];
};
uisleep 2.5;
delay_pickaxe = false;
avanix_action_gathering = false;