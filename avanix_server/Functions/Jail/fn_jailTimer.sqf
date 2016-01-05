private["_player", "_playeruid", "_query", "_injail", "_queryResult"];

_player = _this select 0;
_playeruid = _this select 1;



_player = _player;

_query = format["playerUpdateJailTime1:%1",_playeruid];
[_query,1] call DB_fnc_asyncCall;

_query = format["playerSelectJailTime1:%1",_playeruid];
_queryResult = [_query,2] call DB_fnc_asyncCall;