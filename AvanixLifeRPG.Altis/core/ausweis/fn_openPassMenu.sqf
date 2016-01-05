#include <macro.h>
/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Open Pass Menu
*/
private["_dialog","_near_i","_near","_near_units","_unit","_playerID","_ausweisnr","_wohnortfilters","_picturefilters","_geschlechtfilters","_einreisedatum"];
createDialog "ausweiserstellen";
//Because Boehmia isnt so good they think
disableSerialization;

//Find The Dialog and the Box
_dialog = findDisplay 8888;
_near = _dialog displayCtrl 88880;

//Clear it to prevent overshitting
lbClear _near;

//Near players finding and Adding
_near_units = [];
{ if(player distance _x < 5) then {_near_units set [count _near_units,_x];};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 5 && _x != player) then
	{
		_near lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;

_geschlechtfilters = ((findDisplay 8888) displayCtrl 88884);
lbClear _geschlechtfilters; _geschlechtfilters lbAdd "Männlich"; _geschlechtfilters lbAdd "Weiblich"; _geschlechtfilters lbSetCurSel 0;

_picturefilters = ((findDisplay 8888) displayCtrl 88890);
lbClear _picturefilters; _picturefilters lbAdd "1"; _picturefilters lbAdd "2"; _picturefilters lbAdd "3"; _picturefilters lbAdd "4"; _picturefilters lbAdd "5"; _picturefilters lbAdd "6"; _picturefilters lbAdd "7"; 
_picturefilters lbAdd "8"; _geschlechtfilters lbSetCurSel 0;

_wohnortfilters = ((findDisplay 8888) displayCtrl 88886);
lbClear _wohnortfilters; _wohnortfilters lbAdd "Agios Dinoysios"; _wohnortfilters lbAdd "Athira"; _wohnortfilters lbAdd "Chalkeia"; _wohnortfilters lbAdd "Charkia"; _wohnortfilters lbAdd "Dorida"; _wohnortfilters lbAdd "Feres";
_wohnortfilters lbAdd "Frini"; _wohnortfilters lbAdd "Galati"; _wohnortfilters lbAdd "Kalothori"; _wohnortfilters lbAdd "Kavala"; _wohnortfilters lbAdd "Lakka"; _wohnortfilters lbAdd "Molos"; _wohnortfilters lbAdd "Negades";
_wohnortfilters lbAdd "Neochori"; _wohnortfilters lbAdd "Neri"; _wohnortfilters lbAdd "Oreokastro"; _wohnortfilters lbAdd "Panagia"; _wohnortfilters lbAdd "Panochori"; _wohnortfilters lbAdd "Paros"; _wohnortfilters lbAdd "Pyrgos";
_wohnortfilters lbAdd "Rodopoli"; _wohnortfilters lbAdd "Selakano"; _wohnortfilters lbAdd "Sofia"; _wohnortfilters lbAdd "Syrta"; _wohnortfilters lbAdd "Zaros"; _wohnortfilters lbSetCurSel 0;

switch {true} do 
{
	//_unit = lbData[88880,lbCurSel (88880)];
	_unit = lbValue[88880,lbCurSel (88880)];
	_unit = call compile format["%1",_unit];
	if((lbCurSel 88880) == -1) exitWith {hint "Du hast niemanden ausgewählt!";};
	hint format ["%1",_unit];
	if(isNil "_unit") exitWith {};
	if(_unit == player) exitWith {};
	if(isNull _unit) exitWith {};

	_playerID = getPlayerUID _unit;

	_ausweisnr = _dialog displayCtrl 88888;
	_ausweisnr ctrlSetStructuredText parseText format["Ausweisnr.: %1",_playerID];
	
	_einreisedatum = _dialog displayCtrl 88887;
	_einreisedatum ctrlSetText parseText "15.12.2015";
	
	_picture = _dialog displayCtrl 88887;
	_picture ctrlSetText parseText "15.12.2015";
};

//_amount = ctrlText 2018;
