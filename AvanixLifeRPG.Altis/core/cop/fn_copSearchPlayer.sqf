/*
	File: fn_copSearchPlayer.sqf
	Author: Pojus/Pearlwar [ALI] Altis Life Italia
    Modificato da: Al Morise(Sink)
	Description:
	Ricerca armi e caricatori nei giocatori
*/
private ["_unit","_displayName","_weaponLegal","_weaponIllegal","_weapAccessories","_magazineLegal","_magazineIllegal","_bpack","_weaponsAmmoFull","_magazinesAmmoFull","_backpack","_vest","_headgear"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_weapon = "";
_magazine = "";
_bpack = "";
_veste = "";
_vestContainer = "";
_uniformeItems = "";
_cappello = "";
    
//_unit = cursorTarget;
if (isNull _unit) exitWith {};

hint "Durchsuche...";
uisleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Du bist zu weit entfernt!"};

_primaryWeapon = primaryWeapon _unit;
_handgunWeapon = handgunWeapon _unit;
_vest = vest _unit;
_headgear = headgear _unit;
_illegalAccessory = false;
  if(_primaryWeapon != "") then {
       _displayName = getText(configFile >> "CfgWeapons" >> _primaryWeapon >> "displayName");
	   _weapMagazine = primaryWeaponMagazine _unit;
	   _weapAccessories = primaryWeaponItems _unit;
		{
		    if(_x in avanix_illegal_stuffs) exitWith { _illegalAccessory = true; };
		}forEach _weapAccessories;
		
		if(_primaryWeapon in avanix_illegal_stuffs || _illegalAccessory) then {
  		    _weapon = format["<t color='#FF0000'>%1%2</t><br/>", _weapon, _displayName];
		} else { _weapon = format["<t color='#00FF00'>%1%2</t><br/>", _weapon, _displayName]; };
		
		if(count _weapMagazine > 0) then {
		    _magazineName = getText(configFile >> "CfgMagazines" >> (_weapMagazine select 0) >> "displayName");
		    if((_weapMagazine select 0) in avanix_illegal_stuffs) then {
		        _weapon = format["<t color='#FF0000'>%1%2</t><br/>", _weapon, _magazineName];
		    } else { _weapon = format["<t color='#00FF00'>%1%2</t><br/>", _weapon, _magazineName]; };
		};
  };
  
  if(_illegalAccessory) then { _illegalAccessory = false; };
  
  if(_handgunWeapon != "") then {
       _displayName = getText(configFile >> "CfgWeapons" >> _handgunWeapon >> "displayName");
	   _weapMagazine = handgunMagazine _unit;
	   _weapAccessories = handgunItems _unit;
		{
		    if(_x in avanix_illegal_stuffs) exitWith { _illegalAccessory = true; };
		}forEach _weapAccessories;
		
		if(_handgunWeapon in avanix_illegal_stuffs || _illegalAccessory) then {
  		    _weapon = format["<t color='#FF0000'>%1%2</t><br/>", _weapon, _displayName];
		} else { _weapon = format["<t color='#00FF00'>%1%2</t><br/>", _weapon, _displayName]; };
		
		if(count _weapMagazine > 0) then {
		    _magazineName = getText(configFile >> "CfgMagazines" >> (_weapMagazine select 0) >> "displayName");
		    if((_weapMagazine select 0) in avanix_illegal_stuffs) then {
		        _weapon = format["<t color='#FF0000'>%1%2</t><br/>", _weapon, _magazineName];
		    } else { _weapon = format["<t color='#00FF00'>%1%2</t><br/>", _weapon, _magazineName]; };
		};
  };
  
  if(_weapon == "") then {
      _weapon = "Keine Waffen gefunden!<br/>";
  };

  if(backPack _unit != "") then {
    _backpack = backpackItems _unit;
    if(count _backpack > 0) then {
      {
	     if(isClass (configFile >> "CfgWeapons" >> _x)) then {
		        _displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
		 }else {
		     if(isClass (configFile >> "CfgMagazines" >> _x)) then {
			     _displayName = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
			 } else {
			     if(isClass(configFile >> "CfgVehicles" >> "Vest_"+_x)) then {
				     _displayName = getText(configFile >> "CfgVehicles" >> "Vest_"+_x >> "displayName");
				 } else {
				     if(isClass(configFile >> "CfgVehicles" >> "Headgear_"+_x)) then {
					     _displayName = getText(configFile >> "CfgVehicles" >> "Headgear_"+_x >> "displayName");
					 }else {_displayName = _x; };
				 };
			 };
		 };
	     
		 if(_x in avanix_illegal_stuffs) then {
	           _bpack = format["<t color='#FF0000'>%1%2</t><br/>", _bpack,_displayName];
		 } else { _bpack = format["<t color='#00FF00'>%1%2</t><br/>", _bpack,_displayName]; };
	  }forEach _backpack;
    } else {
       _bpack = "Rucksack ist leer!<br/>";
    };
  } else { _bpack = "Kein Rucksack vorhanden!<br/>";};
   
   if( _vest != "" ) then {
     _vestItems = vestItems _unit;
	 if(isClass (configFile >> "CfgVehicles" >> "Vest_"+_vest)) then {
	     _displayName = getText(configFile >> "CfgVehicles" >> "Vest_"+_vest >> "displayName");
	 }else { _displayName = _vest; };
     
	 if(!(_vest in avanix_illegal_stuffs)) then {
          _veste = format["<t color='#00FF00'>%1</t><br/>",_displayName];
     }else { _veste = format["<t color='#FF0000'>%1</t><br/>",_displayName]; };
	 if(count _vestItems > 0) then {
	 {
	     if(isClass (configFile >> "CfgWeapons" >> _x)) then {
		        _displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
		 }else {
		     if(isClass (configFile >> "CfgMagazines" >> _x)) then {
			     _displayName = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
			 } else {
			     if(isClass(configFile >> "CfgVehicles" >> "Vest_"+_x)) then {
				     _displayName = getText(configFile >> "CfgVehicles" >> "Vest_"+_x >> "displayName");
				 } else {
				     if(isClass(configFile >> "CfgVehicles" >> "Headgear_"+_x)) then {
					     _displayName = getText(configFile >> "CfgVehicles" >> "Headgear_"+_x >> "displayName");
					 }else {_displayName = _x; };
				 };
			 };
		 };
		 
		 if(_x in avanix_illegal_stuffs) then {
			     _vestContainer = format["<t color='#FF0000'>%1%2</t><br/>", _vestContainer,_displayName];
	     } else { _vestContainer = format["<t color='#00FF00'>%1%2</t><br/>", _vestContainer,_displayName]; };
     }forEach _vestItems;
	 }else { _vestContainer = "Weste ist leer!<br/>";};
   } else { _veste = "Keine Weste vorhanden!<br/>"; };
   
   if(_headgear != "") then {
       if(isClass(configFile >> "CfgVehicles" >> "Headgear_"+_headgear)) then {
	       _displayName = getText(configFile >> "CfgVehicles" >> "Headgear_"+_headgear >> "displayName");
	   }else { _displayName = _headgear; };
       if(!(_headgear in avanix_illegal_stuffs)) then {
           _cappello = format["<t color='#00FF00'>%1</t><br/>",_displayName];
	   }else { _cappello = format["<t color='#FF0000'>%1</t><br/>",_displayName]; };
   } else { _cappello = "Keine Kopfbedeckung vorhanden!<br/>"; };
   
   if(uniform _unit != "") then {
       _uniformItems = uniformItems _unit;
	   if(count _uniformItems > 0) then {
	   {
	   
	    if(isClass (configFile >> "CfgWeapons" >> _x)) then {
		        _displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
		 }else {
		     if(isClass (configFile >> "CfgMagazines" >> _x)) then {
			     _displayName = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
			 } else {
			     if(isClass(configFile >> "CfgVehicles" >> "Vest_"+_x)) then {
				     _displayName = getText(configFile >> "CfgVehicles" >> "Vest_"+_x >> "displayName");
				 } else {
				     if(isClass(configFile >> "CfgVehicles" >> "Headgear_"+_x)) then {
					     _displayName = getText(configFile >> "CfgVehicles" >> "Headgear_"+_x >> "displayName");
					 }else {_displayName = _x; };
				 };
			 };
		 };
		 
	     if(_x in  avanix_illegal_stuffs) then {
		       _uniformeItems = format["<t color='#FF0000'>%1%2</t><br/>", _uniformeItems,_displayName];
		 } else { _uniformeItems = format["<t color='#00FF00'>%1%2</t><br/>", _uniformeItems,_displayName]; };
	   }forEach _uniformItems;
	   }else { _uniformeItems = "Kleidung ist leer!<br/>";};
   } else { _uniformeItems = "Keine Kleidung vorhanden!<br/>"; };
	   
   
   
hint parseText format["<t color='#FFFFFF'><t size='1'>Primärwaffe:</t></t><br/><t size ='0.8'>%1</t><br/><t color='#FFFFFF'><t size='1'>Rucksack Inhalt:</t></t><br/><t size ='0.8'>%2</t><br/><t color='#FFFFFF'><t size='1'>Weste:</t></t><br/><t size ='0.8'>%3</t><br/><t color='#FFFFFF'><t size='1'>Westen Inhalt:</t></t><br/><t size ='0.8'>%4</t><br/><t color='#FFFFFF'><t size='1'>Kopfbedeckung</t></t><br/><t size ='0.8'>%5</t><br/><t color='#FFFFFF'><t size='1'>Uniform</t></t><br/><t size ='0.8'>%6</t><br/>", _weapon,_bpack,_veste,_vestContainer,_cappello,_uniformeItems];