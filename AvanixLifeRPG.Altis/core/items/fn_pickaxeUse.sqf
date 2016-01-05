/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_resources","_randomResources","_randomVal","_mine","_itemWeight","_diff","_diff2","_itemName","_itemName2","_val","_mine","_mine2","_val","_val2","_chance","_goNum2"];
_resources = ["sand","rock","copper","iron","blei"];
_randomResources = _resources select floor random count _resources;
_randomVal = 2 + round(random 2);
_val2 = 0;
_goNum2 = false;
_itemName2 = "";

if(avanix_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
if(avanix_inv_pickaxe > 1) exitWith 
{
	call avanix_fnc_axtUse
};

switch (true) do
{
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 3;};
	case (player distance (getMarkerPos "rohoel_1") < 80) : {_mine = "rohoel"; _val = 3;};
	case (player distance (getMarkerPos "mine_1") < 30) : {_mine = _randomResources; _val = _randomVal;_goNum2 = true;};
	case (player distance (getMarkerPos "mine_2") < 30) : {_mine = _randomResources; _val = _randomVal;_goNum2 = true;};
	case (player distance (getMarkerPos "mine_3") < 30) : {_mine = _randomResources; _val = _randomVal;_goNum2 = true;};
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {/*hint "Du bist nicht in der Nähe einer Mine!"*/};
if(avanix_inv_axt > 0) exitWith {hint "Du darfst nur mit einem Abbaugerät arbeiten!";};
if(vehicle player != player) exitWith {hint "Du kannst nicht in deinem Auto abbauen!";};

_diff = [_mine,_val,avanix_carryWeight,avanix_maxWeight] call avanix_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Dein Inventar ist voll."};
avanix_action_gathering = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uisleep 2.5;
};

if(([true,_mine,_diff] call avanix_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
};

//zweite res 
if(_goNum2) then 
{
	_chance = random 5;
	if ( _chance > 4 ) then 
	{
		if(random 10 > 1) then
		{
			if( random 3 < 2 ) then 
			{
				_mine2 = "gold";
				_val2= round (random 2);
			} else {
				_mine2 = "goldnuggets";
				_val2= round (random 2);
			};
		} else {
			_mine2 = "dino";
			_val2=1;
		};
		
		_diff2 = [_mine2,_val2,avanix_carryWeight,avanix_maxWeight] call avanix_fnc_calWeightDiff;
		if(_diff2 == 0) exitWith {hint "Dein Inventar ist voll."};
		avanix_action_gathering = true;

		if(([true,_mine2,_diff2] call avanix_fnc_handleInv)) then
		{
			_itemName2 = [([_mine2,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
		};
	};
};
if(_itemName2 == "") then{
	hint format["Du hast folgendes abgebaut:\n%2x %1\n\n ",_itemName,_diff ];
} else {
	hint format["Du hast folgendes abgebaut:\n%2x %1\n%4x %3\n ",_itemName,_diff,_itemName2,_diff2 ];
};
avanix_action_gathering = false;