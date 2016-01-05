/*
	File: welcomecredits.sqf
	Author: HellsGateGaming.com
	Edit: Avanix Gaming Community
	Date: 09/05/2014
	Description:
	Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 8;

uisleep 15; //Wait in seconds before the credits start after player is in-game
 
_role1 = "Altis Life RPG";
_role1names = ["by Avanix Gaming Community"];
_role2 = "Server Regeln:";
_role2names = ["Bitte halte dich stehts an unsere Regeln..."];
_role3 = "...diese findest du in unserem Forum:";
_role3names = ["forum.avanix-gaming.de"];
_role4 = "Solltest du Hilfe brauchen wende dich an einen unserer Supporter:";
_role4names = ["Claire Werk","Waschie","Tjey","Heisenberg"];
_role5 = "Teamspeak:";
_role5names = ["ts.avanix-gaming.de"];
_role6 = "Serverrestarts:";
_role6names = ["06:00","12:00","18:00","00:00"];
{
uisleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.55' color='#FF0000' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.9);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
uisleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names]
];