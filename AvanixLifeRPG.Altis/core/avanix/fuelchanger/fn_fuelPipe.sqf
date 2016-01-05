/*
	File: fn_fuelPipe.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	pump fuel from a vehicle into an empty fuelcan
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

private["_veh","_vehicle","_error","_fuel","_fuel_limit","_fuel_new"];
_vehicle = cursorTarget;

if(isNull _vehicle) exitwith {};
if(vehicle player != player) exitWith {hint "Hast du das schonmal in einem Fahrzeug versucht?";};
if((player distance _vehicle) > 5) exitwith {hint "Du musst näher beim Fahrzeug stehen.";};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};

_error = false;

switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		_fuel_limit = 0.5;
	};

	case (_vehicle isKindOf "Air"):
	{
		_fuel_limit = 0.2;
	};

	case (_vehicle isKindOf "Ship"):
	{
		_fuel_limit = 0.35;
	};
};

_var_item = ["fuelPipe",0] call avanix_fnc_varHandle;
_value_item = missionNamespace getVariable _var_item;
if(_value_item <= 0) exitWith {hint "Du hast keinen Benzinschlauch dabei";};

_var_item = ["fuelE",0] call avanix_fnc_varHandle;
_value_item = missionNamespace getVariable _var_item;
if(_value_item <= 0) exitWith {hint "Du hast keinen leeren Kanister dabei";};

if((_vehicle isKindOf "Car") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "Air")) then
{
	if(isNull (driver _vehicle)) then
	{
		//prüfen ob das Fahrzeug lokal auf dem Client ist
		if(!local _vehicle) then
		{
			//versuchen das Fahrzeug auf den Client zu ziehen
			[[_vehicle, player],"TON_fnc_setVehicleLocal",false,false] spawn avanix_fnc_MP;
			_success = [20, "Montiere den Schlauch", _vehicle] call avanix_fnc_progressWaitUntilFinished;
			if(!_success) then
			{
				_error = true;
			};
			uisleep 1;
		};
		
		if(!_error) then
		{
			_error = false;
			if(local _vehicle) then
			{
				_fuel = fuel _vehicle;
				if(_fuel >= _fuel_limit) then
				{
					_success = [20, "Pumpe Benzin ab", _vehicle] call avanix_fnc_progressWaitUntilFinished;
					if(_success) then
					{
						if(local _vehicle) then
						{
							//es ist niemand auf den fahrersitz gestiegen
							//leeren Kanister entfernen
							if(([false,"fuelE",1] call avanix_fnc_handleInv)) then
							{
								//vollen Kanister einfügen
								if(([true,"fuelF",1] call avanix_fnc_handleInv)) then
								{
									//Benzin aus dem Fahrzeug entfernen
									_fuel_new = _fuel - _fuel_limit;
									if(_fuel_new < 0.1) then
									{
										//wir lassen das Opfer aber nicht ganz ohne Sprit hier zurück
										_fuel_new = 0.1;
									};
									_vehicle setfuel _fuel_new;
								}
								else
								{
									hint "Dein Inventar ist voll.";
								};
							}
							else
							{
								hint "Du hast keinen leeren Kanister dabei.";
							};
						}
						else
						{
							hint "Dir ist der Schlauch runtergefallen...";
						};						
					};
				}
				else
				{
					hint "In dem Fahrzeug ist nicht mehr genug Benzin.";
				};
			}
			else
			{
				hint "Dir ist der Schlauch runtergefallen...";
			};
		};
	}
	else
	{
		hint "Im Fahrzeug sitz ein Fahrer, der merkt das doch...";
	};
};