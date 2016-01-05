/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	//Führerscheine
	case "driver": {1000};
	case "truck": {25000};
	case "boat": {1000};
	case "pilot": {30000};
	case "dive": {5000};
	case "transport": {250000};
	case "taxi": {80000};
	
	//Verarbeitungslizenzen Legal
	case "salt": {28400};;
	case "zucker": {27900};
	case "holz": {24800};
	case "rohoel": {24000};
	case "baumwolle": {25200};
	case "sand": {22100};
	case "rock": {22400};
	case "copper": {23100};
	case "iron": {24300};
	case "blei": {24900};
	case "gold": {36900};
	case "treibstoff": {62700};
			
	//Verarbeitungslizenzen Illegal
	case "heroin": {84000};
	case "hanf": {92000};
	
	//Sonstige Lizenzen
	case "gun": {100000};
	case "schwarzmarkt": {2000000};
};