/*
    Author: H4SHK3KS (ofpectag: H4SH)
    File: fn_initHC.sqf

    Written for Pirates Gaming
    http://Pirates-Gaming.de/
    The usage of this file is restricted to allowed servers (exclusive for Avanix)
    For further questions contact the author!

    Description:
    Inits the HC and monitors disconnect and connect of him

    Parameters:
    None

    Returns:
    Nothing
*/
#define HC_Name Rawr
DB_Dest = false;
publicVariable "DB_Dest";

// JIP integration of an hc
"Avanix_HC_isActive" addPublicVariableEventHandler {
	if(_this select 1) then {
		HC_UID = getPlayerUID HC_Name;
		DB_Dest = owner HC_Name;
		publicVariable "DB_Dest";
        DB_Dest publicVariableClient "serv_sv_use";

        diag_log "Headless client is connected and ready to work!";
	};
};

"Avanix_HC_isConnected" addPublicVariableEventHandler {
    [] spawn
    {
        systemChat "---------------";
        systemChat "HC is connected";
        systemChat "---------------";

        diag_log "HC Connected fired";
        waitUntil {owner HC_Name != 0};
        HC_Owner = owner HC_Name;
        diag_log HC_Owner;
        // Transferring functions to the hc, stand by...
        {
            _conf = _x;
            _tag = getText(_conf >> "tag");
            diag_log format ["Function tag: %1",_tag];
            if(_tag != "BIS") then
            {
                {
                    {
                        diag_log format ["Current function: %1",configName _x];
                        if (getNumber(_x >> "hcFunc") == 1) then
                        {
                            _functionName = format["%1_fnc_%2",_tag,configName _x];
                            HC_Owner publicVariableClient _functionName;
                            diag_log format ["Transferred function %1 to HC! (Owner: %2)",_functionName,HC_Owner];
                        };
                    } forEach ("true" configClasses (_x));
                } forEach ("true" configClasses (_conf));
            };
        } forEach ("true" configClasses (configFile >> "CfgFunctions"));

        {
            HC_Owner publicVariableClient _x;
        } forEach
        [
            // Space for server variables to be transferred to the hc
            // example: "Avanix_userCount"
            // Has to be a string!
        ];

        sleep 0.5;
        HC_startInit = true;
        HC_Owner publicVariableClient "HC_startInit";
        diag_log "HC Init done";
        systemChat "---------------";
        systemChat "HC init done";
        systemChat "---------------";

    };
};

HC_DC = ["HC_Disconnected","onPlayerDisconnected",
    {
        if(!isNil "HC_UID" && {_uid == HC_UID}) then {
            Avanix_HC_isActive = false;
            publicVariable "Avanix_HC_isActive";
            DB_Dest = false;
            publicVariable "DB_Dest";
            diag_log "Headless client disconnected! Broadcasted the vars!";
            diag_log "Ready for receiving queries on the server machine.";
        };
    }
] call BIS_fnc_addStackedEventHandler;