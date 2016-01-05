/*
	File: fn_getBuildID.sqf
	Author: John "Paratus" VanderZwet
            New Version based on coords: Wolfgang Bahmüller
	
	Description:
	Gets the Object ID of a static building
*/
private ["_house","_pos","_elem_x","_elem_y","_elem_z","_id"];

_house = _this select 0;
_pos = getpos _house;

_elem_x = floor (parseNumber (str (_pos select 0)) * 100);
_elem_y = floor (parseNumber (str (_pos select 1)) * 100);
_elem_z = floor (parseNumber (str (_pos select 2)) * 100);

_elem_x = [_elem_x,9999] call avanix_fnc_numberText; 
_elem_y = [_elem_y,9999] call avanix_fnc_numberText; 
_elem_z = [_elem_z,9999] call avanix_fnc_numberText; 

_id = format["%1_%2_%3", _elem_x, _elem_y, _elem_z];

_id;



/*
private ["_build","_sn","_sf","_ef","_na","_id","_i","_item"];

_build = _this select 0;

_sn = toArray (str (_build));

_sf = false;_ef = false;_na = [];_id = 0;

for "_i" from 0 to (count _sn)-1  do {
	_item = _sn select _i;
	if (_sf and (not (_ef))) then {
		_na set [count _na,_item];
	};
	if (_item == 35) then {
		_sf = true;
	};
	if (_item == 58) then {
		_ef = true;
	};
};

if ((count _na) >=3) then {
	_na set [((count _na)-1) ,"delete"];
	_na = _na - ["delete"];
	_na set [0 ,"delete"];
	_na = _na - ["delete"];
	_id = toString (_na);
};

_id;
*/