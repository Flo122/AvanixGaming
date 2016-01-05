/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Load the Asservatenkammer to Server
*/
private["_queryResult","_query","_asservatenkammer","_trunk","_containers","_itembox","_items","_mags","_weapons","_backpacks","_i","_id"];
_asservatenkammer = nearestObject [[15334.2,17452.3,0],"CargoNet_01_box_F"];

_query = format["asservatenkammerInit:%1",1];
_queryResult = [_query,2] call DB_fnc_asyncCall;

_id = _queryResult select 0;
diag_log format ["////ID:%1////",_id];
_trunk = [(_queryResult select 1)] call DB_fnc_mresToArray;
if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
diag_log format ["////TRUNK:%1////",_trunk];
_containers = [(_queryResult select 2)] call DB_fnc_mresToArray;
if(typeName _containers == "STRING") then {_containers = call compile format["%1", _containers];};
diag_log format ["////INVENTORY:%1////",_containers];

_asservatenkammer setVariable ["Trunk",_trunk,true];
_asservatenkammer setVariable ["locked",true,true];
		
if (count _containers > 0) then
{
	_items = _containers select 0;
	_mags = _containers select 1;
	_weapons = _containers select 2;
	_backpacks = _containers select 3;

	for "_i" from 0 to ((count (_items select 0)) - 1) do 
	{
		_asservatenkammer addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
	};
	for "_i" from 0 to ((count (_mags select 0)) - 1) do
	{
		_asservatenkammer addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
	};
	for "_i" from 0 to ((count (_weapons select 0)) - 1) do
	{
		_asservatenkammer addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
	};
	for "_i" from 0 to ((count (_backpacks select 0)) - 1) do
	{
		_asservatenkammer addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
	};
};




