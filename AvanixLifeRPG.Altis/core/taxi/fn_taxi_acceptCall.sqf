disableSerialization;
_display        = findDisplay 6600;
_taxiListbox    = _display displayCtrl 6601;
if !(lbCurSel _taxiListbox >=0) exitWith {hint "Error";};
_player         = _taxiListbox lbData (lbCurSel _taxiListbox);
_player = call compile _player;

hint format ["Du hast den Auftrag von %1 angenommen. Er befindet sich %2 Meter von dir entfernt. Die aktuelle Position wurde auf der Karte makiert.",name _player,player distance _player];

avanix_taxiCustomer = _player;

[[player,_player],"TON_fnc_acceptedTaxiCall",false,false] spawn avanix_fnc_mp;
[[2,player],"avanix_fnc_taxi_respond",_player,false] spawn avanix_fnc_mp;

_markerText = createMarkerLocal ["Taxilocation", getPos _player];
"Taxilocation" setMarkerColorLocal "ColorYellow";
"Taxilocation" setMarkerTextLocal format ["Fahrgast %1",name _player];
"Taxilocation" setMarkerTypeLocal "mil_warning";

avanix_isOnDutyTaxi = false;
closeDialog 0;

taxi_ActionToLeave = player addAction ["Stop Taxiservice", {
	if (alive avanix_taxiCustomer) then {
		[[6],"avanix_fnc_taxi_respond",avanix_taxiCustomer,false] spawn avanix_fnc_mp;
		player removeAction taxi_ActionToLeave;
	} else {
		player removeAction taxi_ActionToLeave;
		_message = parseText format ["Die Fahrt wurde beendet da dein Fahrgast entweder Tot oder nicht mehr verbunden ist. Du erhälst die letzte Sicherung von %1€.",avanix_taxiTotalPriceBACKUP];
		titleText[format["%1",_message],"PLAIN"];
		avanix_cash = avanix_cash + avanix_taxiTotalPriceBACKUP;
		avanix_isOnDutyTaxi = true;
		[[player],"TON_fnc_goOnDuty",false,false] spawn avanix_fnc_mp;
	};
}];

avanix_taxiTotalPriceBACKUP = 0;

while {player distance _player > 10} do { "Taxilocation" setMarkerPosLocal getPos _player; };

deleteMarkerLocal "Taxilocation";