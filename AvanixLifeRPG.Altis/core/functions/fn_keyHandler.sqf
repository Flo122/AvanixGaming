/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_player","_boxType","_hideoutID"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_player = player;

_interactionKey = if((actionKeys "User10") isEqualTo []) then {219} else {(actionKeys "User10") select 0};
_getOverKey = if((actionKeys "GetOver") isEqualTo []) then {47} else {(actionKeys "GetOver") select 0};
_crouchKey = if((actionKeys "Crouch") isEqualTo []) then {44} else {(actionKeys "Crouch") select 0};
_runKey = if((actionKeys "Turbo") isEqualTo []) then {42} else {(actionKeys "Turbo") select 0};
_speakKey = if((actionKeys "PushToTalk") isEqualTo []) then {58} else {(actionKeys "PushToTalk") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

_boxType = ["Land_Cargo10_grey_F","Land_Pod_Heli_Transport_04_box_F","Land_Wreck_Traw_F","Box_IND_AmmoVeh_F","Land_Cargo20_blue_F","CargoNet_01_box_F","B_Slingload_01_Cargo_F","Land_MetalCase_01_large_F"];

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(avanix_action_inUse) exitWith {
	if(!avanix_interrupted && _code in _interruptionKeys) then {avanix_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!avanix_action_inUse) then {
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn avanix_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			avanix_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!avanix_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn avanix_fnc_jumpFnc; //Local execution
			[[player,false],"avanix_fnc_jumpFnc",nil,FALSE] call avanix_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	case (_speakKey):
	{
		if(currentChannel == 7) then 
		{
			setCurrentChannel 5;
			hint "Es ist nich erlaubt im Sidechannel zu reden!";
		};
		if(!(avanix_speak)) then 
		{
			avanix_speak = true;
			if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then
			{
				if ((ctrlText ((findDisplay 63) displayCtrl 101) == localize "str_channel_direct")) then
				{
					player setVariable["speak",true,true];
						[] spawn 
						{
							waitUntil {(isNull findDisplay 63) && (isNull findDisplay 55)};
							player setVariable["speak",false,true];
							avanix_speak = false;
						};
					} else {
						player setVariable["speak",false,true];
						avanix_speak = false;
					};
				} else {
				player setVariable["speak",false,true];
				avanix_speak = false;
			};
		};
	};
	
	case _getOverKey:
	{
		if (avanix_is_arrested) then
		{
			_handled = true;
		};
		if(_shift) then {_handled = true;};
		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && !(player getVariable ["hostage", false]) && (animationState player) != "Incapacitated" && !avanix_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} 
					else
				{
					[] spawn avanix_fnc_surrender;
				};
			};
		};
	};

	case _crouchKey:
	{
		if (avanix_is_arrested) then{
			_handled = true;
		};
	};

	case _runKey:
	{
		if (avanix_is_arrested) then{
			_handled = true;
		};
	};
	
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {
				if(!visibleMap) then {
					[] spawn avanix_fnc_copMarkers;
				}
			};
			case independent: {
				if(!visibleMap) then {
					[] spawn avanix_fnc_medicMarkers;  
				}
			};
			case civilian: {
				if(!visibleMap) then {
					[] spawn avanix_fnc_gangMarkers;
				}
			};
		};
	};
	
	case 1:
	{
		[] call SOCK_fnc_updateRequest;
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			avanix_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "avanix_curWep_h" && {(avanix_curWep_h != "")}) then {
			if(avanix_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon avanix_curWep_h;
			};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!avanix_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn avanix_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				avanix_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call avanix_fnc_restrainActionCop;
		}
			else
		{
			if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable ["Escorting", false]) && !(cursorTarget getVariable ["restrained", false]) && speed cursorTarget < 1 ) then
			{
				if([false,"kabelbinder",1] call avanix_fnc_handleInv) then
				{
					[] call avanix_fnc_restrainActionCiv;
					hint "Benutze die Action10-Taste, um weitere Aktionen anzuzeigen";
				}
				else
				{
					hint "Du hast keine Kabelbinder dabei!";
				};
			};
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !avanix_knockout && !(player getVariable["restrained",false]) && !avanix_istazed) then
			{
				[cursorTarget] spawn avanix_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in avanix_vehicles) then
				{
					[vehicle player] call avanix_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F" OR cursorTarget isKindOf "LandVehicle" OR typeof cursorTarget in _boxType) && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in avanix_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call avanix_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
    case 38:
    {
        //If cop run checks for turning lights on.
        if(_shift && (playerSide == west)) then {
            if(vehicle player != player && (typeOf vehicle player) in [
			"C_Hatchback_01_sport_F",
			"C_Hatchback_01_F",
			"C_Offroad_01_F",
			"C_SUV_01_F",
			"B_Heli_Transport_01_F",
			"I_MRAP_03_F",
			"C_Kart_01_Blu_F",
			"B_MRAP_01_F",
			"B_Heli_Light_01_F",
			"O_Heli_Light_02_unarmed_F",
			"I_Heli_light_03_unarmed_F",
			"B_Quadbike_01_F",
			"B_Truck_01_mover_F",
			"C_Van_01_box_F",
			"O_Truck_02_box_F",
			"O_Truck_03_repair_F",
			"C_Rubberboat",
			"C_Heli_Light_01_civil_F",
			"O_Heli_Transport_04_F",
			"O_Heli_Transport_04_medevac_F",
			"C_Boat_Civil_01_police_F",
			"B_SDV_01_F"
			]) then {
                if(!isNil {vehicle player getVariable "lights"}) then {
                [vehicle player] call avanix_fnc_sirenLights;
                _handled = true;
                };
            };
        };
        
        if(_shift && (playerSide == independent)) then {
            if(vehicle player != player && (typeOf vehicle player) in [
			"C_Hatchback_01_sport_F",
			"C_Hatchback_01_F",
			"C_Offroad_01_F",
			"C_SUV_01_F",
			"B_Heli_Transport_01_F",
			"I_MRAP_03_F",
			"C_Kart_01_Blu_F",
			"B_MRAP_01_F",
			"B_Heli_Light_01_F",
			"O_Heli_Light_02_unarmed_F",
			"I_Heli_light_03_unarmed_F",
			"B_Quadbike_01_F",
			"B_Truck_01_mover_F",
			"C_Van_01_box_F",
			"O_Truck_02_box_F",
			"O_Truck_03_repair_F",
			"C_Rubberboat",
			"C_Heli_Light_01_civil_F",
			"O_Heli_Transport_04_F",
			"O_Heli_Transport_04_medevac_F",
			"C_Boat_Civil_01_police_F",
			"B_SDV_01_F"	
			]) then {
                if(!isNil {vehicle player getVariable "lights"}) then {
                [vehicle player] call avanix_fnc_medicsirenLights;
                _handled = true;
                };
            };
        };
        if(!_alt && !_ctrlKey) then { [] call avanix_fnc_radar; };
    };
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call avanix_fnc_p_openMenu;
		};
	};
	
	//EMP Konsole - K
    case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["C_Heli_Light_01_civil_F","I_Heli_light_03_unarmed_F","B_Heli_Transport_03_unarmed_F"])) then
        {
            [] call avanix_fnc_openEmpMenu; [_this] call avanix_fnc_isEmpOperator;
        };
    };
	
	//F Key
	case 33:
	{
		if(_ctrlKey) then
		{
			if(playerSide == west && vehicle player != player && !avanix_yelp_active && ((driver vehicle player) == player)) then
			{
				[] spawn
				{
					avanix_yelp_active = true;
					uisleep 1.1;
					avanix_yelp_active = false;
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "yelp"}) then {_veh setVariable["yelp",false,true];};
				if((_veh getVariable "yelp")) then
				{
					titleText ["Ansage Aus","PLAIN"];
					_veh setVariable["yelp",false,true];
				}
					else
				{
					titleText ["Ansage An","PLAIN"];
					_veh setVariable["yelp",true,true];
					[[_veh],"avanix_fnc_copYelp",nil,true] spawn avanix_fnc_MP;
				};
			};
		};
		if(_shift) then
		{
			if(playerSide in [west,independent] && vehicle player != player && !avanix_siren2_active && ((driver vehicle player) == player)) then
			{
				[] spawn
				{
					avanix_siren2_active = true;
					uisleep 4.7;
					avanix_siren2_active = false;
				};
					_veh = vehicle player;
					if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
				if((_veh getVariable "siren2")) then
					{
						titleText ["Sirene 2 Aus","PLAIN"];
						_veh setVariable["siren2",false,true];
					}
						else
					{
						titleText ["Sirene 2 An","PLAIN"];
						_veh setVariable["siren2",true,true];
						if(playerSide == west) then {
						[[_veh],"avanix_fnc_copSiren2",nil,true] spawn avanix_fnc_MP;
					} else {
						[[_veh],"avanix_fnc_medicSiren2",nil,true] spawn avanix_fnc_MP;
					};
				};
			};
		};
		if (!_shift && !_ctrlKey) then
		{
			if(playerSide in [west,independent] && vehicle player != player && !avanix_siren_active && ((driver vehicle player) == player)) then
			{
				[] spawn
				{
					avanix_siren_active = true;
					uisleep 4.7;
					avanix_siren_active = false;
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
				if((_veh getVariable "siren")) then
				{
					titleText ["Sirene AUS","PLAIN"];
					_veh setVariable["siren",false,true];
				}
					else
				{
					titleText ["Sirene AN","PLAIN"];
					_veh setVariable["siren",true,true];
					if(playerSide == west) then {
						[[_veh],"avanix_fnc_copSiren",nil,true] spawn avanix_fnc_MP;
					} else {
						[[_veh],"avanix_fnc_medicSiren",nil,true] spawn avanix_fnc_MP;
					};
				};
			};
		};
	};
	//U Key
	case 22:
    {
        if(!_alt && !_ctrlKey) then {
            if(vehicle player == player) then {
                _veh = cursorTarget;
            } else { 
                _veh = vehicle player;
            };
            
            if(_veh isKindOf "House_F" && playerSide == civilian) then {
                if(_veh in avanix_vehicles && player distance _veh < 8) then {
                    _door = [_veh] call avanix_fnc_nearestDoor;
                    if(_door == 0) exitWith {hint "Du bist nicht in der Nähe einer Tür!"};
                    _locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
                    if(_locked == 0) then {
                        _veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
                        _veh animate [format["door_%1_rot",_door],0];
                        systemChat "Du hast die Tür zugeschlossen.";
						hint composeText [ image "textures\icons\lock.paa", "  Haus abgeschlossen" ];
						player say3D "house_lock";
                    } else {
                        _veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
                        _veh animate [format["door_%1_rot",_door],1];
                        systemChat "Du hast die Tür aufgeschlossen.";
						hint composeText [ image "textures\icons\unlock.paa", "  Haus aufgeschlossen" ];
						player say3D "house_unlock"
                    };
                };
            } else {
                _locked = locked _veh;
            
            if(_veh in avanix_vehicles && player distance _veh < 8) then
            {
                if(_locked == 2) then
                {
                    if(local _veh) then
                    {
                        _veh lock 0;
                        _veh animateDoor ["door_back_R",1];
                        _veh animateDoor ["door_back_L",1];
                            _veh animateDoor ['door_R',1]; 
                            _veh animateDoor ['door_L',1];
                            _veh animateDoor ['Door_rear',1];
                            _veh animateDoor ['Door_LM',1];
                            _veh animateDoor ['Door_RM',1];
                            _veh animateDoor ['Door_LF',1];
                            _veh animateDoor ['Door_RF',1];
                            _veh animateDoor ['Door_LB',1];
                            _veh animateDoor ['Door_RB',1];
                    }
                        else 
                    {
                        [[_veh,0], "avanix_fnc_lockVehicle",_veh,false] spawn avanix_fnc_MP;
                        _veh animateDoor ["door_back_R",1];
                        _veh animateDoor ["door_back_L",1];
                            _veh animateDoor ['door_R',1]; 
                            _veh animateDoor ['door_L',1];
                            _veh animateDoor ['Door_rear',1];
                            _veh animateDoor ['Door_LM',1];
                            _veh animateDoor ['Door_RM',1];
                            _veh animateDoor ['Door_LF',1];
                            _veh animateDoor ['Door_RF',1];
                            _veh animateDoor ['Door_LB',1];
                            _veh animateDoor ['Door_RB',1];
                    };
                    hint composeText [ image "textures\icons\unlock.paa", "  Fahrzeug aufgeschlossen" ];
                    player say3D "car_unlock";
                    
                }
                    else 
                {
                    if(local _veh) then
                    {
                        _veh lock 2;
                        _veh animateDoor ["door_back_R",0];
                        _veh animateDoor ["door_back_L",0];
                            _veh animateDoor ['door_R',0]; 
                            _veh animateDoor ['door_L',0];
                            _veh animateDoor ['Door_rear',0];
                            _veh animateDoor ['Door_LM',0];
                            _veh animateDoor ['Door_RM',0];
                            _veh animateDoor ['Door_LF',0];
                            _veh animateDoor ['Door_RF',0];
                            _veh animateDoor ['Door_LB',0];
                            _veh animateDoor ['Door_RB',0];
                    }
                        else 
                    {
                        [[_veh,2], "avanix_fnc_lockVehicle",_veh,false] spawn avanix_fnc_MP;
                        _veh animateDoor ["door_back_R",0];
                        _veh animateDoor ["door_back_L",0];
                            _veh animateDoor ['door_R',0]; 
                            _veh animateDoor ['door_L',0];
                            _veh animateDoor ['Door_rear',0];
                            _veh animateDoor ['Door_LM',0];
                            _veh animateDoor ['Door_RM',0];
                            _veh animateDoor ['Door_LF',0];
                            _veh animateDoor ['Door_RF',0];
                            _veh animateDoor ['Door_LB',0];
                            _veh animateDoor ['Door_RB',0];
                    };
                    
                    hint composeText [ image "textures\icons\lock.paa", "  Fahrzeug abgeschlossen" ];
                    player say3D "car_lock";
                
                    };
                };
            };
        };
    };
	// O, police gate opener
    case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call avanix_fnc_copOpener;
		};
		
		if (!_shift && !_alt && !_ctrlKey && (playerSide == independent) && (vehicle player != player)) then {
			[] call avanix_fnc_copOpener;
		};
		if(_shift) then 
		{
			if(!(playerSide == civilian)) then 
			{
				_cntObjs = count nearestObjects [player, ["Land_Net_Fence_Gate_F"], 35];
				if(_cntObjs > 0) then 
				{
					_objs = nearestObjects [player, ["Land_Net_Fence_Gate_F"], 35];
					_obj = _objs select 0;
					if(playerSide == west OR playerSide == independent) then 
					{
						if(_obj in [police_gate_1,police_gate_2,police_gate_3,police_gate_4,police_gate_5,police_gate_6,buero_gate_1,bank_gate_1,feuerwehr_gate_1]) then {[_obj,10] execVM "core\avanix\misc\policeGate.sqf";} else {hint"Du kannst dieses Tor nicht oeffnen.";};
					};
				};
			};
		};
	};
	// Tab KEY
	case 15: 
	{
		if (!_shift && !_alt && !_ctrlKey) then {
			if(avanix_snd_vol > 0) then {
				avanix_snd_vol = 0;
				2 fadeSound 0.9;
				systemChat "Lautstaerke: 90%";				
			} else {
				avanix_snd_vol = 1;
				2 fadeSound 0.18;
				systemChat "Lautstaerke: 20%";
			};
		};
	};
	//Hi
	case 79:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{	
			cutText [format["Hi!"], "PLAIN DOWN"];
			player playActionNow "gestureHi";
		};
    };
	//Hallo
	case 80:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Hallo!"], "PLAIN DOWN"];
			player playMove "Acts_PercMstpSlowWrflDnon_handup1b";
		};
    };
	//Hier
	case 81:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Hier!"], "PLAIN DOWN"];
			player playMove "Acts_PercMstpSlowWrflDnon_handup1";
		};
    };
	//Hilfe
	case 75:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Hilfe!"], "PLAIN DOWN"];
			player playMove "Acts_PercMstpSlowWrflDnon_handup2";
		};
    };
	//Stop
	case 76:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Stop!"], "PLAIN DOWN"];
			player playMove "Acts_PercMstpSlowWrflDnon_handup2b";
		};
    };
	
	case 59: // F1
	{
		_handled = false;
	};

	case 60:
	{
		_handled = false;
	};
			
	case 61: // F3
	{
		_handled = false;
	};

	case 63: // F5
	{
		_handled = false;
	};

	case 64: //F6 key 
	{
		_handled = false;
	};

	case 65: // F7 Key
	{
		_handled = false;
	};

	case 66: //F8 key 
	{
		_handled = false;
	};
	case 67: //F9 key 
	{
		_handled = false;
	};

	case 68: //F10 key 
	{
		_handled = false;
	};
	
	case 87: //F11 key 
	{
		_handled = false;
	};
	
	case 88: //F12 key 
	{
		_handled = false;
	};
	
	case 83: //Commander key 
	{
		_handled = false;
	};
	
	case 41: //Zirkumflex
	{
		_handled = true;
	};
	
	case 70: //Scrollrad
	{
		_handled = true;
	};
	
	// Rollenspielflucht STRG+ALT+ENTF - STRG+ESC - STRG+ALT+ENTF
	case 62:
	{
		closeDialog 0;
		hintc "Diese Taste wurde vom System blockiert";
		_handled = false;
		if(_ctrlKey && _alt)  then 
		{
			diag_log format ["SERVER INFO: %1 hat ALT + F4 gedrückt um aus dem Rollenspiel zu flüchten!",_player getVariable["realname",name _player]];
			[[1,format["SERVER INFO: %1 hat ALT + F4  gedrückt um aus dem Rollenspiel zu flüchten!",_player getVariable["realname",name _player]]],"avanix_fnc_broadcast",nil,false] spawn avanix_fnc_MP;
			[] call SOCK_fnc_syncData;
		};
    };
	case 211:
    {
		closeDialog 0;
		hintc "Diese Taste wurde vom System blockiert";
		_handled = false;
		if(_ctrlKey && _alt)  then 
		{
			diag_log format ["SERVER INFO: %1 hat CTRL + ALT + DEL gedrückt um aus dem Rollenspiel zu flüchten!",_player getVariable["realname",name _player]];
			[[1,format["SERVER INFO: %1 hat CTRL + ALT + DEL  gedrückt um aus dem Rollenspiel zu flüchten!",_player getVariable["realname",name _player]]],"avanix_fnc_broadcast",nil,false] spawn avanix_fnc_MP;
			[] call SOCK_fnc_syncData;
		};
    };
};

_handled;