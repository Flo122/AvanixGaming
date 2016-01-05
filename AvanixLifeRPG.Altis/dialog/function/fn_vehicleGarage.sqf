/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private["_spawnPos","_dir","_type"];
_type = [_this,1,"",[""]] call BIS_fnc_param;
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

avanix_garage_sp = [(_spawnPos modelToWorld [-11.5,0,0]),(getDir _spawnPos)-90];
avanix_garage_type = _type;
[[getPlayerUID player,playerSide,_type,player],"TON_fnc_getVehicles",false,false] spawn avanix_fnc_MP;
createDialog "avanix_impound_menu";
disableSerialization;
ctrlSetText[2802,("Durchsuche nach Fahrzeugen...")];