enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

avanix_versionInfo = "Avanix Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "core\avanix\misc\fn_colorEffects.sqf";

[] execVM "core\avanix\robShop\fn_robShopInit.sqf";


StartProgress = true;


setTerrainGrid 45;
setViewDistance 1000;
setObjectViewDistance [835,50];

uisleep 0.5;
dokeyCheck={private ["_r"];_r = false ;if ((_this select 1) in (actionKeys "TacticalView")) then {	_r=true;};_r;};

(FindDisplay 46) displaySetEventHandler 
["keydown","_this call dokeyCheck"];

[] spawn 
{
    while{true} do 
	{
        uisleep 10;
        200 setFog 0;
        200 setRain 0;
        uisleep 590;
    };
};


avanix_messages = [];
avanix_positions = [];
avanix_names = [];
avanix_player = [];

null = [[Monitor_1,Monitor_2],["admin_1"]] execVM "core\avanix\avanixtv\feedInit.sqf";