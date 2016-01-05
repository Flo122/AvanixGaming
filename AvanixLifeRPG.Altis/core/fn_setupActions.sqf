/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		avanix_actions = [player addAction["Fischernetz auswerfen",avanix_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && avanix_carryWeight < avanix_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !avanix_net_dropped ']];
		
		//Rob person
		avanix_actions = avanix_actions + [player addAction["Ausrauben",avanix_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		
		// take them organs
		avanix_actions = avanix_actions + [player addAction["Organe stehlen",avanix_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
	
		//Speedtrap hacking
        avanix_actions = avanix_actions + [player addAction["<t color='#FF0000'>Daten hacken</t>",avanix_fnc_speedtrapHack,0,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];
	};
	
	case west:
	{
		//Seize Objects
		avanix_actions = avanix_actions + [player addAction["Gegenstände beschlagnahmen",avanix_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
		
		//Blitzer
        avanix_actions = avanix_actions + [player addAction["<t color='#FF0000'>Einschalten</t>",avanix_fnc_speedtrapActivate,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && !(cursorTarget getVariable["speedtrap_active", false]) && (cursorTarget getVariable["speedtrap_registered", false]) ']];

        avanix_actions = avanix_actions + [player addAction["<t color='#FF0000'>Ausschalten</t>",avanix_fnc_speedtrapActivate,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_active", false]) && (cursorTarget getVariable["speedtrap_registered", false]) ']];
        
        avanix_actions = avanix_actions + [player addAction["<t color='#FF0000'>Film rausholen</t>",avanix_fnc_speedtrapGetPhotoList,1,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];
        
        avanix_actions = avanix_actions + [player addAction["<t color='#FF0000'>Daten anschauen</t>",avanix_fnc_speedtrapGetPhotoList,0,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];
        
        avanix_actions = avanix_actions + [player addAction["<t color='#FF0000'>Geschwindigkeit setzen</t>",avanix_fnc_speedtrapSetSpeedLimit,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];

        avanix_actions = avanix_actions + [player addAction["<t color='#FF0000'>Abbauen</t>",avanix_fnc_speedtrapRemove,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];
	};
	
	case independent:
	{		
	};
};