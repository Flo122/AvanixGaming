/*
	File: fn_sellLicense.sqf
        Author: Bryan "Tonic" Boardwine

	Description:
	Called when selling a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call avanix_fnc_licensePrice;
_price = _price / 2;
_license = [_type,0] call avanix_fnc_licenseType;

avanix_cash = avanix_cash + _price;
titleText[format[localize "STR_NOTF_ChopSoldCar", _license select 1,[_price] call avanix_fnc_numberText],"PLAIN"];
_toLog = format ["2|%1 (%3) hat %2 für den verkauf einer Lizenz bekommen.", name player, [_price] call avanix_fnc_numberText,getPlayerUID player];
[[_toLog],"Arma3Log"] call avanix_fnc_MP;
missionNamespace setVariable[(_license select 0),false];