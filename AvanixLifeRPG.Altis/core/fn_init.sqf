#include <macro.h>
/*
	Master client initialization file
*/
avanix_firstSpawn = true;
avanix_session_completed = false;
private["_handle","_timeStamp"];
["1,3","#B40404","::Avanix Client::"," Erstelle Client bitte warten..."] call TON_fnc_showMsg;

/*
[1,"1,3","#B40404","::Life Client::"," Variables initialized"] call TON_fnc_showMsg;
sleep 20;
[2,"Test","Test","::Life Client::"," Variables initialized"] call TON_fnc_showMsg;
sleep 20;
*/

_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Avanix Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";
//Setup initial client core functions
diag_log "::Avanix Client:: Initialisiere Variablen";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Avanix Client:: Variablen Initialisiert";
diag_log "::Avanix Client:: Erstelle Eventhandlers";
[] call avanix_fnc_setupEVH;
["1,3","#B40404","::Avanix Client::"," Erstelle Eventhandlers abgeschlossen"] call TON_fnc_showMsg;
diag_log "::Avanix Client:: Erstelle Eventhandlers abgeschlossen";
diag_log "::Avanix Client:: Erstelle Spieler Aktionen";
[] call avanix_fnc_setupActions;
[] spawn avanix_fnc_fuelConfig;
[] spawn avanix_fnc_initFuelAction; 
diag_log "::Avanix Client:: Spieler Aktionen erstellt";
diag_log "::Avanix Client:: Warte auf Server-Funktionen...";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::Avanix Client:: Server Funktionen geladen.";
["1,3","#B40404","::Avanix Client::"," Warte bis der Server bereit ist..."] call TON_fnc_showMsg;
diag_log "::Avanix Client:: Warte bis der Server bereit ist...";
waitUntil{!isNil "avanix_server_isReady"};
waitUntil{(avanix_server_isReady OR !isNil "avanix_server_extDB_notLoaded")};
if(!isNil "avanix_server_extDB_notLoaded") exitWith {
	diag_log "::Avanix Client:: Server hat extDB2 nicht geladen";
    ["1,3","#B40404","::Avanix Client::"," Offenbar gibt es ein Problem mit extDB2, bitte informiere einen Admin. TS3: ts.avanix-gaming.de"] call TON_fnc_showMsg;
	999999 cutFadeOut 99999999;
};
[] call SOCK_fnc_dataQuery;
waitUntil {avanix_session_completed};
["1,3","#B40404","::Avanix Client::","Client-Setup-Prozedur fertig gestellt"] call TON_fnc_showMsg;


//diag_log "::Avanix Client:: Group Base Execution";
[] spawn avanix_fnc_escInterupt;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn avanix_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	
	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn avanix_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	
	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn avanix_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

enableSentences false;
enableRadio false;
0 fadeRadio 0;

setViewDistance 1000;
setObjectViewDistance [835,50];
setTerrainGrid 45;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["missingOrgan",false,true];
player setVariable["hasOrgan",false,true];
diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
[] execFSM "core\fsm\paycheck.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call avanix_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Avanix Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
avanix_sidechat = true;
[[player,avanix_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn avanix_fnc_MP;
0 cutText ["","BLACK IN"];
[] call avanix_fnc_hudSetup;
avanix_ID_PlayerTags = ["avanix_PlayerTags","onEachFrame","avanix_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
avanix_ID_RevealObjects = ["avanix_RevealObjects","onEachFrame","avanix_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call avanix_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
avanix_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

avanix_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	avanix_atmcash = avanix_atmcash + _price;
";

avanix_fnc_massFix = compileFinal
"
	_vehicle = _this;
	switch (typeOf _vehicle) do
	{
		case 'C_SUV_01_F': {_vehicle setCenterOfMass [-0.010813,-0.506166,-0.7];};
	};
";

[] execVM "core\init_survival.sqf";

_handle = [] spawn compile PreprocessFileLineNumbers "core\avanix\init.sqf";

enableSentences false;
enableRadio false;
0 fadeRadio 0;

//Make Friends on the Server
east setFriend [west, 1];
east setFriend [independent, 1];
west setFriend [east, 1];
west setFriend [independent, 1];
independent setFriend [west, 1];
independent setFriend [east, 1];

__CONST__(avanix_paycheck,avanix_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(avanix_enableFatigue));