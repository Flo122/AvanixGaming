/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	A short function for telling the player to add a vehicle to his keychain.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_vehicle in avanix_vehicles)) then
{
	avanix_vehicles pushBack _vehicle;
};