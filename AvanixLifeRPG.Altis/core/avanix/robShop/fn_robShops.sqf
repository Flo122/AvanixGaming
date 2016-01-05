/* 		
		file: fn_robShops.sqf
		Author: Stevo		
		
		Description: Executes the rob shop action!
		Thanks: MrKraken (for the barebones tutorial), Ciaran (for assisting with syntax errors and script development) & Erdem Cankiran (for showing how to implement the user of markers)
*/ 

private["_shop","_robber","_loot","_dist","_rip","_marker","_pos","_ui","_progress","_pgText","_cP","_chance","_temp","_alarm","_shopName","_pause"];

//The object that has the action attached to it is _this.
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 

//The player.
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Setting a delay to be used later (seconds).
_pause = 300;

//Identifying the associated marker with the shop.
_marker = switch (_shop) do
{
	case station_1: {"fuelshop_13"};
	case station_2: {"fuelshop_2"};
	case station_3: {"fuelshop_3"};
	case station_4: {"fuelshop_28"};
	case station_5: {"fuelshop_9"};
	case station_6: {"fuelshop_4"};
	case station_7: {"fuelshop_5"};
	case station_8: {"fuelshop_10"};
	case station_9: {"fuelshop_7"};
	case station_10: {"fuelshop_8"};
	case station_11: {"fuelshop_6"};
	case station_12: {"fuelshop_12"};
	case station_13: {"fuelshop_1"};
	case station_14: {"fuelshop_11"};
};

//Giving the shop a friendly name.
_shopName = switch (_shop) do
{
	case station_1: {"Tankstelle Neri"};
	case station_2: {"Tankstelle Kavala"};
	case station_3: {"Tankstelle Aggelochori"};
	case station_4: {"Tankstelle Negades"};
	case station_5: {"Tankstelle am Flughafen"};
	case station_6: {"Tankstelle Gravia"};
	case station_7: {"Tankstelle Telos"};
	case station_8: {"Tankstelle Athira"};
	case station_9: {"Tankstelle Charkia"};
	case station_10: {"Tankstelle Pyrgos"};
	case station_11: {"Tankstelle Chalkeia"};
	case station_12: {"Tankstelle Paros"};
	case station_13: {"Tankstelle Ioannina"};
	case station_14: {"Tankstelle Sofia"};
};
	
if (isNil "_marker") exitWith {};
_pos = getMarkerPos _marker;

/* First-Run Checks */

_loot = _shop getVariable "_funds";
_rip = _shop getVariable "_status";

if (isNil "_loot") then {
	_loot = 1000 + round(random 9000);
	_shop setVariable ["_funds",_loot,true];
};

if (isNil "_rip") then {
	_rip = false;
	_shop setVariable ["_status",_rip,true];
};

_loot = _shop getVariable "_funds";
_rip = _shop getVariable "_status";


/* Initiation Checks */
if (_loot == 0) exitWith {hint "Momentan ist kein Geld in der Kasse!"};
if (vehicle player != _robber) exitWith {hint "Du musst aus dem Fahrzeug aussteigen!"};
if (currentWeapon _robber == "") exitWith {hint "Du brauchst ne Waffe!"};
if ((west countSide playableUnits) < 4) exitWith {hint "Es sind nicht genügend Polizisten online!"};
if (_rip) exitWith {hint "Die Tankestelle wird bereits ausgeraubt!"};
if !(alive _robber) exitWith {};
if !(playerside == civilian) exitWith {hint "Du bist im Dienst!"};
if (avanix_robbed_station) exitWith {hint "Du hast erst vor kurzem die Tankstelle ausgeraubt!"};


/* Robbery Action */

_rip = true; //Robbery in Progress
_shop setVariable ["_status",_rip,true];
_marker setMarkerColor "ColorRed";
_marker setMarkerType "mil_warning";
_marker setMarkerText "!!!ACHTUNG RAUB!!!";

//Sets up the Progress Bar
disableSerialization;
5 cutRsc ["avanix_progress","PLAIN"];
_ui = uiNameSpace getVariable "avanix_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2...  (1%1)","%",("Raube Tankstelle aus...")];
_progress progressSetPosition 0.01;
_cP = 0.01;

_alarm = false;

_rip = _shop getVariable "_status";
if (_rip) then {
	while{true} do {
		if (_cP >= 1) exitWith {};
		uisleep 0.5;
		avanix_robbed_station = true;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3...  (%2%1)","%",round(_cP * 100),("Raube Tankstelle aus...")];
		
		_dist = _robber distance _shop;
		if !(_dist < 11) exitWith {};
		if !(alive _robber) exitWith {};
		
		//Randomises the alarm at any point, to trigger once
		if !(_alarm) then {

			//Randomises the chance with random integer and player distance from shop NPC / register
			_chance = random(9900);
			_chance = _chance + (_dist * 10);
			
			//Triggering the alarm + adding player to wanted system
			if (_chance > 9800) then {
				hint "Der Kasierer hat einen stillen Alarm ausgelöst, du solltest verschwinden!";
				[[1,format["ALARM! - Überfall bei %1!", _shopName]], "avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;
				[[getPlayerUID _robber,name _robber,"211"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
				_alarm = true;
			};
		};
	};

	//Exit client script checks
	If !(alive _robber) exitWith { 
		_rip = false;
		_shop setVariable ["_status",_rip,true];
		_marker setMarkerColor "ColorGreen";
		_marker setMarkerType "loc_Fuelstation";
		_marker setMarkerText "_shopname";
	};
	If (_robber distance _shop > 10) exitWith {
		_rip = false;
		_shop setVariable ["_status",_rip,true];
		_marker setMarkerColor "ColorGreen";
		_marker setMarkerType "loc_Fuelstation";
		_marker setMarkerText "_shopname";
		hint "Du bist zu weit weg!";
		5 cutText ["","PLAIN"];
	};
	
	//Removes progress bar
	5 cutText ["","PLAIN"];

	//Exit code
	titleText[format["Du hast die Tankstelle ausgeraubt! Deine Beute: %1€",[_loot] call avanix_fnc_numberText],"PLAIN"];
	[[1,format["Jemand hat gerade die %1 ausgeraubt!", _shopName]], "avanix_fnc_broadcast",civilian,false] spawn avanix_fnc_MP;
	_loot = _shop getVariable "_funds";
	avanix_cash = avanix_cash + _loot;
	_loot = 0;
	_shop setVariable ["_funds",_loot,true];
	_rip = false;
	_shop setVariable ["_status",_rip,true];
	avanix_use_atm = false;
	hint "Du kannst erst nach 20 Minuten einen Geldautomaten benutzen!";

	//Reset script for shops (global)
	[[[_shop,_marker,_pause],"core\avanix\robShop\fn_robShopReset.sqf"],"BIS_fnc_execVM",false,false] call bis_fnc_MP;

	//Client-side reset
	uisleep _pause;
	hint "Du kannst nun wieder Geldautomaten benutzen!";
	avanix_use_atm = true;
	avanix_robbed_station = false;
	_loot = _shop getVariable "_funds";
};