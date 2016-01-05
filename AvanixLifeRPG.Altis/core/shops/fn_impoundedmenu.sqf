private["_display","_cars","_name","_pic","_color","_text","_price"];
if(!dialog) then
{
    if(!(createDialog "avanix_impounded_menu")) exitWith {};
    avanix_impound_yard = _this select 3;
};
disableSerialization;
_display = findDisplay 28000;
if(isNull _display) exitWith {};
_cars = _display displayCtrl 28010;
lbClear _cars;
for "_i" from 0 to (count avanix_impoundedvehicles)-1 do
{
    _veh = avanix_impoundedvehicles select _i;
    if(_veh distance impound_obj < 50) then
    {
        _price = [_veh] call avanix_fnc_Configuration_Price;
    
        if(_price > avanix_cash) then
        {
            _price = _price + 200;
        };
        
        _name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
        _pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
        _cars lbSetPicture [(lbSize _cars)-1,_pic];
        _cars lbSetData [(lbSize _cars)-1,str(_i)];
    };
};