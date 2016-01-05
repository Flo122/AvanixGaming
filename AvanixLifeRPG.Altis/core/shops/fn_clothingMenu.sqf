#include <macro.h>
/*
	File: fn_clothingMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Opens and initializes the clothing store menu.
	Started clean, finished messy.
*/
private["_list","_clothes","_pic","_filter"];
createDialog "avanix_clothing";
disableSerialization;

//Cop / Civ Pre Check
if((_this select 3) in ["bruce","dive","kart","gang","donator","gang"] && playerSide != civilian) exitWith {hint "Du bist kein Zivilist!"; closeDialog 0;};
if((_this select 3) in ["cop"] && playerSide != west) exitWith {hint "Du bist kein Beamter!"; closeDialog 0;};
if((_this select 3) in ["dive"] && !license_civ_dive) exitWith { hint "Du hast kein Tauchschein!"; closeDialog 0;};
if((_this select 3) in ["med"] && playerSide != independent) exitWith {hint "Du gehörst nicht zur Feuerwehr!"; closeDialog 0;};
if((_this select 3) == "schwarzmarkt_clothing" && !license_civ_schwarzmarkt) exitWith {hint "Du hast kein Schwarzmarktlizenz!"; closeDialog 0;};
if((_this select 3) == "donator" && !(__GETC__(avanix_donator) > 0)) exitWith {hint "Du bist kein Community Mitglied!"; closeDialog 0;};
if((_this select 3) == "taxi" && !license_civ_taxi) exitWith {hint "Du hast kein Taxischein"; closeDialog 0;};
//if((_this select 3) == "heroin" && ((west countSide playableUnits) < 3) exitWith {hint "Es sind nicht genügend Polizisten online!"};

_pos = [1000,1000,10000];
_oldDir = getDir player;
_oldPos = visiblePositionASL player;
_testLogic = "Logic" createVehicleLocal _pos;
_testLogic setPosATL _pos;
_ut1 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,5,10]);
_ut1 attachTo [_testLogic,[0,5,5]];
_ut1 setDir 0;
_ut4 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,-5,10]);
_ut4 attachTo [_testLogic,[0,-5,5]];
_ut4 setDir 180;
_ut2 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [5,0,10]);
_ut2 attachTo [_testLogic,[5,0,5]];
_ut2 setDir (getDir _testLogic) + 90;
_ut3 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [-5,0,10]);
_ut3 attachTo [_testLogic,[-5,0,5]];
_ut3 setDir (getDir _testLogic) - 90;
_ut5 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,0,10]);
_ut5 attachTo [_testLogic,[0,0,0]];
_ut5 setObjectTexture [0,"a3\map_data\gdt_concrete_co.paa"];
detach _ut5;
_ut5 setVectorDirAndUp [[0,0,-.33],[0,.33,0]];
_light = "#lightpoint" createVehicleLocal [1000,1000,10000];   
_light setLightBrightness 1;  
_light setLightAmbient [1.0, 1.0, 1.0];
_light lightAttachObject [_ut1, [0,0,10]];
{if(_x != player) then {_x hideObject true;};} foreach playableUnits;
{
    _x setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,1)"];
} foreach [_ut1,_ut2,_ut3,_ut4];
player attachTo [_testLogic,[0,0,0]];
player switchMove "";
avanix_clothing_store = _this select 3;
//License Check?
_var = [avanix_clothing_store,0] call avanix_fnc_licenseType;
if(_var select 0 != "") then
{
    if(!(missionNamespace getVariable (_var select 0))) exitWith {hint format[localize "STR_Shop_YouNeed",[_var select 0] call avanix_fnc_varToStr]; closeDialog 0;};
};
//initialize camera view
avanix_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
avanix_shop_cam cameraEffect ["Internal", "Back"];
avanix_shop_cam camSetTarget (player modelToWorld [0,0,1]);
avanix_shop_cam camSetPos (player modelToWorld [1,4,2]);
avanix_shop_cam camSetFOV .33;
avanix_shop_cam camSetFocus [50, 0];
avanix_shop_cam camCommit 0;
avanix_cMenu_lock = false;
if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
_filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;
_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";
_filter lbSetCurSel 0;
avanix_oldClothes = uniform player;
avanix_olduniformItems = uniformItems player;
avanix_oldBackpack = backpack player;
avanix_oldVest = vest player;
avanix_oldVestItems = vestItems player;
avanix_oldBackpackItems = backpackItems player;
avanix_oldGlasses = goggles player;
avanix_oldHat = headgear player;
waitUntil {isNull (findDisplay 3100)};
{if(_x != player) then {_x hideObject false;};} foreach playableUnits;
detach player;
player setPosASL _oldPos;
player setDir _oldDir;
{deleteVehicle _x;} foreach [_testLogic,_ut1,_ut2,_ut3,_ut4,_ut5,_light];
avanix_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy avanix_shop_cam;
avanix_clothing_filter = 0;
if(isNil "avanix_clothesPurchased") exitWith
{
    avanix_clothing_purchase = [-1,-1,-1,-1,-1];
    if(avanix_oldClothes != "") then {player addUniform avanix_oldClothes;} else {removeUniform player};
    if(avanix_oldHat != "") then {player addHeadgear avanix_oldHat} else {removeHeadgear player;};
    if(avanix_oldGlasses != "") then {player addGoggles avanix_oldGlasses;} else {removeGoggles player};
    if(backpack player != "") then
    {
        if(avanix_oldBackpack == "") then
        {
            removeBackpack player;
        }
            else
        {
            removeBackpack player;
            player addBackpack avanix_oldBackpack;
            clearAllItemsFromBackpack player;
            if(count avanix_oldBackpackItems > 0) then
            {
                {
                    [_x,true,true] call avanix_fnc_handleItem;
                } foreach avanix_oldBackpackItems;
            };
        };
    };
    
    if(count avanix_oldUniformItems > 0) then
    {
        {[_x,true,false,false,true] call avanix_fnc_handleItem;} foreach avanix_oldUniformItems;
    };
    
    if(vest player != "") then
    {
        if(avanix_oldVest == "") then
        {
            removeVest player;
        }
            else
        {
            player addVest avanix_oldVest;
            if(count avanix_oldVestItems > 0) then
            {
                {[_x,true,false,false,true] call avanix_fnc_handleItem;} foreach avanix_oldVestItems;
            };
        };
    };
};
avanix_clothesPurchased = nil;
//Check uniform purchase.
if((avanix_clothing_purchase select 0) == -1) then
{
    if(avanix_oldClothes != uniform player) then {player addUniform avanix_oldClothes;};
};
//Check hat
if((avanix_clothing_purchase select 1) == -1) then
{
    if(avanix_oldHat != headgear player) then {if(avanix_oldHat == "") then {removeHeadGear player;} else {player addHeadGear avanix_oldHat;};};
};
//Check glasses
if((avanix_clothing_purchase select 2) == -1) then
{
    if(avanix_oldGlasses != goggles player) then
    {
        if(avanix_oldGlasses == "") then 
        {
            removeGoggles player;
        }
            else
        {
            player addGoggles avanix_oldGlasses;
        };
    };
};
//Check Vest
if((avanix_clothing_purchase select 3) == -1) then
{
    if(avanix_oldVest != vest player) then
    {
        if(avanix_oldVest == "") then {removeVest player;} else
        {
            player addVest avanix_oldVest;
            {[_x,true,false,false,true] call avanix_fnc_handleItem;} foreach avanix_oldVestItems;
        };
    };
};
//Check Backpack
if((avanix_clothing_purchase select 4) == -1) then
{
    if(avanix_oldBackpack != backpack player) then
    {
        if(avanix_oldBackpack == "") then {removeBackpack player;} else
        {
            removeBackpack player;
            player addBackpack avanix_oldBackpack;
            {[_x,true,true] call avanix_fnc_handleItem;} foreach avanix_oldBackpackItems;
        };
    };
};
avanix_clothing_purchase = [-1,-1,-1,-1,-1];
[] call avanix_fnc_saveGear;