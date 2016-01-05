#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
avanix_session_tries = avanix_session_tries + 1;
if(avanix_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(avanix_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
avanix_cash = parseNumber (_this select 2);
avanix_atmcash = parseNumber (_this select 3);
__CONST__(avanix_adminlevel,parseNumber(_this select 4));
__CONST__(avanix_donator,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

avanix_gear = _this select 8;
[] call avanix_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(avanix_coplevel, parseNumber(_this select 7));
		__CONST__(avanix_medicLevel,0);
		avanix_blacklisted = _this select 9;
	};
	
	case civilian: {
		avanix_is_arrested = _this select 7;
		__CONST__(avanix_coplevel, 0);
		__CONST__(avanix_medicLevel, 0);
		avanix_houses = _this select 9;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			avanix_vehicles pushBack _house;
		} foreach avanix_houses;
		
		avanix_gangData = _This select 10;
		if(count avanix_gangData != 0) then {
			[] spawn avanix_fnc_initGang;
		};
		[] spawn avanix_fnc_initHouses;
	};
	
	case independent: {
		__CONST__(avanix_medicLevel, parseNumber(_this select 7));
		__CONST__(avanix_coplevel,0);
	};
};

if(count (_this select 12) > 0) then {
	{avanix_vehicles pushBack _x;} foreach (_this select 12);
};

switch(__GETC__(avanix_donator)) do
{
	case 1: {avanix_paycheck = avanix_paycheck + 1000;};
	case 2: {avanix_paycheck = avanix_paycheck + 2000;};
	case 3: {avanix_paycheck = avanix_paycheck + 3000;};
};

avanix_session_completed = true;