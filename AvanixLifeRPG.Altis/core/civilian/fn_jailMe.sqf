/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time","_sirene"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; //##80

_time = time + (_time * 60); //x Minutes

//if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); }; //##80 (time loaded from DB)

if(count _ret > 0) then { avanix_bail_amount = (_ret select 3); } else { avanix_bail_amount = 20000; /*_time = time + (10 * 60); */};
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Please Report to Admin: JAIL_FALLBACK_15, time is zero!"; };

[_bad,_time] spawn
{
	avanix_canpay_bail = false;
	avanix_bail_amount = avanix_bail_amount * 5;
	if(_this select 0) then
	{
		//uisleep (10 * 60);
		//50% of time
		uisleep ( (_this select 1) * 0.5 );
	}
		else
	{
		//uisleep (5 * 60);
		//20% of time
		uisleep ( (_this select 1) * 0.2 );
	};
	avanix_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 Minute(n)",round(round(_time - time) / 60)]} else {format["%1 Sekunde(n)",round(_time - time)]};
		if(isNil "avanix_canpay_bail") then
		{
			hintSilent format["Zeit verbleibend:\n %1\n\nKann Kaution bezahlen: %3\nKationshöhe: %2€",_countDown,[avanix_bail_amount] call avanix_fnc_numberText];
		}
		else
		{
			hintSilent format["Zeit verbleibend:\n %1\n",_countDown];
		};
		
	};
	
	if(player distance (getMarkerPos "jail_marker") > 180) exitWith
	{
		_esc = true;
	};
	
	if(avanix_bail_paid) exitWith
	{
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{
	
	};
	uisleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		avanix_is_arrested = false;
		avanix_bail_paid = false;
		hint "Du hast eine Kaution hinterlegt und bist jetz frei.";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"avanix_fnc_wantedRemove",false,false] spawn avanix_fnc_MP;
		_toLog = format ["3|%1 (%2) hat die Kaution bezahlt.", name player, getPlayerUID player];
		[[_toLog],"Arma3Log"] call avanix_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		avanix_is_arrested = false;
		hint "Du bist aus dem Gefängnis ausgebrochen, die Cops sind dir auf den Fersen.";

		[[0,format["%1 ist aus dem Gefängnis ausgebrochen!",profileName]],"avanix_fnc_broadcast",nil,false] spawn avanix_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
		_sirene = (nearestObjects [getMarkerPos "sirene_marker_jail", ["Land_Loudspeakers_F"], 10]) select 0;
		[_sirene,"jailbreak"] call avanix_fnc_globalSound;  
		_toLog = format ["3|%1 (%2) ist aus dem Gefängnis ausgebrochen.", name player, getPlayerUID player];
		[[_toLog],"Arma3Log"] call avanix_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		avanix_is_arrested = false;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"avanix_fnc_wantedRemove",false,false] spawn avanix_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		_toLog = format ["3|%1 (%2) hat seine Zeit abgesessen.", name player, getPlayerUID player];
		[[_toLog],"Arma3Log"] call avanix_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
};