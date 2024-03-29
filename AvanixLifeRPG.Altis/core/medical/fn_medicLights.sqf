/*
    @Version: 1.0
    @Author: Tonic
    @Edited: 28.08.2013
*/

/*
	[x, y, z]
    ^      <--------- y -------->       _
	|            ___________             |
	|           /           \          /
	z     _____/             \       x
	|    |                    \     /
	|    |____________________|   |_
    v
*/

private ["_vehicle","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed","_brightness","_attach"];
_vehicle = _this select 0;
if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};
switch (typeOf _vehicle) do {
    case "C_Hatchback_01_sport_F": { _attach = [[-0.6, 2, -0.95], [0.6, 2, -0.95]]; };
	case "C_Hatchback_01_F": { _attach = [[-0.6, 2, -0.95], [0.6, 2, -0.95]]; };
	case "C_Offroad_01_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; };
	case "C_SUV_01_F": { _attach = [[-0.4, 2.3, -0.55], [0.4, 2.3, -0.52]]; };
	case "B_Heli_Transport_01_F": { _attach = [[-0.5, 0.0, 0.96], [0.5, 0.0, 0.96]]; };
	case "I_MRAP_03_F": { _attach = [[1.13, -0.58, 0.44], [-1.13, -0.58, 0.44]]; };
	case "C_Kart_01_Blu_F": { _attach = [[0.65, 0.6, 0.45], [-0.65, 0.6, 0.45]]; };
	case "Limo": { _attach = [[0.45, -0.2, 0.25], [-0.45, -0.2, 0.25]]; };
	case "B_MRAP_01_F":     { _attach = [[-1, -2.8, 0.55], [1, -2.8, 0.55]]; };
    case "B_Heli_Light_01_F": { _attach = [[-0.35, -0.6, 0.5], [0.35, -0.6, 0.5]]; };
    case "O_Heli_Light_02_unarmed_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; };
	case "I_Heli_light_03_unarmed_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; };
	case "B_Quadbike_01_F" : { _attach = [[-0.5, -0.8, -0.5], [0.5, -0.8, -0.45]]; };
    case "B_Truck_01_mover_F": { _attach = [[-0.75, -1.2, 0.0], [0.75, -1.2, 0.0]]; };
	case "B_Truck_01_transport_F": { _attach = [[-0.75, -1.2, 0.0], [0.75, -1.2, 0.0]]; };
	case "I_Heli_light_03_F": {	_attach =  [[1.25, 4.6, -1.35],[-1.25, 4.6, -1.35]];	};
	case "I_Heli_Transport_02_F": {	_attach = [[1.3, 6.3, -2.65],[-1.3, 6.3, -2.65]];	};
	case "O_Truck_03_transport_F": {_attach = [[-0.6, 3.4, -0.8],[0.6, 3.4, -0.8]];	};
	case "O_Truck_03_covered_F": {_attach =  [[-0.6, 3.4, -0.8],[0.6, 3.4, -0.8]];	};
	case "O_Heli_Transport_04_bench_F": {_attach =  [[-0.9, 5.3, 1.7],[0.7, 5.3, 1.7]];	};
	case "B_Heli_Transport_03_unarmed_F": {_attach =  [[-1.8, 5.0, 1.9],[1.8, 5.0, 1.9]];	};
	case "I_MRAP_03_hmg_F": {_attach = [[-1.3, 1.85, -0.08],[1.3, 1.85, -0.08]];	};
	case "B_APC_Wheeled_01_cannon_F": {_attach = [[-1, -2.8, 0.55],[1, -2.8, 0.55]];	};
	case "C_Van_01_box_F": 	{_attach = [[-1.00,-0.30, 1.400],[1.00,-0.30, 1.400]];	};
	case "O_Truck_02_box_F": 	{_attach = [[-0.8,0,0.75],[0.8,0,0.75]];	};
	case "O_Truck_03_repair_F": 	{_attach = [[-0.85,3.1,1.05],[0.85,3.1,1.05]];	};
	//case "C_Rubberboat": 	{_attach = [[-1.00,-0.30, 1.400],[1.00,-0.30, 1.400]];	};
	case "C_Heli_Light_01_civil_F": 	{_attach = [[-0.35, -0.6, 0.5], [0.35, -0.6, 0.5]];	};
	//case "O_Heli_Transport_04_F": 	{_attach = [[-1.00,-0.30, 1.400],[1.00,-0.30, 1.400]];	};
	//case "O_Heli_Transport_04_medevac_F": 	{_attach = [[-1.00,-0.30, 1.400],[1.00,-0.30, 1.400]];	};
	//case "C_Boat_Civil_01_police_F": 	{_attach = [[-1.00,-0.30, 1.400],[1.00,-0.30, 1.400]];	};
	//case "B_SDV_01_F": 	{_attach = [[-1.00,-0.30, 1.400],[1.00,-0.30, 1.400]];	};
};
_lightRed = [0.1, 0.1, 20];
_lightBlue = [0.1, 0.1, 20];
_lightleft = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
uisleep 0.2;
_lightleft setLightColor _lightRed;
_lightleft setLightBrightness 0;
_lightleft lightAttachObject [_vehicle, _attach select 0];
_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightleft setLightIntensity 20;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;
_lightleft setLightDayLight true;
_lightright = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
uisleep 0.2;
_lightright setLightColor _lightBlue;
_lightright setLightBrightness 0;
_lightright lightAttachObject [_vehicle, _attach select 1];
_lightright setLightAttenuation [0.181, 0, 1000, 130];
_lightright setLightIntensity 20;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;
_lightright setLightDayLight true;
if (sunOrMoon < 1) then {
    _brightness = 4;
} else {
    _brightness = 30;
};
_leftRed = true;  
while {(alive _vehicle)} do { 
    if (!(_vehicle getVariable "lights")) exitWith {};
    if (_leftRed) then {  
        _leftRed = false;  
        _lightright setLightBrightness 0;  
        uisleep 0.05;
        _lightleft setLightBrightness _brightness;  
    } else {  
        _leftRed = true;  
        _lightleft setLightBrightness 0;  
        uisleep 0.05;
        _lightright setLightBrightness _brightness;  
    };
    uisleep 0.22;  
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;