/*
	File: fn_craftAction.sqf
	Author: EdgeKiller

	Description:
	Master handling for crafting an item.
*/
private["_dialog","_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight","_craftPoints","_spawnPoint","_craftingzones","_spawnbox_craft","_itembox","_handleItems","_vInv","_items","_space","_sum","_val","_handledItem2","_newItem"];
_spawnbox_craft = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint "Bitte wähle ein Item aus!";};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_spawnbox_craft = getPos player nearestObject "CargoNet_01_box_F";
_craftingzones = ["craft_spawn_1"];
_spawnPoint = "";
_craftPoints = getPos player nearestObject "Land_HelipadSquare_F";

_matsNeed = 0;
_itembox=[];

_itemsinBox = _spawnbox_craft getVariable ["Trunk",true,true];

_config = [_itemFilter] call avanix_fnc_craftCfg;
{
	if(_item == _x select 0)then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

			_str = [_matsNeed select _i] call avanix_fnc_varToStr;
			_matsNum = _matsNeed select _i+1;

			//if((missionNamespace getVariable (_matsNeed select _i)) < _matsNum) exitWith {_allMaterial = false;};
			if((_itemsinBox getVariable (_matsNeed select _i)) < _matsNum) exitWith {_allMaterial = false;};
		};
	};
} foreach (_config);

if(!_allMaterial) exitWith {hint "Du hast nicht genügend Material!";};

if(typeName _craftingzones == typeName []) then 
{
	{
		if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};
	} foreach _craftingzones;
} else {
	if(count(nearestObjects[(getMarkerPos _craftingzones),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _craftingzones};
};

if (_itemFilter == "vehicle" && ( { player distance (getMarkerPos _x) < 60 } count _craftingzones ) < 1) exitWith {
	hint "Du bist nicht in der Nähe einer Fabrik!";
};

if (_itemFilter == "vehicle" && (_spawnPoint == "")) exitWith {
	hint "Da steht schon ein Fahrzeug auf dem Spawn!";
};


_oldItem = _matsNeed;
_newItem = _item;

if(_itemFilter == "item") then{
	_itemName = [_newItem] call avanix_fnc_varToStr;
} else {
	_itemInfo = [_newItem] call avanix_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};

_upp = format["Stelle %1 her...",_itemName];
closeDialog 0;

//Setup our progress bar.
5 cutRsc ["avanix_progress","PLAIN"];
_ui = uiNameSpace getVariable "avanix_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	uisleep 0.190;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 0.1) exitWith {};//0.99
	if(player != vehicle player) exitWith {};
	if(avanix_interrupted) exitWith {};
};

_removeItemSuccess = true;
_invSize = count _oldItem;
for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

	_handledItem = [_oldItem select _i,1] call avanix_fnc_varHandle;
	if(!([false,_handledItem,_oldItem select _i+1] call avanix_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; avanix_is_processing = false;};
[] call avanix_fnc_p_updateMenu;

avanix_is_processing = true;

if(_itemFilter == "handfeuerwaffen") then {_spawnbox_craft addWeaponCargoGlobal [_newItem,1];};
if(_itemFilter == "machinenpistolen") then {_spawnbox_craft addWeaponCargoGlobal [_newItem,1];};
if(_itemFilter == "gewehre") then {_spawnbox_craft addWeaponCargoGlobal [_newItem,1];};
if(_itemFilter == "machinengewehre") then {_spawnbox_craft addWeaponCargoGlobal [_newItem,1];};
if(_itemFilter == "magazine") then {_spawnbox_craft addMagazineCargoGlobal [_newItem,1];};
if(_itemFilter == "attachments") then {_spawnbox_craft addItemCargoGlobal [_newItem,1];};
if(_itemFilter == "zubehoer") then {_spawnbox_craft addItemCargoGlobal [_newItem,1];};
if(_itemFilter == "uniform") then {_spawnbox_craft addItemCargoGlobal [_newItem,1];};
if(_itemFilter == "vest") then {_spawnbox_craft addItemCargoGlobal [_newItem,1];};
if(_itemFilter == "backpack") then {_spawnbox_craft addBackpackCargoGlobal [_newItem,1];};
if(_itemFilter == "item") then {
	_vInv = _spawnbox_craft getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_newItem,_items] call TON_fnc_index;
	_weight = [_spawnbox_craft] call avanix_fnc_vehicleWeight;
	_sum = [_newItem,1,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];if(true) exitwith {hint "Das Fahrzeug ist voll."};};
	_itemWeight = ([_newItem] call avanix_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_handledItem = [_newItem,1] call avanix_fnc_varHandle;
		_handleItems = [_handledItem,1];
		_items pushBack _handleItems;
		_spawnbox_craft setVariable["Trunk",[_items,_space + _itemWeight],true];
	} else {
		_handledItem = [_newItem,1] call avanix_fnc_varHandle; 
		_handleItems = [_handledItem,1]; 
		_spawnbox_craft setVariable["Trunk",[[_handleItems],1],true];
	};
};

if(_itemFilter == "vehicle") then 
{
    _vehicle = createVehicle [_newItem, (_craftPoints), [], 0, "NONE"];
	_vehicle setFuel 0;
	_vehicle lock 2;
	//_colorIndex = [_newItem] call avanix_fnc_vehicleColorCraftCfg;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn avanix_fnc_mp;
	[[_vehicle,_colorIndex],"avanix_fnc_colorVehicle",true,false] call avanix_fnc_mp;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	avanix_vehicles pushBack _vehicle;
	[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn avanix_fnc_MP;

	_vehicle setHitPointDamage ["HitLFWheel", 1];   _vehicle setHitPointDamage ["HitRFWheel", 1];   
	_vehicle setHitPointDamage ["HitLF2Wheel", 1];	_vehicle setHitPointDamage ["HitRF2Wheel", 1];
	_vehicle setHitPointDamage ["HitEngine", 1];	_vehicle setHitPointDamage ["HitBody", 1];
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
};

5 cutText ["","PLAIN"];
titleText[format["Du hast erfolgreich %1 hergestellt!",_itemName],"PLAIN"];
avanix_is_processing = false;