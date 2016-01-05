#include <macro.h>
/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Capture the Hideout
*/
private["_hideout","_flag","_owner","_member","_gangname","_playerid","_players","_grpMembers","_itembox","_terminal","_dist"];
_hideout = (nearestObjects[getPosATL player,["Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F"],25]) select 0;
_itembox = (nearestObjects[getPosATL player,["Land_MetalCase_01_large_F"],25]) select 0;
_terminal = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_flag = getPos player nearestObject "Flag_White_F";
_owner = _hideout getVariable ["gang_owner",""];
_gangowner = _hideout getVariable ["gangOwner",grpNull];
_member = _hideout getVariable ["gang_members",[]];
_gangname = _hideout getVariable ["gang_name",""];
_grpMembers = count (grpPlayer getVariable "gang_members");

_playerid = _member find getPlayerUID Player;
_players = 0;

{
	if ((group _x) getVariable "gang_name" == (_gangname)) then {
		_players = _players + 1;
	};
} forEach AllPlayers;

if (vehicle player != player) exitWith {hint "Du musst aus dem Fahrzeug aussteigen!"};
if (currentWeapon player == "") exitWith {hint "Du brauchst ne Waffe!"};
if (_grpMembers < 1) exitWith {hint "Ihr seit zu wenig Mitglieder!";};
if(isNil {grpPlayer getVariable "gang_name"}) exitWith {hint "Du bist in keiner Gang und kannst dieses Territorium nicht besetzen!";};
if(format["%1",_gangname] == (group player) getVariable "gang_name" || _gangowner == grpPlayer) exitWith {hint "Deine Gang kontrolliert dieses Territorium schon";};
if((_terminal getVariable ["inCapture",FALSE])) exitWith {hint "Das Territorium wird bereits eingenommen!";};
if (_players < 1 && _gangname != "") exitWith {hint "Es sind nicht genügend gegnerische Gangmitglieder online!"}; 

if(!isNil "_action" && {!_action}) exitWith {titleText["Territorium einnehmen abgebrochen!","PLAIN"];};
avanix_action_inUse = true;
[[[0],"!!! ACHTUNG !!! Ein Gang Territorium wird angegriffen!"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;

//Setup our timer.
disableSerialization;
6 cutRsc ["avanix_timer","PLAIN"];
hint "Bleib in der Nähe!";
_uiDisp = uiNamespace getVariable "avanix_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (3 * 60);
if(_hideout getVariable["noCaptured",true]) then {
	_time = time + (3 * 60);
} else {
	_time = time + (20 * 60);
};
[_terminal,3] call BIS_fnc_dataTerminalAnimate;

_smoke="SmokeShellRed" createVehicle getpos _flag;
_smoke attachTo [_flag,[0,0,0]];
_light = "Chemlight_red" createVehicle getPos _flag;
_light attachTo [_flag,[0,0,0]];

while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["avanix_timer","PLAIN"];
		_uiDisp = uiNamespace getVariable "avanix_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {[_terminal,0] call BIS_fnc_dataTerminalAnimate;};
	_terminal setVariable["inCapture",true,true];
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	uisleep 0.08;
	if((player getVariable["restrained",false])) exitWith {[_terminal,0] call BIS_fnc_dataTerminalAnimate;};
	if((player getVariable["hostage",false])) exitWith {[_terminal,0] call BIS_fnc_dataTerminalAnimate;};
	if(avanix_istazed) exitWith {_terminal setVariable["inCapture",false,true];[_terminal,0] call BIS_fnc_dataTerminalAnimate;};
	if(_hideout getVariable["CancelCapture",true]) exitWith {_terminal setVariable["inCapture",false,true];[_terminal,0] call BIS_fnc_dataTerminalAnimate; hint "Die gegnerische Gang konnte den Angriff vereiteln!";};
	_dist = player distance _terminal;
	if (_dist > 200) exitWith {hint "Du bist zu weit weg!";};
};

//Kill the UI display and check for various states
avanix_action_inUse = false;
6 cutText["","PLAIN"];
if(!alive player OR avanix_istazed) exitWith {avanix_action_inUse = false;_terminal setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {avanix_action_inUse = false;_terminal setVariable["inCapture",false,true];};
if(_hideout getVariable["CancelCapture",true]) exitWith {_terminal setVariable["inCapture",false,true];[_terminal,0] call BIS_fnc_dataTerminalAnimate; _hideout setVariable ["CancelCapture",false,true]; hint "Die gegnerische Gang konnte den Angriff vereiteln!";};
_dist = player distance _terminal;
if (_dist > 200) exitWith {hint "Du bist zu weit weg!";};

[_terminal,"red","orange","green"] call BIS_fnc_DataTerminalColor;
titleText["Gebiet erobert!","PLAIN"];
_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_flag setFlagTexture _flagTexture;
[[[0,1],format["%1 und seine Gang %2 haben die Kontrolle über ein Hideout übernommen!",name player,(group player) getVariable "gang_name" ]],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;

_terminal setVariable["inCapture",false,true];
_hideout setVariable["gang_owner","",true];
_hideout setVariable["gangOwner",grpPlayer,true];
_hideout setVariable ["gang_members",[],true];
_hideout setVariable ["gang_name",(group player) getVariable "gang_name",true];
_itembox setVariable ["gang_name",(group player) getVariable "gang_name",true];
_hideout setVariable ["CancelCapture",false,true];
_hideout setVariable ["noCaptured",false,true];

_i=0;

{
	if(player distance (getMarkerPos format ["gang_area_%1",_x]) < 200 ) then {
		format["gang_area_%1",_x] setMarkerText format ["Territorium von %1",(group player) getVariable "gang_name"];
		_i=_x
	};
} forEach [1,2,3,4];

_gangName = (group player) getVariable "gang_name";
_owner = grpPlayer getVariable["gang_owner",""];
_id = _i;
[[_owner,_gangName,grpPlayer,_id],"TON_fnc_updateHideout",false,false] spawn avanix_fnc_MP;