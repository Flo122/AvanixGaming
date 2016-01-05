#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_cntObjs","_objs","_obj"];
_curTarget = cursorTarget;
if(avanix_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(avanix_interrupted) exitWith {avanix_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) exitWith {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call avanix_fnc_catchFish;
		};
		if(player distance (getMarkerPos "uran_1") < 30) then {
			if (!avanix_action_gathering && !avanix_action_inUse) then {
				[] call avanix_fnc_searchProteus;
			};
		};
	} else {
		if(playerSide == civilian && !avanix_action_gathering) then {
			_handle = [] spawn avanix_fnc_gather;
			waitUntil {scriptDone _handle};
			avanix_action_gathering = false;
		};
		if (playerSide == civilian && !avanix_action_gathering && avanix_inv_pickaxe == 1) then 
		{
			[] call avanix_fnc_pickaxeUse;
		};
		if (playerSide == civilian && !avanix_action_gathering && avanix_inv_axt == 1) then
		{
			[] call avanix_fnc_axtUse;
		};
	};
};

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12}) exitWith {
	[_curTarget] call avanix_fnc_houseMenu;
};

if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16778.1,13636.8,0],"Land_Offices_01_V1_F"]) == _curTarget) exitWith {
	[_curTarget] call avanix_fnc_federalBankMenu;
};

if((nearestObject [[15334.2,17452.3,0],"CargoNet_01_box_F"]) == _curTarget && avanix_inv_crowbar > 1) exitWith {
	[_curTarget] call avanix_fnc_brokeAsservatenkammer;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
avanix_action_inUse = true;

//Temp fail safe.
[] spawn {
	uisleep 60;
	avanix_action_inUse = false;
};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide in [west,independent]}) exitWith {
	//Hotfix code by ins0
	if(((playerSide == blufor && {(call avanix_revive_cops)}) || playerSide == independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call avanix_fnc_revivePlayer;
	};
};


//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if(!dialog && playerSide == west) then {
		[_curTarget] call avanix_fnc_copInteractionMenu;
	};
	
	if(!dialog && playerSide == civilian) then {
		[_curTarget] call avanix_fnc_civInteractionMenu;
	};
	
	if(!dialog && playerSide == independent) then {
		[_curTarget] call avanix_fnc_medicInteractionMenu;
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if(((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) && (typeOf _curTarget != "Submarine_01_F")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";
	
	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
				[_curTarget] call avanix_fnc_vInteractionMenu;
			};
		};
	} else {
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then {
				private["_handle"];
				_handle = [_curTarget] spawn avanix_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				private["_handle"];
				_handle = [_curTarget] spawn avanix_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then {
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				_handle = [_curTarget] spawn avanix_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			} else {
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					private["_handle"];
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn avanix_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				};
			};
		};
	};
};