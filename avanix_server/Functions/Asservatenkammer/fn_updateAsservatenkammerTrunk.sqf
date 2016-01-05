/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Updates the Asservatenkammer Trunk
*/
private["_asservatenkammer","_trunkData"];
_asservatenkammer = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _asservatenkammer) exitWith {};
_trunkData = _asservatenkammer getVariable["Trunk",[[],0]];

_trunkData = [_trunkData] call DB_fnc_mresArray;
_query = format["asservatenkammerUpdateInventory:%1:%2",_trunkData,1];
[_query,1] call DB_fnc_asyncCall;