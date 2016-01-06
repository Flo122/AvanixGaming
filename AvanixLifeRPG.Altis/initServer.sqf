/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call avanix_fnc_MPexec};
if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\avanix_server\init.sqf";
master_group attachTo[bank_obj,[0,0,0]];

onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";

//DeleteBueldings
{  
	(( _x select 0 ) nearestObject ( _x select 1 )) hideObjectGlobal true;
} forEach [
	[[ 15348.8,17426.1,0 ],491661],	
	[[ 25835.7,21428.1,0 ],1575010],
	[[ 16758.9,13648.3,0 ],899424]
];

if (hasInterface) then {
    if (!isNumber (missionConfigFile >> "briefing")) exitWith {};
    if (getNumber (missionConfigFile >> "briefing") == 1) exitWith {};
    0 = [] spawn {
        waitUntil {
            if (getClientState == "BRIEFING READ") exitWith {true};
            if (!isNull findDisplay 53) exitWith {
                ctrlActivate (findDisplay 53 displayCtrl 1);
                findDisplay 53 closeDisplay 1;
                true
            };
            false
        };
    };
};