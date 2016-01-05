/*
    Author: H4SHK3KS (ofpectag: PoA)
    File: fn_asyncCall.sqf
    Written for Pirates of Altis
    http://pirates-gaming.de/
    The usage of this file is restricted to Pirates-Of-Altis
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
    Description:
    Async call to db
    Parameters:
    0: String  Query Statement
    1: Number  1 For Insert/Update  2 For Select
    2: Bool  True when returning a multiarray
    Returns:
    Result: Array with content
*/
private["_queryStmt","_queryResult","_key","_mode","_return","_loop","_tickTime"];

_tickTime = diag_tickTime;

_queryStmt = param [0,"",[""]];
_mode = param [1,1,[0]];
_multiarr = param [2,false,[false]];

_result = "extDB2" callExtension format["%1:%2:%3",_mode, (call avanix_sql_id), _queryStmt];

if(_mode == 1) exitWith {
	["extDB: MySQL Insert/Update Query: %1 Time: %2 ms",_queryStmt,(diag_tickTime - _tickTime) / 1000] call BIS_fnc_logFormat;
	true;
};

_result = call compile format["%1",_result];
_key = (_result select 1);
_keyMode = (_result select 0);

uisleep (random .03);

_queryResult = "";
_loop = true;

while{_loop} do
{
	_queryResult = "extDB2" callExtension format["4:%1", _key];
	switch(_queryResult) do {

		case "[5]": {
			// Multi part message (retrieve in loop)
			_queryResult = "";
			while{true} do {
				_pipe = "extDB2" callExtension format["5:%1", _key];
				if(_pipe == "") exitWith {_loop = false};
				_queryResult = _queryResult + _pipe;
			};
		};

		case "[3]": {
			// locked pipe, wait a mom
			["extDB2: uisleep [4]: %1", diag_tickTime] call BIS_fnc_logFormat;
			uisleep 0.3;
		};

		default {
			_loop = false;
		};
	};
};

_queryResult = call compile _queryResult;

// Error checking (extDB died etc.)
if ((_queryResult select 0) == 0) exitWith {diag_log format ["extDB2: Protocol Error: %1", _queryResult]; []};
_return = (_queryResult select 1);

// Retrieve message
if(!_multiarr && count _return > 0) then {
	_return = _return select 0;
};

["extDB: MySQL Select Query: ' %1 ' Result: ' %2 ' Time: %3 ms",_queryStmt,_return,(diag_tickTime - _tickTime) / 10] call BIS_fnc_logFormat;

_return;