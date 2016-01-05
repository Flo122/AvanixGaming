/*
	Description:
	Loops through a list of variables and checks whether
	or not they are defined, if they are defined then trigger
	spyglass and kick the client to the lobby.
*/
private["_vars"];
_vars = [
	"avanix_revive_fee","avanix_gangPrice","avanix_gangUpgradeBase","avanix_enableFatigue","avanix_paycheck_period","avanix_vShop_rentalOnly","sell_array","buy_array",
	"avanix_weapon_shop_array","avanix_garage_prices","avanix_garage_sell","avanix_houseLimit","avanix_gangUpgradeMultipler","avanix_impound_car","avanix_impound_boat",
	"avanix_impound_air"
];

{
	if(!isNil {(missionNamespace getVariable _x)}) exitWith {
		[[profileName,getPlayerUID player,format["VariableSetBeforeInitialized_%1",_x]],"SPY_fnc_cookieJar",false,false] call avanix_fnc_MP;
		[[profileName,format["Variable set before client initialized: %1",_x]],"SPY_fnc_notifyAdmins",true,false] call avanix_fnc_MP;
		uisleep 0.5;
		["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	};
} foreach _vars;