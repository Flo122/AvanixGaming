/*
	Master Avanix Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/

_handle = [] spawn compile PreprocessFileLineNumbers "core\avanix\fuelchanger\configuration.sqf";
diag_log "::Avanix Client:: Initialization Variables fuelchanger";
waitUntil {scriptDone _handle};

_handle = [] spawn compile PreprocessFileLineNumbers "core\avanix\fuelchanger\functions.sqf";
diag_log "::Avanix Client:: Initialization Functions fuelchanger";
waitUntil {scriptDone _handle};

_handle = [] spawn compile PreprocessFileLineNumbers "core\avanix\speedtrap\configuration.sqf";
diag_log "::Avanix Client:: Initialization Variables speedtrap";
waitUntil {scriptDone _handle};

_handle = [] spawn compile PreprocessFileLineNumbers "core\avanix\speedtrap\functions.sqf";
diag_log "::Avanix Client:: Initialization Functions speedtrap";
waitUntil {scriptDone _handle};

/*
waitUntil {(!isNil {avanix_fnc_wantedListPublic_configuration})};
_handle = [] spawn avanix_fnc_wantedListPublic_configuration;
//diag_log "::King Client:: Initialization Variables wantedListPublic";
waitUntil {scriptDone _handle};

waitUntil {(!isNil {avanix_fnc_wantedListPublic_functions})};
_handle = [] spawn avanix_fnc_wantedListPublic_functions;
//diag_log "::King Client:: Initialization Functions wantedListPublic";
waitUntil {scriptDone _handle};
*/
