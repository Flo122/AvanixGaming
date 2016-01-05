/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"]; //-------------Changed---------------
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(avanix_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param;//-------------Changed--------------

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText["Du wurdest ins Gefängnis gebracht, wenn du versucht zu respawnen oder zu reconnecten wird sich dein Aufenthalt verlängern","PLAIN"];
hint "Da du inhaftiert wurdest, wurden dir illegale Lizenzen entzogen";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	uisleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call avanix_fnc_removeLicenses;
if(avanix_inv_pickaxe > 0) then {[false,"pickaxe",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_axt > 0) then {[false,"axt",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_lockpick > 0) then {[false,"lockpick",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_redgull > 0) then {[false,"redgull",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_blastingcharge > 0) then {[false,"blastingcharge",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_crowbar > 0) then {[false,"crowbar",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_boltcutter > 0) then {[false,"boltcutter",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_kidney > 0) then {[false,"kidney",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_scalpel > 0) then {[false,"scalpel",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_gpstracker > 0) then {[false,"gpstracker",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_kabelbinder > 0) then {[false,"kabelbinder",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_hanf > 0) then {[false,"hanf",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_marijuana > 0) then {[false,"marijuana",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_med_merijuana > 0) then {[false,"med_merijuana",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_opium > 0) then {[false,"opium",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_heroin > 0) then {[false,"heroin",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_morphine > 0) then {[false,"morphine",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_pseudoephedrin > 0) then {[false,"pseudoephedrin",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_phenylaceton > 0) then {[false,"phenylaceton",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_natriumamalgam > 0) then {[false,"natriumamalgam",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_meth > 0) then {[false,"meth",avanix_inv_heroinu] call avanix_fnc_handleInv;};
if(avanix_inv_moonschine > 0) then {[false,"moonschine",avanix_inv_heroinu] call avanix_fnc_handleInv;};
avanix_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player,_bad,_time],"avanix_fnc_jailSys",false,false] spawn avanix_fnc_MP;//-------------Changed-----------
[5] call SOCK_fnc_updatePartial;
[] call avanix_fnc_jailIn;