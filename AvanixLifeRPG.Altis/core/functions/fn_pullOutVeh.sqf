/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
*/
if(playerSide == west OR (vehicle player == player)) exitWith {};
if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

player action ["Eject", vehicle player];
titleText["Du wurdest aus dem Fahrzeug gezogen","PLAIN"];
titleFadeOut 4;