/*
	AUTHOR: aeroson
	EDIT: GamerDF
*/       

#define PUSH(A,B) A set [count (A),B];
#define REM(A,B) A=A-[B];

private ["_CUBodies","_CUVehiclesDead","_CUVehiclesImmobile","_CUWeapons","_CUPlanted","_CUSmokes","_addToCleanup","_unit","_objectsToCleanup","_timesWhenToCleanup","_removeFromCleanup"];

_CUBodies=[_this,0,0,[0]] call BIS_fnc_param;
_CUVehiclesDead=[_this,1,0,[0]] call BIS_fnc_param;
_CUVehiclesImmobile=[_this,2,0,[0]] call BIS_fnc_param;
_CUWeapons=[_this,3,0,[0]] call BIS_fnc_param;
_CUPlanted=[_this,4,0,[0]] call BIS_fnc_param;
_CUSmokes=[_this,5,0,[0]] call BIS_fnc_param;

if({_x>0}count _this==0) exitWith {}; // all times are 0, we do not want to run this script at all


_objectsToCleanup=[];
_timesWhenToCleanup=[];

_addToCleanup = {
	_object = _this select 0;
	if(!(_object getVariable["persistent",false])) then {
		_newTime = (_this select 1)+time;
		_index = _objectsToCleanup find _object;
		if(_index == -1) then {
			PUSH(_objectsToCleanup,_object)
			PUSH(_timesWhenToCleanup,_newTime)
		} else {
			_currentTime = _timesWhenToCleanup select _index;
			if(_currentTime>_newTime) then {		
				_timesWhenToCleanup set[_index, _newTime];
			}; 
		};			   
	};
};

_removeFromCleanup = {
	_object = _this select 0;
	_index = _objectsToCleanup find _object;
	if(_index != -1) then {
		_objectsToCleanup set[_index, 0];
		_timesWhenToCleanup set[_index, 0]; 
	};			   
};


while{true} do {

	uisleep 10;
    	
	{	
	    _unit = _x;
	    
		if (_CUWeapons>0) then {
			{
				{ 	 
					[_x, _CUWeapons] call _addToCleanup;			
				} forEach (getpos _unit nearObjects [_x, 100]);
			} forEach ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"];
		};
		
		if (_CUPlanted>0) then {
			{
				{ 
					[_x, _CUPlanted] call _addToCleanup;  
				} forEach (getpos _unit nearObjects [_x, 100]);
			} forEach ["TimeBombCore"];
		};
		
		if (_CUSmokes>0) then {
			{
				{ 	 
					[_x, _CUSmokes] call _addToCleanup; 
				} forEach (getpos _unit nearObjects [_x, 100]);
			} forEach ["SmokeShell"];
		};
	
	} forEach allUnits;
	
	if (_CUBodies>0) then {
		{
			[_x, _CUBodies] call _addToCleanup;
		} forEach allDeadMen;
	};	
	
	if (_CUVehiclesDead>0) then {		
		{
			if(_x == vehicle _x) then { // make sure its vehicle 	 
				[_x, _CUVehiclesDead] call _addToCleanup;
			}; 
		} forEach (allDead - allDeadMen); // all dead without dead men == mostly dead vehicles
	};
	
	if (_CUVehiclesImmobile>0) then {		
		{
			if(!canMove _x && {alive _x}count crew _x==0) then { 	 
				[_x, _CUVehiclesImmobile] call _addToCleanup;
			} else {
				[_x] call _removeFromCleanup;
			}; 
		} forEach vehicles;
	};
						
	REM(_objectsToCleanup,0)
	REM(_timesWhenToCleanup,0)

	{        
		if(isNull(_x)) then {
			_objectsToCleanup set[_forEachIndex, 0];
			_timesWhenToCleanup set[_forEachIndex, 0];
		} else {
			if(_timesWhenToCleanup select _forEachIndex < time) then {
				deleteVehicle _x;
				_objectsToCleanup set[_forEachIndex, 0];
				_timesWhenToCleanup set[_forEachIndex, 0];			 	
			};
		};	
	} forEach _objectsToCleanup;
	
	REM(_objectsToCleanup,0)
	REM(_timesWhenToCleanup,0)
				
};