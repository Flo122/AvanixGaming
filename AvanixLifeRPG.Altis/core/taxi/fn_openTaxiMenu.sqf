
disableSerialization;
createDialog "avanix_taxiMenu";
_display        = findDisplay 6600;
_taxiListbox    = _display displayCtrl 6601;

if (!avanix_isOnDutyTaxi) exitWith {hint "Du bist nicht im Dienst oder hast bereits einen Auftrag angenommen!";closeDialog 0;};

[[player],"TON_fnc_goOnDuty",false,false] spawn avanix_fnc_mp;
uisleep 1;
if (count TaxiCallsClient > 0) then
{
	{
		_taxiListbox lbAdd format ["%1 (%2 Meter)",name _x,(_x distance player)];
		_taxiListbox lbSetData [(lbSize _taxiListbox)-1,format ["%1",_x]];
	} forEach TaxiCallsClient;
};

hint "Taxianfragen erfolgreich geladen.";