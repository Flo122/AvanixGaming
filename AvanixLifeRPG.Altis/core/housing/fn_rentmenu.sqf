/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_house","_dialog","_mstatus","_houseCfg","_price","_status","_ergebnis","_renttime","_renttimecolour"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(createDialog "renthouse")) exitWith {};

_houseCfg = [(typeOf _house)] call avanix_fnc_houseRentConfig;
if(count _houseCfg == 0) exitWith {};

_renttime = _house getVariable["renttime",""];
_colourDay = parseText "#66FF00"; //Grün
if(_renttime >= 8) then 
{
	_colourDay = parseText "#66FF00";
} else {
	_colourDay = parseText "#CC0000";
};
_renttimecolour = _colourDay;

_dialog = findDisplay 9000;
_mstatus = _dialog displayCtrl 1100;
_mstatus ctrlSetStructuredText parseText format["<t size='0.8px'>Die Aktuelle Mietzeit<br/>deiner Immobilie beträgt noch<br/><br/><t size='1.8px' color='%2'>%1 Tage</t><br/><br/>Um deinen Mietvertrag zu verlängern kannst du deine gewünschte Mietzeit eintragen.<br/><br/><t color='#FF0000'>Maximale Mietzeit beträgt 14 Tage!</t></t>",_renttime,_renttimecolour];

while {true} do 
{
	uisleep 0.2;
	_val = ctrlText 2101;
	_price = (_houseCfg select 0) * (parseNumber _val);
	_status = _dialog displayCtrl 2102;
	_status ctrlSetStructuredText parseText format["%1€",[_price] call avanix_fnc_numberText];
};

