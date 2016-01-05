_mode = [_this, 0, -1] call BIS_fnc_param;
_info = [_this, 1, -1] call BIS_fnc_param;
pricePerM = 2;

switch (_mode) do
{
	case 1:
	{
		TaxiCallsClient = _info;
		systemChat "Deine aktiven Taxianfragen wurden aktualisiert!";
		player say3D "sms";
	};
	case 2:
	{
		hint format ["Taxifahrer %1 hat deine Anfrage angenommen, er ist %2 Meter von dir entfernt.",name _info,floor (player distance _info)];
		avanix_taxiDriver = _info;
		avanix_calledTaxi = true;
		taxi_eventHandlerID1 = player addEventHandler ["GetIn", {
			uisleep 0.1;
			if (avanix_taxiDriver == (driver vehicle player)) then {avanix_inTaxi = true;};
		}];
		taxi_ActionToLeave = player addAction ["Stop Taxiservice", {
			hint format ["Du hast die Taxifahrt beendet und bezahlst %1€ für diese Fahrt.",avanix_taxiTotalPrice];
			avanix_calledTaxi = false;
			avanix_inTaxi = false;
			if (avanix_atmcash<avanix_taxiTotalPrice) then {avanix_atmcash = 0;} else { avanix_atmcash = avanix_atmcash - avanix_taxiTotalPrice;};
			[[avanix_taxiTotalPrice,pricePerM],"avanix_fnc_finishRide",avanix_taxiDriver,false] spawn avanix_fnc_mp;
			player removeAction taxi_ActionToLeave;
		}];
		_oldTaxiPos = getPos player;
		avanix_taxiTotalPrice = 0;
		_updateCount = 0;
		uisleep 5;
		while {avanix_calledTaxi && !(player getVariable "restrained")} do {
			uisleep 0.1;
			_updateCount = _updateCount + 1;
			hintSilent parseText format ["TAXI-METER<br/><br/><t align='left'>Distanz gefahren:</t><t align='right'>%1</t><br/><t align='left'>Preis</t><t align='right'>%2€</t>",floor (avanix_taxiTotalPrice/pricePerM),avanix_taxiTotalPrice];
			if ((_oldTaxiPos distance player >= 1)&&(avanix_taxiDriver == (driver vehicle player))) then { avanix_taxiTotalPrice = avanix_taxiTotalPrice + pricePerM; _oldTaxiPos = getPos player; };
			if (_updateCount>=200) then {
				[[5,avanix_taxiTotalPrice],"avanix_fnc_respond",avanix_taxiDriver,false] spawn avanix_fnc_mp;
			};
		};
		if (avanix_inTaxi) then {
			hint format ["Du hast die Taxifahrt beendet und bezahlst %1€ für diese Fahrt.",avanix_taxiTotalPrice];
			avanix_calledTaxi = false;
			avanix_inTaxi = false;
			if (avanix_atmcash<avanix_taxiTotalPrice) then {avanix_atmcash = 0;} else { avanix_atmcash = avanix_atmcash - avanix_taxiTotalPrice;};
			[[avanix_taxiTotalPrice,pricePerM],"avanix_fnc_finishRide",avanix_taxiDriver,false] spawn avanix_fnc_mp;
			player removeAction taxi_ActionToLeave;
		};
	};
	case 3:
	{
		hint "Keiner der Taxifahrer hat deine Auftrag angenommen. In 30 Sekunden kannst du es nochmal versuchen.";
		avanix_calledTaxi = false;
    };
    case 4:
    {
    	hint "Es befindet sich kein Taxifahrer im Dienst.";
    	avanix_calledTaxi = false;
	};
	case 5:
	{
		avanix_taxiTotalPriceBACKUP = _info;
	};
	case 6:
	{
			avanix_calledTaxi = false;
			uisleep 0.2;
			hint format ["Der Taxifahrer hat die fahrt beendet. Du musst %1 für die Fahrt bezahlen.",avanix_taxiTotalPrice];
			avanix_inTaxi = false;
			if (avanix_atmcash<avanix_taxiTotalPrice) then {avanix_atmcash = 0;} else { avanix_atmcash = avanix_atmcash - avanix_taxiTotalPrice;};
			[[avanix_taxiTotalPrice,pricePerM],"avanix_fnc_finishRide",avanix_taxiDriver,false] spawn avanix_fnc_mp;
			player removeAction taxi_ActionToLeave;
	};
};