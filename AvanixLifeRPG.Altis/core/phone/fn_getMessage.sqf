/*

	Author Shinji
	Player select another message and ... it appears!!! WTF IS THIS MAGIC O_O?

*/
private ["_ui","_control_ch","_data","_pos"];
_control = 1500;
_index = lbCurSel _control;
_data =  lbText [_control, _index];

if (_index == -1) exitwith {};
if ((_index == 0) && (_data == "Keine...")) exitwith {};

_message = avanix_messages select _index;
_pos = avanix_positions select _index;

disableSerialization;
_display = findDisplay 10000;
(_display displayCtrl 1400) ctrlSetText format["%1", _message];


disableSerialization;
_display = findDisplay 10000;
_control_ch =  cbChecked (_display displayCtrl 2800);

if ( (count _pos)>1 ) then {
	[_data, _pos] spawn avanix_fnc_getMessagePos;
	hintsilent parseText format ["Positionsdaten von <t color='#CD2B2B'>%1 </t> Empfangen! Er wird nun fuer kurze Zeit auf der Karte Markiert sein.", _data];	
	(_display displayCtrl 2800) cbSetChecked true;
} else {
	(_display displayCtrl 2800) cbSetChecked false;
};