/*
      Created by Mokomoko
      Date: 04.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
*/

private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption","_speed","_displayFuel"];

if (isNil "_fuelConsumption")then {
_fuelConsumption = 0;
};

while{true} do 
{
	_vehicleToFuel = (vehicle player);
	_speed = speed _vehicleToFuel;
	if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && !(_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player) ) then
	//If(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && (_vehicleToFuel != player) ) then
	{
		_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
		/*
				switch (typeOf (_vehicleToFuel)) do 
		{
			case "C_Hatchback_01_sport_F":{_fuelConsumption = _velocityOfVehicle/100000 + 0.0001;}; //Here you can add some other vehicles.
			default {_fuelConsumption = _velocityOfVehicle/100000 + 0.0001;}
		};
		*/
		switch(true) do
			{
				case (_speed >= 0 and _speed < 5): 		{_fuelConsumption = _velocityOfVehicle/100000 + 0.00001};
				case (_speed >= 5 and _speed < 15): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.00002};
				case (_speed >= 15 and _speed < 30): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.00003};
				case (_speed >= 30 and _speed < 55): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.00004};
				case (_speed >= 55 and _speed < 70): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.00005};
				case (_speed >= 70 and _speed < 85): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.00006};
				case (_speed >= 85 and _speed < 100): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.00007};
				case (_speed >= 100 and _speed < 115): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.00008};
				case (_speed >= 115 and _speed < 130): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.00009};
				case (_speed >= 130 and _speed < 500): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.00010};
				//case (_speed >= 145 and _speed < 160): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0012};
				//case (_speed >= 160 and _speed < 350): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0015};
				//case (_speed >= 350 and _speed < 400): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0018};
			};
		
		_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
		_displayFuel = _fuelConsumption*10000/2;
		//hint format["Kraftstoffverbrauch: %1L/km",round(_displayFuel*100)/100]; // Comment

		if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
		{
			hint "Dein tank ist leer, du sollteste eine Tankstelle aufsuchen!";
		}
		else
		{
			if(fuel _vehicleToFuel < 0.03) then
			{
				hint "Wer sein Auto liebt der schiebt!";
			};
		};
	};
	uisleep 2;
};