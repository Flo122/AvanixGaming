/*
	File: fn_sequestra.sqf
	Author: Al Morise (Sink)
	Description:
	Rimuove equipaggiamento illegale dalla unit
*/
private ["_cop","_vest","_primaryWeapon","_handgunWeapon","_magazines","_items","_weapAccessories","_weapons","_backpack","_vestItems","_uniformItems","_headgear","_goggles","_asservatenkammer"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_asservatenkammer = nearestObject [[15334.2,17452.3,0],"CargoNet_01_box_F"];

if (isNull _cop) exitWith {};

if (player distance _cop > 5 OR !alive player OR !alive _cop ) exitWith {};
uisleep 3;
_primaryWeapon = primaryWeapon player;
_handgunWeapon = handgunWeapon player;
_vest = vest player;
_headgear = headgear player;
_goggles = goggles player;

if(_primaryWeapon != "") then 
{
	_weapAccessories = primaryWeaponItems player;
	{
	    if(_x in avanix_illegal_stuffs OR ((_x in avanix_all_stuffs) && (!license_civ_gun))) then { player removePrimaryWeaponItem _x; _asservatenkammer addWeaponCargoGlobal [_x,1];};
	} forEach _weapAccessories;
		
	if(_primaryWeapon in avanix_illegal_stuffs OR ((_primaryWeapon in avanix_all_stuffs) && (!license_civ_gun))) then {
		player removeWeaponGlobal _primaryWeapon;
		_asservatenkammer addWeaponCargoGlobal [_primaryWeapon,1];
	};
};

if(_handgunWeapon != "") then 
{
	_weapAccessories = handgunItems player;
	{
	    if(_x in avanix_illegal_stuffs OR ((_x in avanix_all_stuffs) && (!license_civ_gun))) then { player removeHandgunItem _x; _asservatenkammer addWeaponCargoGlobal [_x,1];};
	} forEach _weapAccessories;
		
	if(_handgunWeapon in avanix_illegal_stuffs OR ((_handgunWeapon in avanix_all_stuffs) && (!license_civ_gun))) then {
	    player removeWeaponGlobal _handgunWeapon;
		_asservatenkammer addWeaponCargoGlobal [_handgunWeapon,1];
	};
};

if(backPack player != "") then 
{
    _backpack = backpackItems player;
	if(count _backpack > 0) then 
	{
		{
			if((_x in avanix_illegal_stuffs) OR ((_x in avanix_all_stuffs) && (!license_civ_gun))) then 
			{
				player removeItemFromBackpack _x;
				_asservatenkammer addItemCargoGlobal [_x,1];
			};
		} forEach _backpack;
	};
};

if(_vest != "") then 
{
    _vestItems = vestItems player;
	if(count _vestItems > 0) then 
	{
	    {
		    if((_x in avanix_illegal_stuffs) OR ((_x in avanix_all_stuffs) && (!license_civ_gun))) then {
			    player removeItemFromVest _x;
				_asservatenkammer addItemCargoGlobal [_x,1];
			};
		}forEach _vestItems;
	};
	
    if(_vest in avanix_illegal_stuffs OR (!license_civ_gun && (!(_vest in ["V_RebreatherB","V_RebreatherIR"])))) then {
	    removeVest player;
		_asservatenkammer addItemCargoGlobal [_vest,1];
	};
};

if(uniform player != "") then 
{
    _uniformItems = uniformItems player;
	if(count _uniformItems > 0) then 
	{
	    {
		    if((_x in avanix_illegal_stuffs) OR ((_x in avanix_all_stuffs) && (!license_civ_gun))) then 
			{
				player removeItemFromUniform _x;
				_asservatenkammer addItemCargoGlobal [_x,1];
			};
		}forEach _uniformItems;
	};
};

if(_headgear != "") then 
{
	if(_headgear in avanix_illegal_stuffs) then 
	{
		removeHeadgear player;
		_asservatenkammer addItemCargoGlobal [_headgear,1];
	};
};

if(_goggles != "") then 
{
	if(_goggles in avanix_illegal_stuffs) then 
	{
		removeGoggles player;
		_asservatenkammer addItemCargoGlobal [_goggles,1];
	};
};

hint format["%1 hat alle illegalen Gegestände entfernt!",name _cop];
[[_asservatenkammer],"TON_fnc_updateAsservatenkammerContainers",false,false] spawn avanix_fnc_MP;
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;