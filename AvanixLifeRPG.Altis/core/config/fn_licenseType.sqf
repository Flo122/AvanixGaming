/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			
			case "driver": {_var = "license_civ_driver"};
			case "truck":{_var = "license_civ_truck"};
			case "boat": {_var = "license_civ_boat"};
			case "pilot": {_var = "license_civ_air"};
			case "dive": {_var = "license_civ_dive"};
			case "transport": {_var = "license_civ_transport"};
			case "taxi": {_var = "license_civ_taxi"};
			
			//Verarbeitungslizenzen Legal
			case "salt": {_var = "license_civ_salt"};
			case "zucker": {_var = "license_civ_zucker"};
			case "holz": {_var = "license_civ_holz"};
			case "rohoel": {_var = "license_civ_rohoel"};
			case "baumwolle": {_var = "license_civ_baumwolle"};
			case "sand": {_var = "license_civ_sand"};
			case "rock": {_var = "license_civ_rock"};
			case "copper": {_var = "license_civ_copper"};
			case "iron": {_var = "license_civ_iron"};
			case "blei": {_var = "license_civ_blei"};
			case "gold": {_var = "license_civ_gold"};
			case "treibstoff": {_var = "license_civ_treibstoff"};
			
			//Verarbeitungslizenzen Illegal
			case "heroin": {_var = "license_civ_heroin"};
			case "hanf": {_var = "license_civ_hanf"};
			
			//Sonstige Lizenzen
			case "gun": {_var = "license_civ_gun"};
			case "schwarzmarkt": {_var = "license_civ_schwarzmarkt"};
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			//Führerscheine
			case "license_civ_driver": {_var = "driver"};
			case "license_civ_truck":{_var = "truck"};
			case "license_civ_boat": {_var = "boat"};
			case "license_civ_air": {_var = "pilot"};
			case "license_civ_dive": {_var = "dive"};
			case "license_civ_transport": {_var = "transport"};
			case "license_civ_taxi": {_var = "taxi"};
			
			//Verarbeitungslizenzen Legal
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_zucker": {_var = "zucker"};
			case "license_civ_holz": {_var = "holz"};
			case "license_civ_rohoel": {_var = "rohoel"};
			case "license_civ_baumwolle": {_var = "baumwolle"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_rock": {_var = "rock"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_blei": {_var = "blei"};
			case "license_civ_gold": {_var = "gold"};
			case "license_civ_treibstoff": {_var = "treibstoff"};
			
			//Verarbeitungslizenzen Illegal
			case "license_civ_heroin": {_var = "heroin"};
			case "license_civ_hanf": {_var = "hanf"};
			
			//Sonstige Lizenzen
			case "license_civ_gun": {_var = "gun"};
			case "license_civ_schwarzmarkt": {_var = "schwarzmarkt"};
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call avanix_fnc_varToStr)})];
_ret;