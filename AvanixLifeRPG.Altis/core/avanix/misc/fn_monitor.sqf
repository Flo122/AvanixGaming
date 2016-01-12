/*
Player Status Bar with Icons v 1.36
Author: Dart_Rogue
Mod: Epoch
https://github.com/DarthRogue/Status_Bar
Transfered to Altis Life + add   SBUserhy
*/
if (!hasInterface && !isDedicated) then {exitwith{};};

waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
4 cutRsc ["osefStatusBar","PLAIN"]; 
[] spawn {
    uisleep 2;
        _counter = 360;
        _timeSinceLastUpdate = 0;
        _colourDefault  = parseText "#ADADAD"; //set your default colour here
		_colour100 		= parseText "#33FF00"; //Dunkelgrün
		_colour90 		= parseText "#33FF00"; //Dunkelgrün
		_colour80 		= parseText "#33FF00"; //Dunkelgrün
		_colour70 		= parseText "#33FF00"; //Dunkelgrün
		_colour60 		= parseText "#66FF00"; //Grün
		_colour50 		= parseText "#CCFF00"; //Dunkelgelb
		_colour40 		= parseText "#FFFF00"; //Gelb
		_colour30 		= parseText "#FFFF00"; //Gelb
		_colour20 		= parseText "#CC0000"; //Rot
		_colour10 		= parseText "#CC0000"; //Rot
		_colour0 		= parseText "#CC0000"; //Rot
		_colourDead 	= parseText "#000000"; //Schwarz
        //_colourUpTimeHUD  = parseText "#CCCCCC";
while {true} do 
	{
		uisleep 1;
		//moved the creation of the status bar inside the loop and create it if it is null,
		//this is to handle instance where the status bar is disappearing 
		if(isNull ((uiNamespace getVariable "statusBar")displayCtrl 55555)) then
		{
			diag_log "statusbar is null create";
			disableSerialization;
			4 cutRsc ["osefStatusBar","PLAIN"];
		};
        //initialize variables and set values
        //neu
        _CivplayHUD = civilian countSide playableUnits;
        _WestplayHUD = west countSide playableUnits;
        _IndepplayHUD = independent countSide playableUnits;
        _EastplayHUD = east countSide playableUnits;
        _grid = mapGridPosition  player;
        _xx = (format[_grid]) select  [0,3];
        _yy = (format[_grid]) select  [3,3];
        _hunger = round(avanix_hunger);
        _thirst = round(avanix_thirst);
        _damage = round ((1 - (damage player)) * 100);
        _FpsHud = round (diag_fps);
        _stamina = round(getFatigue player * 100) / 100;
		_carryWeight = avanix_carryWeight;
		_maxWeight = avanix_maxWeight;
		_sec = ceil ((6 * 3600)-servertime);
        _UpTimeHUD = [_sec,"HH:MM:SS"] call BIS_fnc_secondsToString;
        //neu ende
		_toxPercent = round(avanix_thirst);
		_energy = round(avanix_thirst);
		_energyPercent =  floor((_energy / 2500 ) * 100);
		_players = (count playableUnits -1);
        //Colour coding
		//Hunger
		_colourHunger = _colourDefault;
		switch true do {
			case(_hunger == 100) : {_colourHunger = _colour70;};
			case((_hunger >= 90) && (_hunger < 100)) :  {_colourHunger =  _colour70;};
			case((_hunger >= 80) && (_hunger < 90)) :  {_colourHunger =  _colour70;};
			case((_hunger >= 70) && (_hunger < 80)) :  {_colourHunger =  _colour70;};
			case((_hunger >= 60) && (_hunger < 70)) :  {_colourHunger =  _colour60;};
			case((_hunger >= 50) && (_hunger < 60)) :  {_colourHunger =  _colour50;};
			case((_hunger >= 40) && (_hunger < 50)) :  {_colourHunger =  _colour40;};
			case((_hunger >= 30) && (_hunger < 40)) :  {_colourHunger =  _colour30;};
			case((_hunger >= 20) && (_hunger < 30)) :  {_colourHunger =  _colour20;};
			case((_hunger >= 10) && (_hunger < 20)) :  {_colourHunger =  _colour10;};
			case((_hunger >= 1) && (_hunger < 10)) :  {_colourHunger =  _colour0;};
			case(_hunger < 1) : {_colourHunger =  _colourDead;};
		};
		//Thirst
		_colourThirst = _colourDefault;		
		switch true do{
			case(_thirst == 100) : {_colourThirst = _colour70;};
			case((_thirst >= 90) && (_thirst < 100)) :  {_colourThirst =  _colour70;};
			case((_thirst >= 80) && (_thirst < 90)) :  {_colourThirst =  _colour70;};
			case((_thirst >= 70) && (_thirst < 80)) :  {_colourThirst =  _colour70;};
			case((_thirst >= 60) && (_thirst < 70)) :  {_colourThirst =  _colour60;};
			case((_thirst >= 50) && (_thirst < 60)) :  {_colourThirst =  _colour50;};
			case((_thirst >= 40) && (_thirst < 50)) :  {_colourThirst =  _colour40;};
			case((_thirst >= 30) && (_thirst < 40)) :  {_colourThirst =  _colour30;};
			case((_thirst >= 20) && (_thirst < 30)) :  {_colourThirst =  _colour20;};
			case((_thirst >= 10) && (_thirst < 20)) :  {_colourThirst =  _colour10;};
			case((_thirst >= 1) && (_thirst < 10)) :  {_colourThirst =  _colour0;};
			case(_thirst < 1) : {_colourThirst =  _colourDead;};
		};
        //Damage
		_colourDamage = _colourDefault;
		switch true do {
			case(_damage == 100) : {_colourDamage = _colour70;};
			case((_damage >= 90) && (_damage < 100)) : {_colourDamage =  _colour70;};
			case((_damage >= 80) && (_damage < 90)) : {_colourDamage =  _colour70;};
			case((_damage >= 70) && (_damage < 80)) : {_colourDamage =  _colour70;};
			case((_damage >= 60) && (_damage < 70)) : {_colourDamage =  _colour60;};
			case((_damage >= 50) && (_damage < 60)) : {_colourDamage =  _colour50;};
			case((_damage >= 40) && (_damage < 50)) : {_colourDamage =  _colour40;};
			case((_damage >= 30) && (_damage < 40)) : {_colourDamage =  _colour30;};
			case((_damage >= 20) && (_damage < 30)) : {_colourDamage =  _colour20;};
			case((_damage >= 10) && (_damage < 20)) : {_colourDamage =  _colour10;};
			case((_damage >= 1) && (_damage < 10)) : {_colourDamage =  _colour0;};
			case(_damage < 1) : {_colourDamage =  _colourDead;};
		};
        //CarryWeight
		_colourBackpack = _colourDefault;
		switch true do {
			case((_carryWeight / _maxWeight) < 0.1) : {_colourBackpack = _colour70;};
			case(((_carryWeight / _maxWeight) >= 0.1) && ((_carryWeight / _maxWeight) < 0.5)) :  {_colourBackpack =  _colour70;};
			case(((_carryWeight / _maxWeight) >= 0.5) && ((_carryWeight / _maxWeight) < 0.8)) :  {_colourBackpack =  _colour30;};
			case((_carryWeight / _maxWeight) >= 0.8) : {_colourBackpack = _colour0;};
		};
        //FPS
        _colourFps = _colourDefault;
        switch true do {
			case(_FpsHud >= 50) : {_colourFps = _colour70;};
			case((_FpsHud >= 30) && (_FpsHud < 50)) : {_colourFps =  _colour30;};
			case((_FpsHud >= 1) && (_FpsHud < 30)) : {_colourFps =  _colour0;};
			case(_FpsHud < 1) : {_colourFps =  _colourDead;};
		};
		//Time
        _colourUpTimeHUD = _colourDefault;
        switch true do {
			case((_sec / 60) >= 60) : {_colourUpTimeHUD = parseText "#CCCCCC";};
			case(((_sec / 60) >= 30) && ((_sec / 60) < 60)) : {_colourUpTimeHUD =  _colour50;};
			case((_sec / 60) < 30) : {_colourUpTimeHUD =  _colour0;};
		};
    ((uiNamespace getVariable "osefStatusBar")displayCtrl 555556)ctrlSetStructuredText parseText 
            format["<t shadow='1' shadowColor='#000000'><img size='1.6' shadowColor='#000000' image='textures\statusbar\players.paa' color='#FFFFFF'/>%1 <img size='1.6' shadowColor='#000000' image='textures\statusbar\players.paa' color='#3399FF'/>%2 <img size='1.6' shadowColor='#000000' image='textures\statusbar\players.paa' color='#009933'/>%3 <img size='1.6' shadowColor='#000000' image='textures\statusbar\players.paa' color='#CC0000'/>%4  <img size='1.6' shadowColor='#000000' image='textures\statusbar\ico_map.paa'/>%5 <img size='1.6' shadowColor='#000000' image='textures\statusbar\hunger.paa' color='%7'/>%6 <img size='1.6' shadowColor='#000000' image='textures\statusbar\thirst.paa' color='%9'/>%8 <img size='1.6' shadowColor='#000000' image='textures\statusbar\damage.paa' color='%11'/>%10 <img size='1.6' shadowColor='#000000' image='textures\statusbar\backpack.paa' color='%13'/>%12 <img size='1.6' shadowColor='#000000' image='textures\statusbar\monitor_fps.paa' color='%15'/>%14 <img size='1.6'  shadowColor='#000000' image='textures\statusbar\restart.paa' color='%17'/>%16</t>",_CivplayHUD,_WestplayHUD,_IndepplayHUD,_EastplayHUD, format["%1/%2",_xx,_yy], _hunger, _colourHunger, _thirst, _colourThirst, _damage, _colourDamage, format["%1/%2",_carryWeight,_maxWeight], _colourBackpack, _FpsHud, _colourFps, _UpTimeHUD, _colourUpTimeHUD,_players,_energyPercent,_colourDefault];
    }; 
};