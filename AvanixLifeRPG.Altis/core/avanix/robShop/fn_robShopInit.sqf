/*
    File: fn_robShopInit.sqf
    Author: Stevo
    
    Description: Initialises the robable shops and assigns the variables to them.
*/

private["_shops"];

_shops = [station_1,station_2,station_3,station_4,station_5,station_6,station_7,station_8,station_9,station_10,station_11,station_12,station_13,station_14];

{
_x setVariable ["_funds",nil,true];
_x setVariable ["_status",false,true];
} forEach _shops;