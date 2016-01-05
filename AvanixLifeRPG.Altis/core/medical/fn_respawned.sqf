/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
avanix_use_atm = TRUE;
avanix_hunger = 100;
avanix_thirst = 100;
avanix_carryWeight = 0;
avanix_cash = 0; //Make sure we don't get our cash back.
avanix_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

avanix_corpse setVariable["Revive",nil,TRUE];
avanix_corpse setVariable["name",nil,TRUE];
avanix_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn avanix_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn avanix_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn avanix_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull avanix_corpse) then {
	private["_containers"];
	avanix_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[avanix_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody avanix_corpse;
};

//Destroy our camera...
avanix_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy avanix_deathCamera;

//Bad boy
if(avanix_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	avanix_is_arrested = false;
	[player,TRUE] spawn avanix_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "avanix_copRecieve") then {
	[[player,avanix_copRecieve,true],"avanix_fnc_wantedBounty",false,false] spawn avanix_fnc_MP;
	avanix_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(avanix_removeWanted) then {
	[[getPlayerUID player],"avanix_fnc_wantedRemove",false,false] spawn avanix_fnc_MP;
};

[] call SOCK_fnc_updateRequest;
[] call avanix_fnc_hudUpdate; //Request update of hud.