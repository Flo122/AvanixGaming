/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call avanix_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;

//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.570];
_food ctrlSetText format["%1%2", avanix_hunger, "%"];
_food ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
/*if(avanix_hunger < 0.3) then { 
	_food ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
};*/
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.508];
_water ctrlSetText format["%1%2", avanix_thirst, "%"];
_water ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
/*if(avanix_thirst < 0.3) then { 
	_water ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
};*/
_water ctrlCommit 0;
//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.446];
_dam = round((1 - (damage player)) * 100);
_health ctrlSetText format["%1%2", _dam, "%"];
_health ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
/*if(damage player > 0.5) then { 

		_health ctrlSetBackgroundColor [255, 0, 0, 0.5]; 	
};*/
_health ctrlCommit 0;