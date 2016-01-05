/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
avanix_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player))then
	{
		avanix_action_inUse = true;
		[player,"repair"] call avanix_fnc_globalSound;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["%1 wird repariert.",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["avanix_progress","PLAIN"];
		_ui = uiNameSpace getVariable "avanix_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		while{true} do
		{
			if(animationState player != "Acts_carFixingWheel") then {
				uisleep 0.8;
				player playMoveNow "Acts_carFixingWheel";
			};
			uisleep 0.195;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(avanix_interrupted) exitWith {};
		};
		
		avanix_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(avanix_interrupted) exitWith {avanix_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; avanix_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Du musst außerhalb des Fahrzeuges sein, um es zu reparieren. Entschuldigung, aber das soll verhindern, dass du das System missbrauchst, naja, nicht wirklich.","PLAIN"];};
		player removeItem "ToolKit";
		_veh setDamage 0;
		titleText["Du hast dieses Fahrzeug repariert.","PLAIN"];
	};
};