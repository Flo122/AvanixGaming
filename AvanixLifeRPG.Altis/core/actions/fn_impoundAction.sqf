/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP"];
_vehicle = cursorTarget;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle;}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	[[0,format["%1 dein %2 wird von der Polizei zum abgeschleppt.",(_vehicleData select 0) select 1,_vehicleName]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
	avanix_action_inUse = true;
	
	_upp = "Fahrzeug wird abgeschleppt...";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["avanix_progress","PLAIN"];
	_ui = uiNameSpace getVariable "avanix_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
	{
		uisleep 0.09;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];
	
	if(player distance _vehicle > 10) exitWith {hint "Abschleppen abgebrochen!"; avanix_action_inUse = false;};
	if(!alive player) exitWith {avanix_action_inUse = false;};
	//_time = _vehicle getVariable "time";
	//if(isNil {_time}) exitWith {deleteVehicle _vehicle; hint "This vehicle was hacked in"};
	//if((time - _time)  < 120) exitWith {hint "This is a freshly spawned vehicle, you have no right impounding it."};
	if((count crew _vehicle) == 0) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {avanix_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = (call avanix_impound_car);};
			case (_vehicle isKindOf "Ship"): {_price = (call avanix_impound_boat);};
			case (_vehicle isKindOf "Air"): {_price = (call avanix_impound_air);};
		};
		
		avanix_impound_inuse = true;
		//[[_vehicle,true,player],"TON_fnc_vehicleStore",false,false] spawn avanix_fnc_MP;
		[[_vehicle,true,player],"TON_fnc_vehicleImpound",false,false] spawn avanix_fnc_MP;
		waitUntil {!avanix_impound_inuse};
		hint format["Du hast einen %1 abgeschleppt. Du hast %2€ erhalten!",_type,_price];
		[[0,format["%1 hat %2's %3 abgeschleppt.",player getVariable["realname",name player],(_vehicleData select 0) select 1,_vehicleName]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
		avanix_atmcash = avanix_atmcash + _price;
	}
		else
	{
		hint "Abschleppen abgebrochen!";
	};
};
avanix_action_inUse = false;