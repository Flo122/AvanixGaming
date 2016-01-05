[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food = 
	{
		if(avanix_hunger < 2) then {player setDamage 1; hint "Du bist verhungert.";}
		else
		{
		avanix_hunger = avanix_hunger - 10;
		[] call avanix_fnc_hudUpdate;
		if(avanix_hunger < 2) then {player setDamage 1; hint "Du bist verhungert.";};
		switch(avanix_hunger) do {
			case 30: {hint "Du hast schon eine Weile nichts mehr gegessen, du solltest schnell etwas zum Essen suchen!";};
			case 20: {hint "Du hast Hunger, du solltest schnell etwas essen oder du wirst verhungern.";};
			case 10: {hint "Du bist am Verhungern, du wirst sterben, wenn du nichts zum Essen findest";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(avanix_thirst < 2) then {player setDamage 1; hint "Du bist verdurstet.";}
		else
		{
			avanix_thirst = avanix_thirst - 10;
			[] call avanix_fnc_hudUpdate;
			if(avanix_thirst < 2) then {player setDamage 1; hint "Du bist verdurstet.";};
			switch(avanix_thirst) do 
			{
				case 30: {hint "Du hast schon eine Weile nichts mehr getrunken, du solltest schnell etwas zum Trinken suchen.";};
				case 20: {hint "Du hast Durst, du solltest schnell etwas trinken oder du wirst verdursten."; player setFatigue 1;};
				case 10: {hint "Du bist am Verdursten, du wirst sterben, wenn du nichts zum Trinken findest."; player setFatigue 1;};
			};
		};
	};
	
	while{true} do
	{
		uisleep 600;
		[] call _fnc_water;
		uisleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		avanix_maxWeight = avanix_maxWeightT + _load;
		if(playerSide in [west,independent,east]) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			avanix_maxWeight = avanix_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		uisleep 1.5;
		if(avanix_carryWeight > avanix_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint "Du trägst zu viel bei dir! Du bist nicht in der Lage, zu rennen oder dich schnell zu bewegen, bis du Gegenstände abgelegt hast!";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		uisleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					avanix_thirst = avanix_thirst - 5;
					avanix_hunger = avanix_hunger - 5;
					[] call avanix_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn  {
    while{true} do
    {
        waitUntil {(player getVariable "missingOrgan")};
        avanix_max_health = .50;
        while{(player getVariable "missingOrgan")} do {
            avanix_thirst =  50;
            avanix_hunger =  50;
            if(damage player < (1 - avanix_max_health)) then {player setDamage (1 - avanix_max_health);};
            "dynamicBlur" ppEffectEnable true;
            "dynamicBlur" ppEffectAdjust [2];
            "dynamicBlur" ppEffectCommit 1;
            uisleep 5;
        };
        "dynamicBlur" ppEffectEnable false;
        avanix_max_health = 1;
    };
};

[] spawn
{
    while {true} do
    {
        private["_damage","_dist"];
        uisleep 1;
        while {((player distance (getMarkerPos "uran_1") < 150) && (player getVariable["Revive",TRUE]))} do
        {
			_dist = player distance (getMarkerPos "uran_1");
            if(uniform player == "U_B_HeliPilotCoveralls") then
            {
                //hint "!!! Du betrittst die Radioaktive Sperrzone !!! Aber dein Schutzanzug schützt dich";
                uisleep 5;
            }else
            {
                //hint "!!! ACHTUNG RADIOAKTIVE ZONE !!! DU KANNST STERBEN, WENN DU KEINEN SCHUTZANZUG AN HAST";
                _damage = damage player;
                _damage = _damage + ( 1 / _dist);
                player setDamage (_damage);
                [] call avanix_fnc_hudUpdate;
                uisleep 5;
            };
        };
    };
};

[] spawn
{
    while {true} do
    {
        private["_geiger","_player","_play","_time","_t1","_t2","_t3","_t4","_t5","_t6","_avg","_display"];
        uisleep 1;
		_t1=0;
		_t2=0;
		_t3=0;
		_t4=0;
		_t5=0;
		_t6=0;
		_avg=100;
		_i=0;
        while {((player distance (getMarkerPos "uran_1") < 250) && (player getVariable["Revive",TRUE]))} do
        {
			_geiger = ["Geiger1","Geiger2"];
			_player = 25;
			_time = 0.5;
			
			if (player distance (getMarkerPos "uran_1") < 10) then {
				_player = 10;
				_play = "Geiger1";
				_time = 0.75;
				if( _i < 5 ) then {playsound _play;};
				uisleep (_time);
				_i = _i + 1;
				hintsilent "!!Achtung!!\nERROR: 0/815\nAußerhalb des Messbereiches!";
			} else {
				_player = player distance (getMarkerPos "uran_1");
				_play = "Geiger2";
				_time = ((_player/250) + random( _player / 250 ));
				playsound _play;
				uisleep (_time);
				_avg = ( _t1 + _t2 + _t3 + _t4 + _t5 + _t6 + (3*_avg)) / 9;
				_t6 = _t5;
				_t5 = _t4;
				_t4 = _t3;
				_t3 = _t2;
				_t2 = _t1;
				_t1 = _time;
				_display = (round(100/(_avg*_avg)))/100;
				_i=0;
				if ((player distance (getMarkerPos "uran_1") < 150)) then 
				{
					hintsilent format["Strahlung entdeckt!\n%1 µSv/h\n Strahlenschutzanzug benötigt!",_display];
				}else{
					hintsilent format["Strahlung entdeckt!\n%1 µSv/h\n ",_display];
				};
			};
			
        };
    };
};