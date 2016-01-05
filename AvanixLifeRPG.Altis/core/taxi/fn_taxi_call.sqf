// Exceptions

if (avanix_calledTaxi) exitWith { hint "Du hast bereits ein taxi gerufen!"; };
if (avanix_isOnDutyTaxi) exitWith { hint "Du kannst kein Taxi rufen da du selber Taxifahrer bist!"; };

// Main

avanix_calledTaxi = true;
[[player],"TON_fnc_callTaxiDrivers",false,false] spawn avanix_fnc_mp;
hint "Du hast ein Taxi gerufen, warte bis ein Taxifahrer deinen Auftrag annimmt. Deine Anfrage wird nach 60 Sekunden automatisch gelöscht.";