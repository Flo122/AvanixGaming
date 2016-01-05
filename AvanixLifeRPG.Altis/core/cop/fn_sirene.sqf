/*
*Author: J3r3my by Zockerbude AltisLife
*Discription: U can use it to build a simpleScript for your "Button" Sirene in Kavala or somewhere else...
*Pls dont edit this Comments...
*Script by J3r3my Zockerbuden Community for GlobalGamer ScriptQuestion
*/
private ["_sirene","_sirn_min_dis","_SirenenMast","_stadt","_allowuse"];
_stadt = _this select 0;
_allowuse = false;
if(_stadt == 0) then {
	if (avanix_schutz_kavala) exitWith {hint "Du hast die Sirene vor kurzem erst benutzt!"};    
	_allowuse = true;
	_sirene = getMarkerPos "sirene_marker_kavala";
	avanix_schutz_kavala = true;
	[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\alarm.png'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Stadtwarnsystem</t></t><br/><br/><t size='1'>Achtung Achtung, die Polizeidirektion warnt vor einen Angriff auf Kavala. Bitte verlassen sie unverzüglich die Stadt!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
};
if(_stadt == 1) then {
	if (avanix_schutz_athira) exitWith {hint "Du hast die Sirene vor kurzem erst benutzt!"};
	_allowuse = true;    
	_sirene = getMarkerPos "sirene_marker_athira";
	avanix_schutz_athira = true;
	[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\alarm.png'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Stadtwarnsystem</t></t><br/><br/><t size='1'>Achtung Achtung, die Polizeidirektion warnt vor einen Angriff auf Athira. Bitte verlassen sie unverzüglich die Stadt!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
};
if(_stadt == 2) then {
	if (avanix_schutz_pyrgos) exitWith {hint "Du hast die Sirene vor kurzem erst benutzt!"};    
	_allowuse = true;
	_sirene = getMarkerPos "sirene_marker_pyrgos";
	avanix_schutz_pyrgos = true;
	[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\alarm.png'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Stadtwarnsystem</t></t><br/><br/><t size='1'>Achtung Achtung, die Polizeidirektion warnt vor einen Angriff auf Pyrgos. Bitte verlassen sie unverzüglich die Stadt!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
};
if(_stadt == 3) then {
	if (avanix_schutz_sofia) exitWith {hint "Du hast die Sirene vor kurzem erst benutzt!"};    
	_allowuse = true;
	_sirene = getMarkerPos "sirene_marker_sofia";
	avanix_schutz_sofia = true;
	[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\alarm.png'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>Stadtwarnsystem</t></t><br/><br/><t size='1'>Achtung Achtung, die Polizeidirektion warnt vor einen Angriff auf Sofia. Bitte verlassen sie unverzüglich die Stadt!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
};
if(_allowuse) then {
	_sirn_min_dis = 10;
	_SirenenMast = (nearestObjects [_sirene, ["Land_Loudspeakers_F"], _sirn_min_dis]) select 0;
	[_SirenenMast,"schutzsirene"] call avanix_fnc_globalSound;    
	//Wait 900 sec. before we are able to use it for the next time...
	uisleep 300;
	avanix_schutz_kavala = false;
	avanix_schutz_athira = false;
	avanix_schutz_pyrgos = false;
	avanix_schutz_sofia = false;
};