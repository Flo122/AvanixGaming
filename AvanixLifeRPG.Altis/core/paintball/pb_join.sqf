if (joinmode==0) then {
	_PUID = getPlayerUID player;
	_spielerGeld = avanix_cash;
	hint "Eine Anfrage wurde an den Server gesendet, bitte warte einen Moment";
	[[_PUID,_spielerGeld],"TON_fnc_paintball",false,false] spawn avanix_fnc_MP;
	joinmode = 1;
} else {
	hint "Du bist der Lobby bereits beigetreten, versuche es sp�ter noch einmal!";
};