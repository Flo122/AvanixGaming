 _ok = createDialog "avanix_messages";
disableSerialization;
waitUntil {!isNull (findDisplay 10000)};
_display = findDisplay 10000;

[] call avanix_fnc_initMessages;

waitUntil { !dialog };