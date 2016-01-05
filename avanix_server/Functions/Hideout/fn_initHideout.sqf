/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Load the Hideouts to Server
*/
private["_queryResult","_query","_hideout","_owner","_members","_gangName","_id","_trunk","_containers","_itembox","_items","_mags","_weapons","_backpacks","_i","_terminal"];
{
	_query = format["hideoutInit:%1",_x];
	_queryResult = [_query,2] call DB_fnc_asyncCall;

	_owner = _queryResult select 0;
	_gangName = _queryResult select 1;
	_members = [(_queryResult select 2)] call DB_fnc_mresToArray;
	if(typeName _members == "STRING") then {_members = call compile format["%1", _members];};
	_queryResult set[2,_members];
	_id = _queryResult select 3;
	_trunk = [(_queryResult select 4)] call DB_fnc_mresToArray;
	if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
	_containers = [(_queryResult select 5)] call DB_fnc_mresToArray;
	if(typeName _containers == "STRING") then {_containers = call compile format["%1", _containers];};
	
	if (_gangName == "") then
	{
		format ["gang_area_%1",_x] setMarkerText "Unbesetztes Territorium";
		if( _x == 1 ) then { _hideout = nearestObject [[9951.52,19340.6,0],"Land_Cargo_Tower_V1_No1_F"]; _itembox = nearestObject [[9951.52,19340.6,0],"Land_MetalCase_01_large_F"]; _terminal = nearestObject [[9951.52,19340.6,0],"Land_DataTerminal_01_F"];};
		if( _x == 2 ) then { _hideout = nearestObject [[23483.7,21096.2,0],"Land_Cargo_Tower_V1_No2_F"]; _itembox = nearestObject [[23483.7,21096.2,0],"Land_MetalCase_01_large_F"]; _terminal = nearestObject [[23483.7,21096.2,0],"Land_DataTerminal_01_F"];};
		if( _x == 3 ) then { _hideout = nearestObject [[23043.7,7313.55,0],"Land_Cargo_Tower_V1_No3_F"]; _itembox = nearestObject [[23043.7,7313.55,0],"Land_MetalCase_01_large_F"]; _terminal = nearestObject [[23043.7,7313.55,0],"Land_DataTerminal_01_F"];};
		if( _x == 4 ) then { _hideout = nearestObject [[12305.6,8867.82,0],"Land_Cargo_Tower_V1_No4_F"]; _itembox = nearestObject [[12305.6,8867.82,0],"Land_MetalCase_01_large_F"]; _terminal = nearestObject [[12305.6,8867.82,0],"Land_DataTerminal_01_F"];};
		_hideout setVariable["CancelCapture",false,true];
		_hideout setVariable["noCaptured",true,true];
		
	} else {
	
		format ["gang_area_%1",_x] setMarkerText format ["Territorium von %1",_gangName];
		if( _x == 1 ) then { _hideout = nearestObject [[9951.52,19340.6,0],"Land_Cargo_Tower_V1_No1_F"]; _itembox = nearestObject [[9951.52,19340.6,0],"Land_MetalCase_01_large_F"]; _terminal = nearestObject [[9951.52,19340.6,0],"Land_DataTerminal_01_F"];};
		if( _x == 2 ) then { _hideout = nearestObject [[23483.7,21096.2,0],"Land_Cargo_Tower_V1_No2_F"]; _itembox = nearestObject [[23483.7,21096.2,0],"Land_MetalCase_01_large_F"]; _terminal = nearestObject [[23483.7,21096.2,0],"Land_DataTerminal_01_F"];};
		if( _x == 3 ) then { _hideout = nearestObject [[23043.7,7313.55,0],"Land_Cargo_Tower_V1_No3_F"]; _itembox = nearestObject [[23043.7,7313.55,0],"Land_MetalCase_01_large_F"]; _terminal = nearestObject [[23043.7,7313.55,0],"Land_DataTerminal_01_F"];};
		if( _x == 4 ) then { _hideout = nearestObject [[12305.6,8867.82,0],"Land_Cargo_Tower_V1_No4_F"]; _itembox = nearestObject [[12305.6,8867.82,0],"Land_MetalCase_01_large_F"]; _terminal = nearestObject [[12305.6,8867.82,0],"Land_DataTerminal_01_F"];};
		
		if (count _containers > 0) then
		{
			_items = _containers select 0;
			_mags = _containers select 1;
			_weapons = _containers select 2;
			_backpacks = _containers select 3;

			for "_i" from 0 to ((count (_items select 0)) - 1) do 
			{
				_itembox addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
			};
			for "_i" from 0 to ((count (_mags select 0)) - 1) do
			{
				_itembox addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
			};
			for "_i" from 0 to ((count (_weapons select 0)) - 1) do
			{
				_itembox addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
			};
			for "_i" from 0 to ((count (_backpacks select 0)) - 1) do
			{
				_itembox addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
			};
		};
		
		_hideout setVariable ["gang_members",_members,true];
		_hideout setVariable ["gang_name",_gangName,true];
		_hideout setVariable ["gang_owner",_owner,true];
		_hideout setVariable ["hideoutID",_x,true];
		_hideout setVariable ["CancelCapture",false,true];
		_hideout setVariable ["noCaptured",false,true];
		_itembox setVariable ["hideoutID",_x,true];
		_itembox setVariable ["Trunk",_trunk,true];
		_itembox setVariable ["gang_name",_gangName,true];
		
		[_terminal,"red","orange","green"] call BIS_fnc_DataTerminalColor;
	};
} foreach [1,2,3,4];




