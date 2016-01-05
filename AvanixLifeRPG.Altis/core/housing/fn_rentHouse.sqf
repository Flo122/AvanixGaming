#include <macro.h>
/*
Author: Bryan "Tonic" Boardwine



Description:
Buys the house?
*/
private["_house","_uid","_action","_houseCfg","_housec"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house getVariable["house_owned",false])) exitWith {hint "Dieses Haus wurde schon verkauft."};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint "Dieses Haus wurde vor Kurzem verkauft."};

if(__GETC__(avanix_donator) > 0)then // und von hier
{
	if(__GETC__(avanix_donator) == 1)then
	{
		_housec = 4;
	};
	if(__GETC__(avanix_donator) == 2)then
	{
		_housec = 5;
	};
	if(__GETC__(avanix_donator) == 3)then
	{
		_housec = 6;
	};
} 
	else 
{
	_housec = 3;
};

if(count avanix_houses >= _housec) exitWith {hint format["Du kannst dir keine weiteren Häuser kaufen"]};
closeDialog 0;
/*---------------------------------------------------------------------------------------*/
_houseCfg = [(typeOf _house)] call avanix_fnc_houseRentConfig;
if(count _houseCfg == 0) exitWith {};

_action = 
[
	format["Dieses Haus gibt es für %1€. Es unterstützt %2 Lagerbox(en). Mietzeit beträgt 7 Tage",
	[(_houseCfg select 0) * (7)] call avanix_fnc_numberText,
	(_houseCfg select 1)],"Haus mieten","Mieten","Schliessen"
] call BIS_fnc_guiMessage;

if(_action) then
{
	if(avanix_atmcash < (_houseCfg select 0) * (7)) exitWith {hint format ["Du hast nicht genug Geld!"]};
	[[_uid,_house],"TON_fnc_addRentHouse",false,false] spawn avanix_fnc_MP;
	_house setVariable["house_owner",[_uid,profileName],true];
	_house setVariable["locked",true,true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["containers",[],true];
	_house setVariable["uid",round(random 99999),true];
	_house setVariable["renttime",7,true];
	_house setVariable["rented",1,true];
	_house setVariable["bought",0,true];
	_price = (_houseCfg select 0) * (7);
	avanix_atmcash = avanix_atmcash - _price;
	["1"] call SOCK_fnc_syncData;
	avanix_vehicles pushBack _house;
	avanix_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do 
	{
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
};