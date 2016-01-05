/*
	File: fn_fuelchanger.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	monitors the fuel of the vehicle
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

private["_veh","_veh_type","_factor","_factor_calculated","_manipulation","_fuel","_fuel_old","_fuel_new","_fuel_diff"];
while {true} do
{
	waitUntil {uisleep 0.1; (vehicle player != player && (driver (vehicle player)) == player)};
	//hint "enter";
	_veh = vehicle player;
	_veh_type = typeof _veh;
	_fuel_old = fuel _veh;
	
	//Add new cars here
	switch(true) do
	{
		case (_veh_type == "B_Quadbike_01_F"): {_factor = 3;};
		case (_veh_type == "C_Hatchback_01_sport_F"): {_factor = 2;};
		case (_veh_type == "B_Heli_Light_01_F"): {_factor = 1;}; //Hummingbird
		default {_factor = 1;};
	};
	
	while {true} do
	{
		if(vehicle player == player) exitWith {};
		if((driver (vehicle player)) != player) exitWith {};
		if(!(alive (vehicle player))) exitWith {};

		_manipulation = _veh getVariable["avanix_fuel_manipulation_factor",0];
		
		_fuel = fuel _veh;
		_fuel_diff = _fuel_old - _fuel;
		_factor_calculated = _factor + _manipulation;
		if(_fuel_diff > 0) then
		{
			_fuel_new = _fuel - ((_factor_calculated * _fuel_diff) - _fuel_diff);
			if(_fuel_new < 0) then
			{
				_fuel_new = 0;
			};
			if(_factor_calculated != 1) then
			{
				_veh setFuel _fuel_new;
			};
		};
		_fuel_old = fuel _veh;

		//hint format["fuel=%1 diff=%2 _factor=%3", _fuel_old, _fuel_diff, _factor_calculated];
		
		uisleep 0.5;
	};

	//hint "exit";
};