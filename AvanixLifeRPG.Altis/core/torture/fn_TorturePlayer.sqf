/*
	Tortures the player
	Edit: Avanix Gaming Community
*/
private["_unit","_rand","_damage", "_fatigue"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(playerSide == west) exitWith {};
if(avanix_action_inUse) exitWith {};

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Du kannst die Person nicht foltern."};

avanix_action_inUse = true;

_rand = [0,4] call avanix_fnc_randomRound;


switch(_rand) do 
{
	case 0:
	{
		hintSilent "Du hast dem Spieler in den Magen geschlagen.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.07;
		
		if(_damage >= 1) then { _damage = 0.95; };
		
		_unit setDamage _damage;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.2;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		
		_unit setFatigue _fatigue;
		
		[player,"punch"] call avanix_fnc_globalSound;
	};
	case 1:
	{
		hintSilent "Du hast dem Spieler ins Gesicht geschlagen.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.1;
		
		if(_damage >= 1) then { _damage = 0.98; };
		
		_unit setDamage _damage;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.25;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		
		[player,"punch"] call avanix_fnc_globalSound;

	};
	case 2:
	{
		hintSilent "Du hast den Spieler getreten.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.11;
		
		if(_damage >= 1) then { _damage = 0.98; };
		
		_unit setDamage _damage;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.1;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		
		[cursorTarget] spawn avanix_fnc_knockoutAction;
		[player,"punch_break"] call avanix_fnc_globalSound;
	};
	case 3:
	{
		hintSilent "Du hast dem Spieler in eine sensible Stelle getreten.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.5;
		
		if(_damage >= 1) then { _damage = 0.99; };
		
		_unit setDamage _damage;
		
		_unit setFatigue 1;
		
		[player,"punch_balls"] call avanix_fnc_globalSound;
	};
	default
	{
		hintSilent "Du hast dem Spieler einige Zähne ausgeschlagen.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.1;
		
		if(_damage >= 1) then { _damage = 0.98; };
		
		_unit setDamage _damage;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.1;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		
		[cursorTarget] spawn avanix_fnc_knockoutAction;
		[player,"punch"] call avanix_fnc_globalSound;
	};
};

avanix_action_inUse = false;
[[getPlayerUID player,name player,"208"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
