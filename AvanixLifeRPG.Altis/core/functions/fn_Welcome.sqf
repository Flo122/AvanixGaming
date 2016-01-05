disableSerialization;
[
	"",
	0,
	0.2,
	10,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\Misc\logo.jpg' /></t><br /><br />";
_message = _message + "Willkommen auf <a href='http://forum.avanix-gaming.de/' color='#FF0040'>Avanix-Gaming</a> ein deutscher Altis Life Server<br /><br />";
_message = _message + "Bitte lest die Regeln auf der <a href='http://forum.avanix-gaming.de/index.php/Thread/617-Serverregeln/' color='#FF0040'>Homepage</a> durch sonst wirst du vielleicht noch gebannt und das wollen wir nicht<br /><br />";
_message = _message + "Ihr könnt euch mit einem Klick auf das <a href='http://forum.avanix-gaming.de/index.php/TeamSpeak3Viewer/' color='#F7FE2E'>Teamspeak</a>  Verbinden<br /><br />";
_message = _message + "Bewerbungen<br />";
_message = _message + "Polizei : <a href='http://forum.avanix-gaming.de/index.php/Board/29-Polizei-Bewerbungen/' color='#5600FF'>Bewerbung</a><br />";
_message = _message + "Feuerwehr : <a href='http://forum.avanix-gaming.de/index.php/Board/30-Feuerwehr-Bewerbungen/' color='#FF4000'>Bewerbung</a><br />";
_message = _message + "Viel Spaß! Wünscht das Team von Avanix-Gaming<br />";

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlcommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;


