/*
	Player clicked arrest/ok
	Edit: Avanix Gaming Community
*/
private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "avanix_pInact_curTarget") exitWith {hint "Invalid destination."};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call TON_fnc_isnumber)) exitWith
{
	hint "You have to enter a number.";
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 1 || _time > 60) exitWith { hint hint "Du kannst nur zwischen 1 und 60 Minuten einstellen!"; };

closeDialog 0; 
[avanix_pInact_curTarget, _time] call avanix_fnc_arrestAction;