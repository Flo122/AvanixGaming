/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts automated mining of resource from the tempest device.
*/
private["_counter","_vehicle","_resourceZones","_randomsum","_arrdel","_zone","_weight","_item","_item1","_item2","_vInv","_itemIndex","_resources","_randomResources","_randomResources1","_randomResources2","_randomVal","_randomValNorm","_randomVal1","_randomVal2","_itemName","_itemName1","_itemName2"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle getVariable "mining"}) exitWith {hint "Dieses Fahrzeug ist bereits am Sammeln";};
closeDialog 0; //Close the interaction menu.
avanix_action_inUse = true; //Lock out the interaction menu for a bit..
_weight = [_vehicle] call avanix_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {hint localize "STR_NOTF_DeviceFull"; avanix_action_inUse = false;};
_counter=0;
while {true} do 
{
	_resourceZones = ["mango_1","mango_2","mango_3","mango_4","ananas_1","ananas_2","ananas_4","weed_1","heroin_1","baumwolle_1","zucker_1","holz_1","salt_1","rohoel_1","mine_1","mine_2"];
	_zone = "";
	//Find out what zone we're near
	{
		if(player distance (getMarkerPos _x) < 150) exitWith {_zone = _x;};
	} foreach _resourceZones;

	if(_zone == "") exitWith {
		hint "Du bist nicht in der Nähe einer Mine";
		avanix_action_inUse = false;
	};
	//Abfrage nach Mine
	if(_zone == "mine_1" || _zone == "mine_2") then{
		
		_weight = [_vehicle] call avanix_fnc_vehicleWeight;																			//test für schleifen ausstieg
		if((_weight select 1) >= (_weight select 0)) exitWith { if(true) exitWith {hint localize "STR_NOTF_DeviceFull"; avanix_action_inUse = false;};};	//test für schleifen ausstieg

		_randomVal = 5 + round(random 7);
		_resources = ["sand","rock","copper","iron","blei"];
		_randomResources = _resources select (floor(random (count _resources)));
		_arrdel=_resources find _randomResources;
		_resources deleteAt _arrdel;
		
		_randomVal1 = 5 + round(random 7);
		_randomResources1 = _resources select (floor(random (count _resources)));

		_randomResources2="";
		_randomVal2=0;
		
		_randomsum	= _randomVal + _randomVal1;
		_randomVal2 = round( random 5);
		
		if( round (random 5) <= 1 ) then {		
			if(_randomVal2 > (25 - _randomsum)) then{
				_randomVal2 = 25 - _randomsum;
			};
			if( ( round (random 10)) >= 1 ) then {
				if( round (random 4) >= 1 ) then {     //noch anpassen für das verhältnis von golderz zu goldnuggets
					_randomResources2 = "gold";
				}else{
					_randomResources2 = "goldnuggets";
				};
			}else{
				_randomResources2 ="dino";
				_randomVal2 = 1;				//so wird es niemals mehr als 1 Knochen
			};
		}else{
			_randomResources2 = "";
		};		
		_item = _randomResources;
		_item1 = _randomResources1;
		_item2 = _randomResources2;
// Nummer 1		
		if(_item == "") exitWith {hint "Falsche Resource?"; avanix_action_inUse = false;};
	_vehicle setVariable ["mining",true,true]; //Lock the device
	[_vehicle,"avanix_fnc_soundDevice",true,false] spawn avanix_fnc_MP; //Broadcast the 'mining' sound of the device for nearby units.
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};
	titleText["Das Fahrzeug sammelt...","PLAIN"];
	_time = time + 37;
	//Wait for 27 seconds with a 'delta-time' wait.
	waitUntil 
	{
		if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist.","PLAIN"]; true};
		if(round(_time - time) < 1) exitWith {true};
		uisleep 0.2;
		false
	};
	if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_item,_items] call TON_fnc_index;
	_weight = [_vehicle] call avanix_fnc_vehicleWeight;
	_sum = [_item,_randomVal,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];if(true) exitwith {hint "Das Fahrzeug ist voll."};};
	_itemWeight = ([_item] call avanix_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};
	
	if(fuel _vehicle == 0) exitWith {titleText["Das Fahrzeug hat keinen Treibstoff mehr","PLAIN"];};
	
	//Locality checks...
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.07;	//0.0095
	} else {
		[[_vehicle,(fuel _vehicle)-0.0695],"avanix_fnc_setFuel",_vehicle,false] spawn avanix_fnc_MP;	//0.009
	};
	if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};
	_itemName = [([_item,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
	if(fuel _vehicle == 0) exitWith {titleText["Das Fahrzeug hat keinen Treibstoff mehr","PLAIN"];};
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call avanix_fnc_vehicleWeight;
	_sum = [_item,_randomVal,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	_sum0 =_sum;
	if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];if(true) exitwith {hint "Das Fahrzeug ist voll."};};
//Nummer 2
	_item0 = _item;
	_item = _item1;
	_randomVal=_randomVal1;
			if(_item == "") exitWith {hint "Falsche Resource?"; avanix_action_inUse = false;};
	_vehicle setVariable ["mining",true,true]; //Lock the device
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_item,_items] call TON_fnc_index;
	_weight = [_vehicle] call avanix_fnc_vehicleWeight;
	_sum = [_item,_randomVal,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];if(true) exitwith {hint "Das Fahrzeug ist voll."};};
	_itemWeight = ([_item] call avanix_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};
	if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};		
	_itemName1 = [([_item,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call avanix_fnc_vehicleWeight;
	_sum = [_item,_randomVal,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	_sum1=_sum;
	if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];if(true) exitwith {hint "Das Fahrzeug ist voll."};};
//Nummer 3
    _sum2=0;
	_itemName2="";
	if(_randomVal2 >= 1 ) then{
	_item = _item2;
	_randomVal=_randomVal2;
	if(_item == "") exitWith {hint "Falsche Resource?"; avanix_action_inUse = false;};
	_vehicle setVariable ["mining",true,true]; //Lock the device
	avanix_action_inUse = false; //Unlock it since it's going to do it's own thing...
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_item,_items] call TON_fnc_index;
	_weight = [_vehicle] call avanix_fnc_vehicleWeight;
	_sum = [_item,_randomVal,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];if(true) exitwith {hint "Das Fahrzeug ist voll."};};
	_itemWeight = ([_item] call avanix_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};
	if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};	
	_itemName2 = [([_item,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call avanix_fnc_vehicleWeight;
	_sum = [_item,_randomVal,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight..
	_sum2=_sum;
	if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];if(true) exitwith {hint "Das Fahrzeug ist voll."};};
	uisleep 2;
	};
	_counter=_counter+1;
	if(_sum2 < 1 ) then{
		hint format["Sammeln beendet!\nFolgendes wurde abgebaut: \n\n%1x %2\n%3x %4\n\n\nDurchgang: %5",_sum0,_itemName,_sum1,_itemName1,_counter]; 
	}else{
		hint format["Sammeln beendet!\nFolgendes wurde abgebaut: \n\n%1x %2\n%3x %4\n%5x %6\n\nDurchgang: %7",_sum0,_itemName,_sum1,_itemName1,_sum2,_itemName2,_counter];
	};
//Standard ablauf für die normalen Farmgebiete--------------------------------------------------------------------------
	} else {
	//Get the resource that will be gathered from the zone name...	
	_randomValNorm = 8 + round(random 7);
		_item = switch(true) do {
			case (_zone in ["mango_1","mango_2","mango_3","mango_4"]): {"mango"};
			case (_zone in ["ananas_1","ananas_2","ananas_4"]): {"ananas"};
			case (_zone in ["weed_1"]): {"hanf"};
			case (_zone in ["heroin_1"]): {"opium"};
			case (_zone in ["holz"]): {"holz"};
			case (_zone in ["baumwolle_1"]): {"baumwolle"};
			case (_zone in ["zucker_1"]): {"zuckerrohr"};
			case (_zone in ["holz_1"]): {"holz"};
			case (_zone in ["salt_1"]): {"salt"};
			case (_zone in ["rohoel_1"]): {"rohoel"};
		default {""};
		};
	if(_item == "") exitWith {hint "Falsche Resource?"; avanix_action_inUse = false;};
	_vehicle setVariable ["mining",true,true]; //Lock the device
	[_vehicle,"avanix_fnc_soundDevice",true,false] spawn avanix_fnc_MP; //Broadcast the 'mining' sound of the device for nearby units.
	avanix_action_inUse = false; //Unlock it since it's going to do it's own thing...
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};
	titleText["Das Fahrzeug sammelt...","PLAIN"];
	_time = time + 37;
	
	//Wait for 37 seconds with a 'delta-time' wait.
	waitUntil 
	{
		if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist.","PLAIN"]; true};
		if(round(_time - time) < 1) exitWith {true};
		uisleep 0.2;
		false
	};
	if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_item,_items] call TON_fnc_index;
	_weight = [_vehicle] call avanix_fnc_vehicleWeight;
	_sum = [_item,_randomValNorm,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];if(true) exitwith {hint "Das Fahrzeug ist voll."};};
	_itemWeight = ([_item] call avanix_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};
	if(fuel _vehicle == 0) exitWith {titleText["Das Fahrzeug hat keinen Treibstoff mehr","PLAIN"];};
	//Locality checks...
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.025;	//0.0095
	} else {
		[[_vehicle,(fuel _vehicle)-0.02],"avanix_fnc_setFuel",_vehicle,false] spawn avanix_fnc_MP;	//0.009
	};
	_itemName = [([_item,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
	if(fuel _vehicle == 0) exitWith {titleText["Das Fahrzeug hat keinen Treibstoff mehr","PLAIN"];};
	_counter=_counter+1;
	hint format["Sammeln beendet!\nFolgendes wurde abgebaut: \n\n%1x %2\n\nDurchgang: %3",_sum,_itemName,_counter];
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call avanix_fnc_vehicleWeight;
	_sum = [_item,_randomValNorm,_weight select 1,_weight select 0] call avanix_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];if(true) exitwith {hint "Das Fahrzeug ist voll."};};
	//if(_sum < 1) exitWith {titleText["Das Fahrzeug ist voll.","PLAIN"];};
	uisleep 2;
	};
		
		if(isEngineOn _vehicle) exitWith {titleText["Du kannst das Fahrzeug nicht starten, solange es am Sammeln ist","PLAIN"];};
		if(fuel _vehicle == 0) exitWith {titleText["Das Fahrzeug hat keinen Treibstoff mehr","PLAIN"];};
		if((_weight select 1) >= (_weight select 0)) exitWith {hint localize "STR_NOTF_DeviceFull"; avanix_action_inUse = false;};
		avanix_action_inUse = false;

};
_vehicle setVariable["mining",nil,true];