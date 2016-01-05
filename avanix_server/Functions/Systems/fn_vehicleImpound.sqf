private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_imp"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle OR isNull _unit) exitWith {avanix_impound_inuse = false; (owner _unit) publicVariableClient "avanix_impound_inuse";avanix_garage_store = false;(owner _unit) publicVariableClient "avanix_garage_store";}; //Bad data passed.
_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then
{
    _plate = _vInfo select 1;
    _uid = _vInfo select 0;
    //_imp = _vInfo select 11;
};
if(_impound) then
{
    if(count _vInfo == 0) then 
    {
		_query = format["vehicleUpdateAlivePlateImpound:0:1:%1:%2",_uid,_plate];
        _thread = [_query,1] call DB_fnc_asyncCall;
        if(!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };
        avanix_impound_inuse = false;
        (owner _unit) publicVariableClient "avanix_impound_inuse";
        
    }
        else
    {
		_query = format["vehicleUpdateAlivePlateImpound:0:1:%1:%2",_uid,_plate];
        _thread = [_query,1] call DB_fnc_asyncCall;
        if(!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };
        avanix_impound_inuse = false;
        (owner _unit) publicVariableClient "avanix_impound_inuse";
    };
};