/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(count avanix_gangData == 0) exitWith {}; //Dafuq?

_wait = round(random(8));
uisleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x getVariable "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x getVariable["gang_owner",""];
		_groupID = _x getVariable "gang_id";
		if(_groupOwner == "" OR isNil "_groupID") exitWith {}; //Seriously?
		if((avanix_gangData select 0) == _groupID && {(avanix_gangData select 1) == _groupOwner}) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if((avanix_gangData select 1) == (getPlayerUID player)) then {
		_group selectLeader player;
		[[player,_group],"TON_fnc_clientGangLeader",(units _group),false] spawn avanix_fnc_MP;
	};
} else {
	_group = group player;
	_group setVariable["gang_id",(avanix_gangData select 0),true];
	_group setVariable["gang_owner",(avanix_gangData select 1),true];
	_group setVariable["gang_name",(avanix_gangData select 2),true];
	_group setVariable["gang_maxMembers",(avanix_gangData select 3),true];
	_group setVariable["gang_bank",(avanix_gangData select 4),true];
	_group setVariable["gang_members",(avanix_gangData select 5),true];
};
