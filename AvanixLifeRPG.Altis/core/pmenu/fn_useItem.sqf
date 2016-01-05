/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			avanix_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn avanix_fnc_blastingCharge;
	};
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn avanix_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn avanix_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig","methkueche"]): {
		[_item] call avanix_fnc_storageBox;
	};
	
	case (_item == "truckstorage"):
	{
		if(vehicle player != player) exitWith {hint "Das Auto kann nicht von innen erweitert werden"};
		[] spawn avanix_fnc_truckStorage;
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			avanix_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				avanix_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - avanix_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn avanix_fnc_jerryRefuel;
	};
	
	case (_item == "fuelE"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[cursorTarget] spawn avanix_fnc_fuelE;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn avanix_fnc_lockpick;
	};
	
	case (_item in ["mango","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","ananas"]):
	{
		[_item] call avanix_fnc_eatFood;
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull avanix_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_spikeStrip;
		};
	};
	
	case (_item == "barriere_g"):
	{
		if(!isNull avanix_barriere_g) exitWith {hint "Du stellst schon eine Barriere auf!"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_barriere_g;
		};
	};
	
	case (_item == "pylone"):
	{
		if(!isNull avanix_pylone) exitWith {hint "Du stellst schon eine Pylone auf!"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_pylone;
		};
	};
	
	case (_item == "schranke"):
	{
		if(!isNull avanix_schranke) exitWith {hint "Du stellst schon eine Schranke auf!"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_schranke;
		};
	};
	
	case (_item == "barriere_k"):
	{
		if(!isNull avanix_schranke) exitWith {hint "Du stellst schon eine Barriere auf!"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_barriere_k;
		};
	};
	
	case (_item == "strahler"):
	{
		if(!isNull avanix_strahler) exitWith {hint "Du stellst schon einen Strahler auf!"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_strahler;
		};
	};
	
	case (_item == "target"):
	{
		if(!isNull avanix_strahler) exitWith {hint "Du stellst schon ein Übungsziel auf!"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_target;
		};
	};
	
	case (_item == "sandsack"):
	{
		if(!isNull avanix_strahler) exitWith {hint "Du stellst schon eine Mauer auf!"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_sandsack;
		};
	};
	
	case (_item == "bunker"):
	{
		if(!isNull avanix_strahler) exitWith {hint "Du stellst schon einen Bunker auf!"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_bunker;
		};
	};
	
	case (_item == "medhouse"):
	{
		if(!isNull avanix_strahler) exitWith {hint "Du stellst schon einen Container auf!"};
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			[] spawn avanix_fnc_container;
		};
	};
	
	case (_item == "heroin"):
	{
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			if(isNil "avanix_drug") then {avanix_drug = 0;};
			avanix_drug = avanix_drug + 1.0;
			ReportLoc = getPos player;
			[[0,format["%1 drückt sich eine Nadel in den Arm und spielt Bahnhof Zoo!",name player]],"avanix_fnc_broadcast",civilian,false] spawn avanix_fnc_MP;
			[] spawn avanix_fnc_heroine;
			[[0,format["POLIZEI REPORT: Da ist ein Drogensüchtiger, der braucht dringend Hilfe. Ist es nicht dein Job Drogenmissbrauch zu unterbinden?! -Anon",name player]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;
		};
	};
	
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call avanix_fnc_handleInv)) then
		{
			if(isNil "avanix_drug") then {avanix_drug = 0;};
			avanix_drug = avanix_drug + 1.0;
			ReportLoc = getPos player;
			[[0,format["%1 raucht einen Joint und singt - because i got high!",name player]],"avanix_fnc_broadcast",civilian,false] spawn avanix_fnc_MP;
			[] spawn avanix_fnc_weed;
			[] spawn avanix_fnc_useDrug;
			[[0,format["POLIZEI REPORT: Da ist ein Drogensüchtiger, der braucht dringend Hilfe. Ist es nicht dein Job Drogenmissbrauch zu unterbinden?! -Anon",name player]],"avanix_fnc_broadcast",west,false] spawn avanix_fnc_MP;
		};
	};
	
	case (_item == "gpstracker"): 
	{
		[cursorTarget] spawn avanix_fnc_gpsTracker;
	};
	
	case (_item == "blaulicht"): 
	{
		[cursorTarget] spawn avanix_fnc_blaulicht;
	};
	
	case (_item == "burglartool"):
	{
		hint "ein kleines und effektives Gerät. Nur für den Trainingseinsatz von Polizisten gedacht.";
	};
	
	case (_item in ["alarmsystem","alarmsystemGPS","alarmsystemDog","alarmsystemGuard","metalGrilledWindow"]):
	{
		[_item] call avanix_fnc_placeAlarmsystem;
	};

	case (_item == "spytoolkit"):
	{
		hint "Du verstreust etwas Pulver aus dem Set aber der Wind hat es sofort weggeblasen... Irgendwie geht das so nicht...";
	};
	
	case (_item == "speedtrap"):
	{
        [] spawn avanix_fnc_speedtrapAdd;
        closeDialog 0;
	};    
       
	case (_item == "speedtrapdetector"):
	{
		hint "...es blinkt...";
	};
	
	case (_item == "fuelManipulator"):
	{
        closeDialog 0;
		[] spawn avanix_fnc_fuelchangerManipulate;
	};    
       
 	case (_item == "fuelPipe"):
	{
        closeDialog 0;
		[] spawn avanix_fnc_fuelPipe;
	};
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call avanix_fnc_p_updateMenu;
[] call avanix_fnc_hudUpdate;