/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState","_refill"];
_vehicle = cursorTarget;
avanix_interrupted = false;
if(isNull _vehicle) exitWith {hint "Du musst das Fahrzeug ansehen, das du auftanken möchtest!";};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint "Du musst näher am Fahrzeug sein!";};

if(!([false,"fuelF",1] call avanix_fnc_handleInv)) exitWith {};
avanix_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format["Wird betankt %1",_displayName];
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
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	uisleep 0.2;
	if(isNull _ui) then {
		5 cutRsc ["avanix_progress","PLAIN"];
		_ui = uiNamespace getVariable "avanix_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(avanix_interrupted) exitWith {};
};
avanix_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(avanix_interrupted) exitWith {avanix_interrupted = false; titleText["Aktion abgebrochen","PLAIN"];};

_refill = ((fuel _vehicle) + (30 / ([typeOf _vehicle] call avanix_fnc_vehFuelCap)));

if(local _vehicle) then {
	_vehicle setFuel _refill;
} else {
	[[_vehicle,_refill],"avanix_fnc_setFuel",_vehicle,false] spawn avanix_fnc_MP;
};

switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		if(!local _vehicle) then
		{
			[[_vehicle,(Fuel _vehicle) + 0.5],"avanix_fnc_setFuel",_vehicle,false] spawn avanix_fnc_MP;
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.5);
		};
	};
	
	case (_vehicle isKindOf "Air"):
	{
		if(!local _vehicle) then
		{
			[[_vehicle,(Fuel _vehicle) + 0.2],"avanix_fnc_setFuel",_vehicle,false] spawn avanix_fnc_MP;
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.2);
		};
	};
	
	case (_vehicle isKindOf "Ship"):
	{
		if(!local _vehicle) then
		{
			[[_vehicle,(Fuel _vehicle) + 0.35],"avanix_fnc_setFuel",_vehicle,false] spawn avanix_fnc_MP;
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.35);
		};
	};
};
titleText[format["Du hast deinen %1 aufgetankt",_displayName],"PLAIN"];
[true,"fuelE",1] call avanix_fnc_handleInv;