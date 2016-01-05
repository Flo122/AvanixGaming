#include <macro.h> 
/*
	File: fn_welcome.sqf
	Author: TheTotenkopf (SealDrop.de)
	Edit: Avanix Gaming Community
	
	Description:
	Erstellt ein schönen Regel Screen
*/
private ["_text","_intro"];

_intro = [];
_text = [];

switch (playerSide) do
{
	case west: 
	{
        _text = [
			format [format["<img size='4.5' image='textures\misc\cop_welcome.jpg'/>"]],
			format ["<t align='left'><t color='#ff1111'>Haltet euch an die Regeln und achtet stehts auf Höflichkeit und Respekt</t>"],
			format ["<t align='left'>zu Beginn deiner Schicht solltest du prüfen das du im Teamspeak in einem der für die Polizisten vorgesehenen Channel bist <t color='#0040FF'>ts.avanix-gaming.de</t>, sollte dein Vorgesetzter anwesend sein wirst du dich an das halten was er sagt, solltest du der höchstrangige sein wirst du die anderen Polizisten befehligen.</t>"],
			format ["<t align='left' color='#428BCA'>Forum : http://forum.avanix-gaming.de/</t>"]
		];
	};
	case independent:
	{
        _text = [
			format [format["<img size='4.5' image='textures\misc\med_welcome.jpg'/>"]],
			format ["<t align='left'><t color='#ff1111'>Haltet euch an die Regeln und achtet stehts auf Höflichkeit und Respekt</t>"],
			format ["<t align='left'>zu Beginn deiner Schicht solltest du prüfen das du im Teamspeak in einem der für Notärzte vorgesehenen Channel bist <t color='#0040FF'>ts.avanix-gaming.de</t></t>"],
			format ["<t align='left' color='#428BCA'>Forum : http://forum.avanix-gaming.de/</t>"]
		];
	};
	case civilian:
	{
        _text = [
			format [format["<img size='4.5' image='textures\misc\civ_welcome.jpg'/>"]],
			format ["<t align='left'><t color='#ff1111'>Haltet euch an die Regeln und achtet stehts auf Höflichkeit und Respekt</t>"],
			format ["<t align='left'>Bitte lies dir unsere Regeln sorgsam durch und befolge sie! Schau dich um und entdecke die Welt von Altis. Solltest du Fragen oder Probleme haben, dann besuch uns auf unserem Teamspeak Server <t color='#0040FF'>ts.avanix-gaming.de</t></t>"],
			format ["<t align='left' color='#428BCA'>Forum : http://forum.avanix-gaming.de/</t>"]
		];
	};
};

{
	_intro set [count _intro, (parseText _x)];
} forEach _text;
        
format ["Hallo %1, Willkommen auf Avanix Life !", name player] hintC _intro;

[] execVM "core\avanix\misc\fn_welcomecredits.sqf";
	