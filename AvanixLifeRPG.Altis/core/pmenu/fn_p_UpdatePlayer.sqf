#include <macro.h>


//Nobody want this variablen
private["_dialog","_near_i","_near","_near_units"];

//Because Boehmia isnt so good they think
disableSerialization;

//Find The Dialog and the Box
_dialog = findDisplay 2001;
_near_i = _dialog displayCtrl 2023;
_near = _dialog displayCtrl 2022;

//Clear it to prevent overshitting
lbClear _near;
lbClear _near_i;

//Near players finding and Adding
_near_units = [];
{ if(player distance _x < 10) then {_near_units set [count _near_units,_x];};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		_near lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
		_near_i lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_near_i lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;