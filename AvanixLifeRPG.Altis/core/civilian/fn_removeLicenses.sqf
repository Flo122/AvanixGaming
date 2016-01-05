/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		license_civ_schwarzmarkt = false;
	};
	
	//Jail licenses
	case 1:
	{
		license_civ_gun = false;
		license_civ_schwarzmarkt = false;
		license_civ_heroin = false;
		license_civ_hanf = false;
		license_civ_uran = false;
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then {
			license_civ_driver = false;
			license_civ_air = false;
			license_civ_truck = false;
			license_civ_boat = false;
			hint "Du hast einige deiner Führerscheine durch fahrlässige Tötung mit einem Fahrzeug verloren.";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			license_civ_gun = false;
			hint "Du hast deinen Waffenschein wegen Mordes verloren.";
		};
	};
	
	case 4:
    {
        if(license_civ_driver) then {
            license_civ_driver = false;
            hint "Dir wurde deine Fahrlizenz entzogen.";
        };
    };

	case 11:
	{
		license_civ_truck = false;
		hint "Dir wurde dein LKW Führerschein abgenommen.";
	};

	case 12:
	{
		license_civ_air = false;
		hint "Dir wurde dein Pilotenschein abgenommen.";
	};

	case 13:
	{
		license_civ_boat = false;
		hint "Dir wurde dein Bootschein abgenommen.";
	};

	case 14:
	{
		license_civ_dive = false;
		hint "Dir wurde dein Taucherschein abgenommen.";
	};

	case 15:
	{
		license_civ_transport = false;
		hint "Dir wurde deine Transportlizenz abgenommen.";
	};
	
	case 16:
	{
		license_civ_driver = false;
		license_civ_truck = false;
		license_civ_air = false;
		license_civ_boat = false;
		license_civ_air = false;
		license_civ_transport = false;
		hint "Dir wurde deine Führscheine abgenommen.";
	};
	
	case 17:
	{
		license_civ_gun = false;
		hint "Dir wurde dein Waffenschein abgenommen.";
	};
};