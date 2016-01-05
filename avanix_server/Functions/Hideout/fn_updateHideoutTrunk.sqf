/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Updates the HideoutTrunk
*/
private["_hideout","_trunkData","_hideoutID"];
_hideout = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_hideoutID = [_this,1,"",[""]] call BIS_fnc_param;

if(isNull _hideout) exitWith {};
_trunkData = _hideout getVariable["Trunk",[[],0]];

_trunkData = [_trunkData] call DB_fnc_mresArray;
_query = format["hidoutUpdateInventory:%1:%2",_trunkData,_hideoutID];
[_query,1] call DB_fnc_asyncCall;