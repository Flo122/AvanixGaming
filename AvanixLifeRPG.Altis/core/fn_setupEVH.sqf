/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn avanix_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call avanix_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call avanix_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call avanix_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call avanix_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call avanix_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call avanix_fnc_inventoryOpened}];
"avanix_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call avanix_fnc_MPexec;};