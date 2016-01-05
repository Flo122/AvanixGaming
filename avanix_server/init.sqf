[] execVM "\avanix_server\initHC.sqf";

#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#include "\avanix_server\script_macros.hpp"
DB_Async_Active = false;
DB_Async_ExtraLock = false;
avanix_HC_isActive = false;
avanix_server_isReady = false;
publicVariable "avanix_server_isReady";
publicVariable "avanix_HC_isActive";

[] execVM "\avanix_server\functions.sqf";
[] execVM "\avanix_server\eventhandlers.sqf";

_extDB2 = false;

if(isNil {GVAR_UINS "avanix_sql_id"}) then {
	_randomSeq = [12] call DB_fnc_randomSeq;
	avanix_sql_id = _randomSeq;
	CONSTVAR(avanix_sql_id);
	SVAR_UINS ["avanix_sql_id",avanix_sql_id];

	//Retrieve extDB version
	_result = EXTDB_TAG callExtension "9:VERSION";
	diag_log format ["extDB2: Version: %1", _result];
	if(EQUAL(_result,"")) exitWith {EXTDB_FAILED("Die serverseitige Erweiterung -extDB2- wurde nicht geladen, informiere einen Admin.")};
	if ((parseNumber _result) < 64) exitWith {EXTDB_FAILED("Die aktuelle extDB2 Version ist nicht kompatibel mit der AltisLife Version. Benutze Version 64 oder höher")};

	//Initialize connection to Database
	_result = EXTDB_TAG callExtension "9:ADD_DATABASE:AltisLife";
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB2: Fehler mit Datenbankverbindung")};
	_result = EXTDB_TAG callExtension format["9:ADD_DATABASE_PROTOCOL:AltisLife:SQL_CUSTOM_V2:%1:avanixlife",FETCH_CONST(avanix_sql_id)];
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB2: Fehler mit Datenbankverbindung")};
	/* Insert any additional code here for extDB features, the next line will lock extDB */
	EXTDB_TAG callExtension "9:LOCK";
	_extDB2 = true;
	diag_log "extDB2: Verbunden mit Datenbank";
} else {
	avanix_sql_id = GVAR_UINS "avanix_sql_id";
	CONSTVAR(avanix_sql_id);
	_extDB2 = true;
	diag_log "extDB2: Noch verbunden mit Datenbank";
};

//Broadbase PV to Clients, to warn about extDB2 Error.
//	exitWith to stop trying to run rest of Server Code
if (!_extDB2) exitWith {
	avanix_server_extDB2_notLoaded = true;
	publicVariable "avanix_server_extDB2_notLoaded";
	diag_log "extDB2: Error! Check extDB Logs für mehr Informationen";
};

["resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["deleteOldHouses",1] spawn DB_fnc_asyncCall;
["deleteOldGangs",1] spawn DB_fnc_asyncCall;
["deleteDonator",1] spawn DB_fnc_asyncCall;
["deleteDonatorlvl",1] spawn DB_fnc_asyncCall;
["deleteRentHouses",1] spawn DB_fnc_asyncCall;
["updateRentHouses",1] spawn DB_fnc_asyncCall;
//["getGUID",1] spawn DB_fnc_asyncCall;

[8,true,12] execFSM "\avanix_server\FSM\timeModule.fsm";

avanix_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
avanix_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
avanix_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

serv_sv_use = [];

fed_bank setVariable["safe",(count playableUnits),true];
fed_key = round(Random 8999) + 1000;
publicVariable "fed_key";

//General cleanup for clients disconnecting.
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}]; //Do not second guess this, this can be stacked this way.

[] spawn TON_fnc_cleanup;
avanix_gang_list = [];
publicVariable "avanix_gang_list";
avanix_wanted_list = [];
client_session_list = [];

[] execFSM "\avanix_server\FSM\cleanup.fsm";


[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		uisleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn TON_fnc_federalUpdate;

[] spawn
{
	while {true} do
	{
		uisleep (30 * 60);
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2];
	};
};

//Strip NPC's of weapons
{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[] spawn TON_fnc_initHouses;
[] spawn TON_fnc_initHideout;
[] spawn TON_fnc_initAsservatenkammer;

//Lockup the dome
private["_bank","_rsb","_lab"];
_bank = nearestObject [[16764.125,9.5662584,0],"Land_Offices_01_V1_F"];
_lab = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];

for "_i" from 1 to 5 do {_bank setVariable[format["bis_disabled_Door_%1",_i],1,true]; _bank animate [format["Door_%1_rot",_i],0];};
for "_i" from 1 to 3 do {_lab setVariable[format["bis_disabled_Door_%1",_i],1,true]; _lab animate [format["Door_%1_rot",_i],0];};
_bank allowDamage false;
_lab allowDamage false;

[] execVM "\avanix_server\Functions\RandomDealer\fn_randomDealer.sqf";
[] execVM "\avanix_server\Functions\Airdrop\fn_config.sqf";
[] execVM "\avanix_server\Functions\Airdrop\fn_generateAirdropAuto.sqf";

pb_spieler = [];
pb_spielstatus = 0;
pb_maxspieler = 10;
execVM "\avanix_server\Functions\paintball\arena_paintball.sqf";

avanix_server_isReady = true;
publicVariable "avanix_server_isReady";