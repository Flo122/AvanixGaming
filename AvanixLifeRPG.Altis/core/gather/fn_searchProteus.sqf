/*
	File: fn_searchProteus.sqf
	Author: DerOnkel
	Edit:Avanix Gaming Community
	
	Description:
	Main functionality for gathering.
*/
private["_randomtime","_val","_diff","_itemName"];
_randomtime = 5 + random(5);
_val = 1 + round(random 3);

if(vehicle player != player) exitWith {};
if(avanix_action_gathering) exitWith {};
if(avanix_action_inUse) exitWith {};

avanix_action_gathering = true;
_diff = ["uranu",_val,avanix_carryWeight,avanix_maxWeight] call avanix_fnc_calWeightDiff;
if(_diff == 0) exitWith {titleText["Dein Inventar ist voll!","PLAIN"]; avanix_action_gathering = false;};

avanix_action_inUse = true;

titleText["Durchsuche HMS Proteus...","PLAIN"];
uisleep _randomtime;

if(([true,"uranu",_diff] call avanix_fnc_handleInv)) then
{
	_itemName = [(["uranu",0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
	titleText[format["Du hast %2 %1 gesammelt",_itemName,_diff],"PLAIN"];
};

uisleep _randomtime;
avanix_action_inUse = false;
avanix_action_gathering = false;
