/*
	File: antiside.sqf
	Author: Tonic Broadwide
*/
private["_tor","_time","_pos","_check","_torarlarm"];
_tor = _this select 0;
_time = _this select 1;
_pos = getPos _tor;
_check = 0;
if(_tor getVariable "doorInUse") exitWith {};

	if(_tor == p_g_1) then
	{
		_tor setVariable["doorInUse",true,true];
		if((_tor animationPhase "Door_1_rot") == 1) then
		{
			hint"Schranke wird in 10 Sekunden geschlossen";
			uisleep _time;
			_tor animate ["Door_1_rot", 0];
		} 
		else
		{
			_tor animate ["Door_1_rot", 1];
			uisleep _time;
			_tor animate ["Door_1_rot", 0];
		};
		if (_tor == p_g_1) exitWith {_check = 1;_tor setVariable["doorInUse",false,true];};
	}
	else
	{
		_tor setVariable["doorInUse",true,true];
		_tor setVariable["bis_disabled_Door_1",0,true];
		_tor setVariable["bis_disabled_Door_2",0,true];
		if(((_tor animationPhase "Door_1_rot") == 1) && ((_tor animationPhase "Door_2_rot") == 1)) then
		{
			hint"Tor wird in 10 Sekunden geschlossen";
			uisleep _time;
			_tor animate ["Door_1_rot", 0];
			_tor animate ["Door_2_rot", 0];
		}
		else
		{
			_tor setVariable["doorInUse",true,true];
			if(((_tor animationPhase "Door_1_rot") == 0) && ((_tor animationPhase "Door_2_rot") == 1)) exitWith
			{
				_check = 1;
				_tor animate ["Door_1_rot", 1];
				uisleep _time;
				_tor animate ["Door_1_rot", 0];
				_tor animate ["Door_2_rot", 0];
				_tor setVariable["bis_disabled_Door_1",1,true];
				_tor setVariable["bis_disabled_Door_2",1,true];
				_tor setVariable["doorInUse",false,true];
			};
			if(((_tor animationPhase "Door_1_rot") == 1) && ((_tor animationPhase "Door_2_rot") == 0)) exitWith
			{
				_check = 1;
				_tor animate ["Door_2_rot", 1];
				uisleep _time;
				_tor animate ["Door_1_rot", 0];
				_tor animate ["Door_2_rot", 0];
				_tor setVariable["bis_disabled_Door_1",1,true];
				_tor setVariable["bis_disabled_Door_2",1,true];
				_tor setVariable["doorInUse",false,true];
			};
			_tor animate ["Door_1_rot", 1];
			_tor animate ["Door_2_rot", 1];
			uisleep _time;
			_tor animate ["Door_1_rot", 0];
			_tor animate ["Door_2_rot", 0];
		};
		if(_check == 1) exitWith {};
		_tor setVariable["bis_disabled_Door_1",1,true];
		_tor setVariable["bis_disabled_Door_2",1,true];
		_tor setVariable["doorInUse",false,true];
	};