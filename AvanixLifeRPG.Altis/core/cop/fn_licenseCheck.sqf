/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the licenses to the cop.
*/
private["_cop"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {}; //Bad entry

_licenses = "";
//Licenses
{
	if(missionNamespace getVariable (_x select 0) && _x select 1 == "civ") then
	{
		_licenses = _licenses + ([_x select 0] call avanix_fnc_varToStr) + "<br/>";
	};
} foreach avanix_licenses;

if(_licenses == "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};

[[profileName,_licenses],"avanix_fnc_licensesRead",_cop,FALSE] spawn avanix_fnc_MP;