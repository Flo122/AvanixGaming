#include <macro.h>
/*
	File:fn_alarmHouse.sqf
	Author: Wolfgang Bahmüller
	
	Description:
    creates some alarmsystems light, sound, guard
	
*/

private ["_house","_alarmsystems","_inventory","_lightRed","_lightBlue","_light","_red","_brightness","_lightpos","_duration"];
_duration = 2 * 60; //alarmtime in seconds
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitwith {};
_alarmsystems = [_house] call avanix_fnc_getAlarmsystems;
_inventory = _house getVariable ["avanix_inventory", []];

//ALARMSOUND SIRENE
if("alarmsystem" in _alarmsystems) then
{
    [_house, _duration] spawn
    {
        private ["_house", "_duration"];
        _house    = _this select 0;
        _duration = _this select 1;
        while {_duration > 0} do
        {
            _house say3D "house_alarm";
            uisleep 2.0;
            _duration = _duration - 2.0;
        };
    };
};

//ALARMSOUND DOG
if("alarmsystemDog" in _alarmsystems) then
{
    [_house, _duration] spawn
    {
        private ["_house", "_duration"];
        _house    = _this select 0;
        _duration = _this select 1;
        while {_duration > 0} do
        {
            _house say3D "dog_alarm";
            uisleep 8;
            _duration = _duration - 8;
        };
    };
};

//LIGHTS
if("alarmsystem" in _alarmsystems) then
{
    _lightRed = [20, 0.1, 0.1];
    _lightBlue = [0.1, 0.1, 20];
    _lightpos = [0.0, 0.0, 0.1];

    _light = createVehicle ["#lightpoint", getPos _house, [], 0, "CAN_COLLIDE"];
    uisleep 0.2;
    _light setLightColor _lightRed;
    _light setLightBrightness 0;
    _light lightAttachObject [_house, _lightpos];
    _light setLightAttenuation [0.181, 0, 100, 130];
    _light setLightIntensity 20;
    _light setLightFlareSize 0.38;
    _light setLightFlareMaxDistance 150;
    _light setLightUseFlare true;
    _light setLightDayLight true;

    if (sunOrMoon < 1) then {
        _brightness = 6;
    } else {
        _brightness = 50;
    };

    _red = true;
    while {(alive _house)} do
    { 
        if (_duration <= 0) exitWith {};
        if (_red) then
        {  
            _red = false;  
            uisleep 0.05;
            _light setLightBrightness _brightness;  
        }
			else
        {  
            _red = true;  
            _light setLightBrightness 0;  
            uisleep 0.05;
        };
        uisleep 0.22;
        _duration = _duration - (0.22 + 0.05);
    };
    //clean up
    deleteVehicle _light;
};