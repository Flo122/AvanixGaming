/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [avanix_corpse] call avanix_fnc_fetchDeadGear;
[_oldGear] spawn avanix_fnc_loadDeadGear;
avanix_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[avanix_corpse],"avanix_fnc_corpse",nil,FALSE] spawn avanix_fnc_MP;
_dir = getDir avanix_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call avanix_revive_fee)] call avanix_fnc_numberText];

closeDialog 0;
avanix_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy avanix_deathCamera;

//Take fee for services.
if(avanix_atmcash > (call avanix_revive_fee)) then {
	avanix_atmcash = avanix_atmcash - (call avanix_revive_fee);
} else {
	avanix_atmcash = 0;
};

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
switch(playerSide) do {
	case independent: {[[player,0,"textures\medic_uniform.jpg"],"avanix_fnc_setTexture",true,false] spawn avanix_fnc_MP;};
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL avanix_corpse);
avanix_corpse setVariable["Revive",nil,TRUE];
avanix_corpse setVariable["name",nil,TRUE];
[[avanix_corpse],"avanix_fnc_corpse",true,false] spawn avanix_fnc_MP;
hideBody avanix_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[] call avanix_fnc_hudUpdate; //Request update of hud.