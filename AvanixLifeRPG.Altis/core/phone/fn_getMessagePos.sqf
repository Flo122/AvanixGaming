/*

	Author Shinji
	Get the position of the Marker and set it on the map for a few seconds!? maybe... 20?

*/

_name = _this select 0;
_pos = _this select 1;

if (_name == "") exitwith {};///NOAH WHATS WRONG WITH ARMA O_O
_posx = _pos select 0;
_posy = _pos select 1;

_pos = [_posx, _posy];

ziel_marker= createMarkerLocal ["auftrags_ziel_marker", position player ];
"auftrags_ziel_marker" setMarkerBrushLocal "SolidFull";
"auftrags_ziel_marker" setMarkerColorLocal "ColorRed";
"auftrags_ziel_marker" setMarkerPosLocal _pos;
"auftrags_ziel_marker" setMarkerTypeLocal "mil_destroy"; 
"auftrags_ziel_marker" setMarkerTextLocal _name;
"auftrags_ziel_marker" setMarkerSizeLocal [2, 2];

uisleep 20;


deleteMarkerLocal "auftrags_ziel_marker";