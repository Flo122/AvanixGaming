/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call avanix_fnc_licensePrice;
_license = [_type,0] call avanix_fnc_licenseType;

if(avanix_cash < _price) exitWith {hint format["Du hast keine %1€ für einen %2",[_price] call avanix_fnc_numberText,_license select 1];};

avanix_cash = avanix_cash - _price;
titleText[format["Du hast eine %1 für %2€ gekauft", _license select 1,[_price] call avanix_fnc_numberText],"PLAIN"];
_toLog = format ["2|%1 (%3) hat %2 für eine Lizenz bezahlt.", name player, [_price] call avanix_fnc_numberText, getPlayerUID player];
[[_toLog],"Arma3Log"] call avanix_fnc_MP;
missionNamespace setVariable[(_license select 0),true];