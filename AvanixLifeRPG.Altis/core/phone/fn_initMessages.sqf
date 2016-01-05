/*

	Author Shinji
	Inits the Messages System with For Each player on Server etc...
	Asking for Messages from others and bla

*/
lbClear 2100;
lbClear 1500;
avanix_player = [];
{
	if (_x != player) then {
		lbAdd [2100, (_x getVariable["realname",name _x])];	
		avanix_player pushback _x;
	};
} foreach playableUnits;

if ((count avanix_names ) >0) then {
	{
		lbAdd [1500, _x];	
	} foreach avanix_names;
} else {
	lbAdd [1500, "Keine..."];	
};

_message = "Nachricht eingeben...";

disableSerialization;
_display = findDisplay 10000;

(_display displayCtrl 1400) ctrlSetText format["%1", _message];

