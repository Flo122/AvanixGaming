/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/

diag_log "AirdropAdmin wurde gestartet !!";
_posPlayer = [_this,0,[],[[]]] call BIS_fnc_param;

if (!airdrop_enable) exitWith {};
if (airdrop_goingon) exitWith {};
if({side _x == civilian} count playableUnits < 8) exitWith {};
airdrop_goingon = true;

_dest = _posPlayer;

uisleep 1;

// AIRDROP STARTEN
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>Die Bundeswehr erwartet eine neue Waffenlieferung. Die Soeldner werden versuchen dieser Lieferung abzupassen. Der Ort des Ueberfalls wird in kuerze auf der Karte markiert.</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;

uisleep 600;

_marker = createMarker ["Airdropmarker", _dest];
"Airdropmarker" setMarkerColor "ColorRed";
"Airdropmarker" setMarkerType "Empty";
"Airdropmarker" setMarkerShape "ELLIPSE";
"Airdropmarker" setMarkerSize [500,500];
_markerText = createMarker ["Airdropmarkertext", _dest];
"Airdropmarkertext" setMarkerColor "ColorBlack";
"Airdropmarkertext" setMarkerText "Airdrop";
"Airdropmarkertext" setMarkerType "mil_warning";

[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>10 Minuten bis zum Ueberfall auf die Waffenlieferung der Bundeswehr! Checkt die Karte!!!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
uisleep 300;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>5 Minuten bis zum Ueberfall auf die Waffenlieferung der Bundeswehr! Checkt die Karte!!!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
uisleep 60;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>4 Minuten bis zum Ueberfall auf die Waffenlieferung der Bundeswehr! Checkt die Karte!!!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
uisleep 60;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>3 Minuten bis zum Ueberfall auf die Waffenlieferung der Bundeswehr! Checkt die Karte!!!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
uisleep 60;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>2 Minuten bis zum Ueberfall auf die Waffenlieferung der Bundeswehr! Checkt die Karte!!!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
uisleep 60;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>1 Minute bis zum Ueberfall auf die Waffenlieferung der Bundeswehr! Checkt die Karte!!!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;

heli1 = CreateVehicle [airdrop_helicopter_main, [7950, 9667, 0], [], 0, "FLY"];
heli1 allowDamage false;

_mygroup1 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

{_x moveInDriver heli1} forEach units _mygroup1;

_mygroup1 addWaypoint [_dest, 0];
_mygroup1 addWaypoint [[2380.47,22267.8,0], 0];

_markerText = createMarker ["airbox_marker", [14028.5,18719.7,0.0014267]];
"airbox_marker" setMarkerColor "ColorGreen";
"airbox_marker" setMarkerText " Airdrop Box";
"airbox_marker" setMarkerType "mil_destroy";

_containerdummy = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_containerdummy attachTo [heli1,[0,0,-3.5]];
_containerdummy setDir 90;

while { _dest distance heli1 > 250 } do { "airbox_marker" setMarkerPos getPos heli1; uisleep 0.1 };
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>Der Angriff der Soeldner auf die Lieferung der Bundeswehr wurde verhindert. Allerdings sind alle dabei umgekommen. Ihr habt 20 Minuten um die Waffen zu stehlen, danach wird sich die Kiste selbst zerstoeren!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;

// Drop the container

deleteVehicle _containerdummy;
uisleep 0.1;
_container = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_para = createVehicle ["O_Parachute_02_F", [getPos heli1 select 0, getPos heli1 select 1, getPos heli1 select 2], [], 0, ""];
_para setPosATL (heli1 modelToWorld[0,0,100]);
_para attachTo [heli1,[0,0,-10]];
detach _para;
_container attachTo [_para,[0,0,-2]];
_container setDir 90;
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _container];
_smoke="SmokeShellRed" createVehicle [getpos _container select 0, getpos _container select 1,0];
_smoke attachTo [_container,[0,0,0]];
_light = "Chemlight_red" createVehicle getPos _container;
_light attachTo [_container,[0,0,0]];
_flare = "F_40mm_Red" createVehicle getPos _container;
_flare attachTo [_container,[0,0,0]];
uisleep 0.1;
while { (getPos _container select 2) > 2 } do { "airbox_marker" setMarkerPos getPos heli1;uisleep 1; };
detach _container;
_container setPos [getPos _container select 0, getPos _container select 1, (getPos _container select 2)+0.5];
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _container];
uisleep 6;
"M_NLAW_AT_F" createVehicle [getPos _container select 0, getPos _container select 1, 0];
_pos_container = getPos _container;
deleteVehicle _container;
uisleep 0.5;
_box = createVehicle ["CargoNet_01_box_F", _pos_container, [], 0, "CAN_COLLIDE"];
_box allowDamage false;
_box enableRopeAttach false;

_box setVariable["trunk_in_use",false,true];
_box setVariable["locked",false,true];
airdrop_kiste = _box;
publicVariable "airdrop_kiste";
_box allowDamage false;
_box enableRopeAttach false;

/*
_markerText = createMarker ["airbox_kiste", getPos _box];
 "airbox_kiste" setMarkerColor "ColorBlue";
 "airbox_kiste" setMarkerText "Airdrop Box";
 "airbox_kiste" setMarkerType "mil_destroy"; 
*/

_smoke="SmokeShellRed" createVehicle [getpos _box select 0,getpos _box select 1,0];
_flare = "F_40mm_Red" createVehicle getPos _container;
_light attachTo [_box,[0,0,0]];
_flare attachTo [_box,[0,0,0]];

deleteMarker "airbox_marker";

// Fill box

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;

//Avanix modification begin

_item="";
_anz = 2 + round(random 3);
_itembox=[["lowerreceiver",_anz]];

_counter=7;
_savecounter=10;
_vari=0;
_sum=0;
_sum=_anz;
_zufall=0;
_liste=["lauf127","acpc2schlitten","zylinderverschluss"];
_liste1=["bullpupgearbox","rollenverschluss"];
_liste2=["dichtungssystem","rueckstossfeder","eichsystem","verzoegertermasseverschluss"];
_liste3=["lauf9mm","lauf65"];
_liste4=["rook40schlitten","p07schlitten","kurzergaskolben","drehkopfverschluss","tragegriff","lauf45","unverriegekltermasseverschluss"];
_liste5=["4fiveschlitten","geradezugverschluss","lauf762","gasdrucksystem","picatinnyschiene","zubrframe"];
_liste6=["lauf556","lauf338","lauf93","trommel45acp6rnd"];
_arrdel="";
//schleife begin
while {_counter>=1} do {
	_zufall=random 3;
 
	if(_zufall<=1)then {
		_zufall=random 36;
			if(_zufall<=7)then {
				_vari=4;
				if((count _liste)==0) then { 
					_counter = _counter + 1;
				}else{
					_item = _liste select (floor(random (count _liste)));
					_anz= 1 + round(random _vari);
					_arrdel=_liste find _item;
					_liste deleteAt _arrdel;
				};
				
			};
			if(_zufall<=18)then {
				
				_vari=8;
				if((count _liste1)==0) then { 
					_counter = _counter + 1;
				}else{
					_item = _liste select (floor(random (count _liste)));
					_anz= 1 + round(random _vari);
					_arrdel=_liste find _item;
					_liste deleteAt _arrdel;
				};
			};
			if(_zufall<=36)then {
				
				_vari=15;
				if((count _liste2)==0) then { 
					_counter = _counter + 1;
				}else{
					_item = _liste2 select (floor(random (count _liste2)));
					_anz= 1 + round(random _vari);
					_arrdel=_liste2 find _item;
					_liste2 deleteAt _arrdel;
				};
			};
	};

	if(_zufall<=3)then {
		_zufall=random 30;
		if(_zufall<=12)then {
			
			_vari=9;
			if((count _liste3)==0) then { 
					_counter = _counter + 1;
				}else{
					_item = _liste3 select (floor(random (count _liste3)));
					_anz= 1 + round(random _vari);
					_arrdel=_liste3 find _item;
					_liste3 deleteAt _arrdel;
				};
		};
		if(_zufall<=20)then {
			_vari=6;
			if((count _liste4)==0) then { 
					_counter = _counter + 1;
				}else{
					_item = _liste4 select (floor(random (count _liste4)));
					_anz= 1 + round(random _vari);
					_arrdel=_liste4 find _item;
					_liste4 deleteAt _arrdel;
				};
		};
		if(_zufall<=26)then {
			
			_vari=3;
			if((count _liste5)==0) then { 
					_counter = _counter + 1;
				}else{
					_item = _liste5 select (floor(random (count _liste5)));
					_anz= 1 + round(random _vari);
					_arrdel=_liste5 find _item;
					_liste5 deleteAt _arrdel;
				};
		};
		if(_zufall<=30)then {	
			
			_vari=2;
			if((count _list6)==0) then { 
					_counter = _counter + 1;
				}else{
					_item = _liste6 select (floor(random (count _liste6)));
					_anz= 1 + round(random _vari);
					_arrdel=_liste6 find _item;
					_liste6 deleteAt _arrdel;
				};
		};
	};
	_itembox pushBack [_item,_anz];
	_sum = _sum + _anz;
	_counter = _counter - 1;
	_savecounter = _savecounter -1;
	
	if(_counter<0)exitWith{};
	if(_counter>8)exitWith{};
	if(_savecounter <0)exitWith{};
};	//schleife ende

_itemListe=[_itembox,_sum];
_box setVariable["Trunk",_itemListe,true];
//Avanix modification end

// Fill box end

uisleep 100;
deleteVehicle heli1;

uisleep 600;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>5 Minuten bis zur Zerstoerung der Waffenlieferung!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
uisleep 240;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>1 Minute bis zur Zerstoerung der Waffenlieferung!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
uisleep 50;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>10 Sekunden bis zur Zerstoerung der Waffenlieferung!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
uisleep 10;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\airdrop.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Airdrop</t></t><br/><br/><t size='1'>AirDrop-Mission ist beendet!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
deleteVehicle _box; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-21,(getPos _box select 1)+21,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-1,(getPos _box select 1)+56,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+23,(getPos _box select 1)-75,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-50,(getPos _box select 1)+1,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+87,(getPos _box select 1)-22,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+0,(getPos _box select 1)-0,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+20,(getPos _box select 1)-20,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-100,(getPos _box select 1)+56,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+100,(getPos _box select 1)-100,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-55,(getPos _box select 1)+123,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+577,(getPos _box select 1)-83,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+35,(getPos _box select 1)-99,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+100,(getPos _box select 1)-100,0];
uisleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-431,(getPos _box select 1)-431,0];

"Airdropmarker" setMarkerAlpha 0;
"Airdropmarkertext" setMarkerAlpha 0;

//deleteMarker "airbox_kiste";
deleteMarker "Airdropmarker";
deleteMarker "Airdropmarkertext";

airdrop_goingon = false;