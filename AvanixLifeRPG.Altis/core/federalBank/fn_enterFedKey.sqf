private["_InputText","_ClearText","_OutputText"];
hintSilent "Verbindungsaufbau.....";

disableSerialization;
if(!(createDialog "keypad_menu")) exitWith {};

_dialog = findDisplay 9000;
_mstatus = _dialog displayCtrl 1100;
_mstatus ctrlSetStructuredText parseText format["<t size='0.8px'>Enter Keycode</t></t>"];

_ClearText = "Enter Keycode";

switch (_this select 0) do {
	case "number": {
		_InputText = _InputText + format["%1", _this select 1];
		_mstatus ctrlSetStructuredText parseText format["%1", _InputText];
	};
	
	case "clear": {
		_InputText = "";
		_mstatus ctrlSetStructuredText parseText format["%1", _ClearText];
	};
	
	case "enter": {
		_OutputText = _InputText;
		hint format["Der Code %1 ist Richtig. Tür entriegelt.", fedkey];
		if(format ["%1",_OutputText] == format ["%1",fedkey]) then {
			_dome = nearestObject [[3184.999512,12902.100586,-0.344277],"Land_Dome_Small_F"];
			_dome setVariable["bis_disabled_Door_1",0,true];
			_dome setVariable["bis_disabled_Door_2",0,true];
		} else {
			hint format ["Falscher Keycode eingegeben! Alarm ausgelöst!"];
			sleep 1;
			[[[1,2],localize "STR_ISTR_Bolt_AlertFed"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
			[[0,format[localize "STR_ISTR_Bolt_AlertHouse",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
			[[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			};
		closeDialog 0;
		_InputText = "";
	};
};
