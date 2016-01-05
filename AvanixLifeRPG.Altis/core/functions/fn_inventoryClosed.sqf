/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private["_container"];
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = lineIntersectsWith [getPosASL player, ATLtoASL screenToWorld[0.5,0.5]];
	
	switch(true) do {
		case (count _house == 0): {_exit = true;};
		case (count _house == 1): {_house = _house select 0;};
		default {
			{if(_x isKindOf "House_F") exitWith {_house = _x;};} foreach _house;
		};
	};
	if(!isNil "_exit" OR !(_house isKindOf "House_F")) exitWith {systemChat "Fehler beim Speichern der Container, es konnte kein Haus gefunden werden?"};
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn avanix_fnc_MP;
};

if((typeOf _container) in ["Land_MetalCase_01_large_F"]) exitWith {
	[[_container,str(_container) select [9,4]],"TON_fnc_updateHideoutContainers",false,false] spawn avanix_fnc_MP;
};

if((str(_container) select [0,18]) == "asservatenkammer_1") exitWith {
	[[_container],"TON_fnc_updateAsservatenkammerContainers",false,false] spawn avanix_fnc_MP;
};