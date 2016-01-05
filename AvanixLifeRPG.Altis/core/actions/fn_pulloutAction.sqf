/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;

{
	if(side _x != west) then
	{
		if(!alive _x) then {
			_randX = random(3) + 2;
			_randY = random(3) + 2;
			_x setPos (_x modelToWorld [_randX,_randY,0]);
		} else {
			_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
			[[_x],"avanix_fnc_pulloutVeh",_x,false] spawn avanix_fnc_MP;
		};
	};
	if(side _x != civilian) then
	{
		if(!alive _x) then {
			_randX = random(3) + 2;
			_randY = random(3) + 2;
			_x setPos (_x modelToWorld [_randX,_randY,0]);
		} else {
			_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
			[[_x],"avanix_fnc_pulloutVehCiv",_x,false] spawn avanix_fnc_MP;
		};
	};
	if(side _x != independent) then
	{
		if(!alive _x) then {
			_randX = random(3) + 2;
			_randY = random(3) + 2;
			_x setPos (_x modelToWorld [_randX,_randY,0]);
		} else {
			_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
			[[_x],"avanix_fnc_pulloutVehMedic",_x,false] spawn avanix_fnc_MP;
		};
	};
} foreach _crew;