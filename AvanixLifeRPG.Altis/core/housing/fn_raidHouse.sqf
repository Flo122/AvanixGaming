#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Raids the players house?
*/
private["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_houseInv","_houseInvData","_houseInvVal","_asservatenkammer","_vInv","_items","_space","_itemIndex","_weight","_sum","_itemWeight"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_asservatenkammer = nearestObject [[15334.2,17452.3,0],"CargoNet_01_box_F"];
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner";};

_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call avanix_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff";};
_houseInv = _house getVariable ["Trunk",[[],0]];
if(_houseInv isEqualTo [[],0]) exitWith {hint localize "STR_House_Raid_Nothing";};
avanix_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_House_Raid_Searching";
5 cutRsc ["avanix_progress","PLAIN"];
_ui = uiNamespace getVariable "avanix_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	uisleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["avanix_progress","PLAIN"];
		_ui = uiNamespace getVariable "avanix_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(player distance _house > 13) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(player distance _house > 13) exitWith {avanix_action_inUse = false; titleText[localize "STR_House_Raid_TooFar","PLAIN"]};
if(!alive player) exitWith {avanix_action_inUse = false;};
avanix_action_inUse = false;

_houseInvData = _houseInv select 0;
_houseInvVal = _houseInv select 1;
_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_index = [_var,avanix_illegal_items] call TON_fnc_index;
	if(_index != -1) then {
		_vIndex = [_var,__GETC__(sell_array)] call TON_fnc_index;
		if(_vIndex != -1) then {
			_houseInvData set[_forEachIndex,-1];
			_houseInvData = _houseInvData - [-1];
			_houseInvVal = _houseInvVal - (([_var] call avanix_fnc_itemWeight) * _val);
			_value = _value + (_val * ((__GETC__(sell_array) select _vIndex) select 1));
		};
		
		_vInv = _asservatenkammer getVariable ["Trunk",[[],0]];
		_items = _vInv select 0;
		_space = _vInv select 1;
		_itemIndex = [_var,_items] call TON_fnc_index;
		_weight = [_asservatenkammer] call avanix_fnc_vehicleWeight;
		_sum = [_var,_val,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
		if(_sum < 1) exitWith {titleText["Die Asservatenkammer ist voll!","PLAIN"];if(true) exitwith {hint "Die Asservatenkammer ist voll!"}; _asservatenkammer setVariable["Trunk",[],true];};
		_itemWeight = ([_var] call avanix_fnc_itemWeight) * _sum;
		if(_itemIndex == -1) then {
			_items pushBack [_var,_sum];
		} else {
			_num = _items select _itemIndex select 1;
			_items set[_itemIndex,[_var,_num + _sum]];
		};
		_asservatenkammer setVariable["Trunk",[_items,_space + _itemWeight],true];
	};
} foreach (_houseInv select 0);

if(_value > 0) then {
	[[0,"STR_House_Raid_Successful",true,[[_value] call avanix_fnc_numberText]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
	avanix_atmcash = avanix_atmcash + _value;
	_house setVariable["Trunk",[_houseInvData,_houseInvVal],true];
	[[_house],"TON_fnc_updateHouseTrunk",false,false] spawn avanix_fnc_MP;
} else {
	hint localize "STR_House_Raid_NoIllegal";
};