/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(avanix_cash > 0) then
{
	[[avanix_cash],"avanix_fnc_robReceive",_robber,false] spawn avanix_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"avanix_fnc_wantedAdd",false,false] spawn avanix_fnc_MP;
	[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[avanix_cash] call avanix_fnc_numberText]],"avanix_fnc_broadcast",nil,false] spawn avanix_fnc_MP;
	avanix_cash = 0;
}
	else
{
	[[2,"STR_NOTF_RobFail",true,[profileName]],"avanix_fnc_broadcast",_robber,false] spawn avanix_fnc_MP;
};