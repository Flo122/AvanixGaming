/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka
    
    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_return = [];

_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
if(playerSide == west || playerSide == civilian && {(call avanix_save_civ)}) then {
    _return pushBack primaryWeapon player;
    _return pushBack handgunWeapon player;
} else {
    _return pushBack [];
    _return pushBack [];
};

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems = _yItems + [_name];
        };
    };
} forEach [
	["avanix_inv_rabbit", avanix_inv_rabbit],
	["avanix_inv_water", avanix_inv_water],
	["avanix_inv_donuts", avanix_inv_donuts],
	["avanix_inv_coffee", avanix_inv_coffee],
	["avanix_inv_fuelF", avanix_inv_fuelF],
	["avanix_inv_fuelE", avanix_inv_fuelE],
	["avanix_inv_pickaxe", avanix_inv_pickaxe],
	["avanix_inv_axt", avanix_inv_axt],
	["avanix_inv_tbacon", avanix_inv_tbacon],
	["avanix_inv_lockpick", avanix_inv_lockpick],
	["avanix_inv_redgull", avanix_inv_redgull],
	["avanix_inv_blastingcharge", avanix_inv_blastingcharge],
	["avanix_inv_crowbar", avanix_inv_crowbar],
	["avanix_inv_boltcutter", avanix_inv_boltcutter],
	["avanix_inv_defusekit", avanix_inv_defusekit],
	["avanix_inv_kidney", avanix_inv_kidney],
	["avanix_inv_scalpel", avanix_inv_scalpel],
	["avanix_inv_kabelbinder", avanix_inv_kabelbinder],
	["avanix_inv_gpstracker", avanix_inv_gpstracker],
	["avanix_inv_truckstorage", avanix_inv_truckstorage],
	["avanix_inv_speedtrap", avanix_inv_speedtrap],
	["avanix_inv_laptop", avanix_inv_laptop],
	["avanix_inv_batterie", avanix_inv_batterie],
	
	//Objects
	["avanix_inv_barriere_g", avanix_inv_barriere_g],
	["avanix_inv_pylone", avanix_inv_pylone],
	["avanix_inv_schranke", avanix_inv_schranke],
	["avanix_inv_spikeStrip", avanix_inv_spikeStrip],
	["avanix_inv_barriere_k", avanix_inv_barriere_k],
	["avanix_inv_strahler", avanix_inv_strahler],
	["avanix_inv_target", avanix_inv_target],
	["avanix_inv_sandsack", avanix_inv_sandsack],
	["avanix_inv_bunker", avanix_inv_bunker],
	["avanix_inv_medhouse", avanix_inv_medhouse],
	
	//Housing
	["avanix_inv_storagesmall", avanix_inv_storagesmall],
	["avanix_inv_storagebig", avanix_inv_storagebig],
	["avanix_inv_methkueche", avanix_inv_methkueche],
	["avanix_inv_burglartool", avanix_inv_burglartool],
	["avanix_inv_alarmsystem", avanix_inv_alarmsystem],
	["avanix_inv_alarmsystemGPS", avanix_inv_alarmsystemGPS],
	["avanix_inv_alarmsystemDog", avanix_inv_alarmsystemDog],
	["avanix_inv_alarmsystemGuard", avanix_inv_alarmsystemGuard],  
	["avanix_inv_metalGrilledWindow", avanix_inv_metalGrilledWindow],
	["avanix_inv_spytoolkit", avanix_inv_spytoolkit],
			
	//Fisch Items
	["avanix_inv_salema", avanix_inv_salema],
	["avanix_inv_ornate", avanix_inv_ornate],
	["avanix_inv_mackerel", avanix_inv_mackerel],
	["avanix_inv_tuna", avanix_inv_tuna],
	["avanix_inv_mullet", avanix_inv_mullet],
	["avanix_inv_catshark", avanix_inv_catshark],
	["avanix_inv_turtle", avanix_inv_turtle],
			
	//Minen Items
	["avanix_inv_sand", avanix_inv_sand],
	["avanix_inv_glass", avanix_inv_glass],
	["avanix_inv_panzerglass", avanix_inv_panzerglass],
	["avanix_inv_rock", avanix_inv_rock],
	["avanix_inv_cement", avanix_inv_cement],
	["avanix_inv_beton", avanix_inv_beton],
	["avanix_inv_copper", avanix_inv_copper],
	["avanix_inv_copper_r", avanix_inv_copper_r],
	["avanix_inv_electro", avanix_inv_electro],
	["avanix_inv_iron", avanix_inv_iron],
	["avanix_inv_iron_r", avanix_inv_iron_r],
	["avanix_inv_stahl", avanix_inv_stahl],
	["avanix_inv_blei", avanix_inv_blei],
	["avanix_inv_blei_r", avanix_inv_blei_r],
	["avanix_inv_dino", avanix_inv_dino],
	["avanix_inv_gold", avanix_inv_gold],
	["avanix_inv_goldnuggets", avanix_inv_goldnuggets],
	["avanix_inv_goldbar", avanix_inv_goldbar],
			
	//Legal Job Items
	["avanix_inv_mango", avanix_inv_mango],
	["avanix_inv_ananas", avanix_inv_ananas],
	["avanix_inv_salt", avanix_inv_salt],
	["avanix_inv_salt_r", avanix_inv_salt_r],
	["avanix_inv_zuckerrohr", avanix_inv_zuckerrohr],
	["avanix_inv_zucker", avanix_inv_zucker],
	["avanix_inv_holz", avanix_inv_holz],
	["avanix_inv_holzscheit", avanix_inv_holzscheit],
	["avanix_inv_holzkohle", avanix_inv_holzkohle],
	["avanix_inv_rohoel", avanix_inv_rohoel],
	["avanix_inv_erdoel", avanix_inv_erdoel],
	["avanix_inv_plastik", avanix_inv_plastik],
	["avanix_inv_benzin", avanix_inv_benzin],
	["avanix_inv_diesel", avanix_inv_diesel],
	["avanix_inv_kerosin", avanix_inv_kerosin],
	["avanix_inv_baumwolle", avanix_inv_baumwolle],
	["avanix_inv_stoff", avanix_inv_stoff],
			
	//Illegal Job Items
	["avanix_inv_hanf", avanix_inv_hanf],
	["avanix_inv_marijuana", avanix_inv_marijuana],
	["avanix_inv_med_merijuana", avanix_inv_med_merijuana],
	["avanix_inv_opium", avanix_inv_opium],
	["avanix_inv_heroin", avanix_inv_heroin],
	["avanix_inv_morphine", avanix_inv_morphine],
	["avanix_inv_pseudoephedrin", avanix_inv_pseudoephedrin],
	["avanix_inv_phenylaceton", avanix_inv_phenylaceton],
	["avanix_inv_natriumamalgam", avanix_inv_natriumamalgam],
	["avanix_inv_meth", avanix_inv_meth],
	["avanix_inv_moonschine", avanix_inv_moonschine],
	["avanix_inv_uranu", avanix_inv_uranu],
	["avanix_inv_uranp", avanix_inv_uranp],
	
	//Waffen Baupläne
	["avanix_inv_bprook40", avanix_inv_bprook40],
	["avanix_inv_bpacpc2", avanix_inv_bpacpc2],
	["avanix_inv_bpzubr45", avanix_inv_bpzubr45],
	["avanix_inv_bpp07", avanix_inv_bpp07],
	["avanix_inv_bpsignal", avanix_inv_bpsignal],
	["avanix_inv_bp4five", avanix_inv_bp4five],
	["avanix_inv_bppdw2000", avanix_inv_bppdw2000],
	["avanix_inv_bpvermin", avanix_inv_bpvermin],
	["avanix_inv_bpsting", avanix_inv_bpsting],
	["avanix_inv_bpsdar", avanix_inv_bpsdar],
	["avanix_inv_bptrg20", avanix_inv_bptrg20],
	["avanix_inv_bpkatiba", avanix_inv_bpkatiba],
	["avanix_inv_bprahim", avanix_inv_bprahim],
	["avanix_inv_bpzafir", avanix_inv_bpzafir],
	["avanix_inv_bpgm6lynx", avanix_inv_bpgm6lynx],
	["avanix_inv_bpasp1", avanix_inv_bpasp1],
	["avanix_inv_bpcyrus", avanix_inv_bpcyrus],
	["avanix_inv_bpmar10", avanix_inv_bpmar10],
	["avanix_inv_bpmk1", avanix_inv_bpmk1],
	["avanix_inv_bpmk14", avanix_inv_bpmk14],
	["avanix_inv_bpmk200", avanix_inv_bpmk200],
	["avanix_inv_bplrr", avanix_inv_bplrr],
	["avanix_inv_bpmk18", avanix_inv_bpmk18],
	["avanix_inv_bpmk20", avanix_inv_bpmk20],
	
	//Fahrzeug Baupläne
	["avanix_inv_bpquad", avanix_inv_bpquad],
	["avanix_inv_bplimo", avanix_inv_bplimo],
	["avanix_inv_bplimosport", avanix_inv_bplimosport],
	["avanix_inv_bpoffroad", avanix_inv_bpoffroad],
	["avanix_inv_bpoffroadr", avanix_inv_bpoffroadr],
	["avanix_inv_bpsuv", avanix_inv_bpsuv],
	["avanix_inv_bpvan", avanix_inv_bpvan],
	["avanix_inv_bpzamak", avanix_inv_bpzamak],
	["avanix_inv_bptempest", avanix_inv_bptempest],
	["avanix_inv_bphemtt", avanix_inv_bphemtt],
	["avanix_inv_bphunter", avanix_inv_bphunter],
	["avanix_inv_bpifrit", avanix_inv_bpifrit],
	["avanix_inv_bpm900", avanix_inv_bpm900],
	["avanix_inv_bporca", avanix_inv_bporca],
	["avanix_inv_bpmohawk", avanix_inv_bpmohawk],
	["avanix_inv_bphellcat", avanix_inv_bphellcat],
	["avanix_inv_bptaru", avanix_inv_bptaru],
	["avanix_inv_bphuron", avanix_inv_bphuron],
	["avanix_inv_bpsdv", avanix_inv_bpsdv],
	["avanix_inv_bpboat", avanix_inv_bpboat],
	
	//Waffenteile
	["avanix_inv_lowerreceiver", avanix_inv_lowerreceiver],
	["avanix_inv_zubrframe", avanix_inv_zubrframe],
	["avanix_inv_lauf9mm", avanix_inv_lauf9mm],
	["avanix_inv_lauf45", avanix_inv_lauf45],
	["avanix_inv_lauf65", avanix_inv_lauf65],
	["avanix_inv_lauf127", avanix_inv_lauf127],
	["avanix_inv_lauf556", avanix_inv_lauf556],
	["avanix_inv_lauf762", avanix_inv_lauf762],
	["avanix_inv_lauf93", avanix_inv_lauf93],
	["avanix_inv_lauf338", avanix_inv_lauf338],
	["avanix_inv_rollenverschluss", avanix_inv_rollenverschluss],
	["avanix_inv_rook40schlitten", avanix_inv_rook40schlitten],
	["avanix_inv_acpc2schlitten", avanix_inv_acpc2schlitten],
	["avanix_inv_4fiveschlitten", avanix_inv_4fiveschlitten],
	["avanix_inv_p07schlitten", avanix_inv_p07schlitten],
	["avanix_inv_trommel45acp6rnd", avanix_inv_trommel45acp6rnd],
	["avanix_inv_drehkopfverschluss", avanix_inv_drehkopfverschluss],
	["avanix_inv_gasdrucksystem", avanix_inv_gasdrucksystem],
	["avanix_inv_rueckstossfeder", avanix_inv_rueckstossfeder],
	["avanix_inv_verzoegertermasseverschluss", avanix_inv_verzoegertermasseverschluss],
	["avanix_inv_unverriegekltermasseverschluss", avanix_inv_unverriegekltermasseverschluss],
	["avanix_inv_picatinnyschiene", avanix_inv_picatinnyschiene],
	["avanix_inv_bullpupgearbox", avanix_inv_bullpupgearbox],
	["avanix_inv_tragegriff", avanix_inv_tragegriff],
	["avanix_inv_eichsystem", avanix_inv_eichsystem],
	["avanix_inv_dichtungssystem", avanix_inv_dichtungssystem],
	["avanix_inv_kurzergaskolben", avanix_inv_kurzergaskolben],
	["avanix_inv_geradezugverschluss", avanix_inv_geradezugverschluss],
	["avanix_inv_zylinderverschluss", avanix_inv_zylinderverschluss]
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(call avanix_save_yinv) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

avanix_gear = _return;
