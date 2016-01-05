/*
    File: fn_robShopReset.sqf
    Author: Stevo
    
    Description: Starts a server side reset of the shops in case of player(robber) disconnect.
*/

private["_shop","_marker","_loot","_time","_shopName"];
if !(isServer) exitWith {};
_shop = _this select 0;
_marker = _this select 1;
_time = _this select 2;
if(isNil "_shop") exitwith {};
if(isNil "_marker") exitwith {};

_shopName = switch (_shop) do
{
	case station_1: {"Tankstelle Neri"};
	case station_2: {"Tankstelle Kavala"};
	case station_3: {"Tankstelle Aggelochori"};
	case station_4: {"Tankstelle Negades"};
	case station_5: {"Tankstelle am Flughafen"};
	case station_6: {"Tankstelle Gravia"};
	case station_7: {"Tankstelle Telos"};
	case station_8: {"Tankstelle Athira"};
	case station_9: {"Tankstelle Charkia"};
	case station_10: {"Tankstelle Pyrgos"};
	case station_11: {"Tankstelle Chalkeia"};
	case station_12: {"Tankstelle Paros"};
	case station_13: {"Tankstelle Ioannina"};
	case station_14: {"Tankstelle Sofia"};
};

uisleep _time;
_loot = 1000 + round(random 9000);
_shop setVariable ["_funds",_loot,true];
_marker setMarkerColor "ColorGreen";
_marker setMarkerType "loc_Fuelstation";
_marker setMarkerText "_shopname";