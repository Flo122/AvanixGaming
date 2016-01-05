/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "sand": {["sand","glass",200,("Sand wird geschmolzen...")];};
	case "rock": {["rock","cement",350,("Stein wird zermahlen...")];};
	case "copper": {["copper","copper_r",550,("Kupfer wird geschmolzen...")];};
	case "iron": {["iron","iron_r",650,("Eisen wird geschmolzen...")];};
	case "blei": {["blei","blei_r",750,("Blei wird geschmolzen...")];};
	case "gold": {["gold","goldnuggets",900,("Golderz wird geschmolzen...")];};
	case "salt": {["salt","salt_r",450,("Salz wird veredelt...")];};
	case "zucker": {["zuckerrohr","zucker",500,("Zucker wird veredelt...")];};
	case "holz": {["holz","holzscheit",500,("Holz wird verarbeitet...")];};
	case "rohoel": {["rohoel","erdoel",350,("Rohöl wird veredelt...")];};
	case "baumwolle": {["baumwolle","stoff",350,("Baumwolle wird verarbeitet...")];};
	case "hanf": {["hanf","marijuana",1100,("Hanf wird verarbeitet...")];};
	case "heroin": {["opium","heroin",1000,("Heroin wird verarbeitet...")];};
	case "schwarzmarkt": {["uranu","uranp",1400,("Uranwaffen werden hergestellt...")];};
	default {[];};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

_hasLicense = missionNamespace getVariable (([_type,0] call avanix_fnc_licenseType) select 0);

_itemName = [([_newItem,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call avanix_fnc_varHandle);

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["avanix_progress","PLAIN"];
_ui = uiNameSpace getVariable "avanix_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

avanix_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		uisleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; avanix_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call avanix_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; avanix_is_processing = false;};
	if(!([true,_newItem,_oldVal] call avanix_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call avanix_fnc_handleInv; avanix_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,_itemName],"PLAIN"];
	avanix_is_processing = false;
}
	else
{
	if(avanix_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call avanix_fnc_numberText]; 5 cutText ["","PLAIN"]; avanix_is_processing = false;};
	
	while{true} do
	{
		uisleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; avanix_is_processing = false;};
	if(avanix_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call avanix_fnc_numberText]; 5 cutText ["","PLAIN"]; avanix_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call avanix_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; avanix_is_processing = false;};
	if(!([true,_newItem,_oldVal] call avanix_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call avanix_fnc_handleInv; avanix_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call avanix_fnc_numberText],"PLAIN"];
	avanix_cash = avanix_cash - _cost;
	avanix_is_processing = false;
};	