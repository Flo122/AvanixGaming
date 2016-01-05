#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private["_group"];
avanix_action_gangInUse = nil;

if(avanix_atmcash < (__GETC__(avanix_gangPrice))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(avanix_gangPrice))-avanix_atmcash)] call avanix_fnc_numberText];
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

__SUB__(avanix_atmcash,(__GETC__(avanix_gangPrice)));

hint format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(__GETC__(avanix_gangPrice))] call avanix_fnc_numberText];