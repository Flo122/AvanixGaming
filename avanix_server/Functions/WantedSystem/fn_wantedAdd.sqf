/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Unfall mit Totesfolge",15000]};
	case "187": {_type = ["Mord",25000]};
	case "901": {_type = ["Gefängnisausbruch",10000]};
	case "261": {_type = ["Vergewaltigung",5000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Versuchte Vergewaltigung",3000]};
	case "215": {_type = ["Versuchter Autodiebstahl",5000]};
	case "213": {_type = ["Verwenden illegaler Sprengstoffe",20000]};
	case "211": {_type = ["Raub",5000]};
	case "207": {_type = ["Entführung",25000]};
	case "207A": {_type = ["Versuchte Entführung",10000]};
	case "208": {_type = ["Foltern",25000]};
	case "487": {_type = ["Autodiebstahl",5000]};
	case "488": {_type = ["Autodiebstahl",5000]};
	case "480": {_type = ["Fahrerflucht",25000]};
	case "481": {_type = ["Besitz von BTM",5000]};
	case "482": {_type = ["Versuchter Handel mit BTM",10000]};
	case "483": {_type = ["Handeln mit BTM",20000]};
	case "459": {_type = ["Einbruch",10000]};
	case "488": {_type = ["Illegales Glückspiel",5000]};
	case "501": {_type = ["ADAC Geprellt",10000]};
	case "502": {_type = ["Notarzt Geprellt",10000]};
	case "919": {_type = ["Organ Handel",30000]};
	case "233": {_type = ["Illegaler Fahrzeughandel",25000]};
	case "234": {_type = ["Überhöhte Geschwindigkeit",5000]};
	case "235": {_type = ["Hacken",2500]};
	case "236": {_type = ["Menschenhandel",100000]};
	case "237": {_type = ["Geldwäsche",100000]};
	
	case "1": {_type = ["Fahren ohne PKW Führerschein",2500]};
    case "2": {_type = ["Fahren ohne LKW Führerschein",5000]};
    case "3": {_type = ["Fahren ohne Boots Führerschein",3000]};
    case "4": {_type = ["Fliegen ohne Pilotenschein",30000]};
    case "5": {_type = ["Transportieren ohne Transportlizenz",100000]};
    case "6": {_type = ["Konsum von BTM",5000]};
    case "7": {_type = ["Besitz von BTM",5000]};
    case "8": {_type = ["Handeln mit BTM",20000]};
    case "9": {_type = ["Versuchter Diebstahl/Raub",5000]};
    case "10": {_type = ["Versuchter Diebstahl eines PKW",5000]};
    case "11": {_type = ["Versuchter Diebstahl eines LKW",10000]};
    case "12": {_type = ["Versuchter Diebstahl eines Helikopter",15000]};
    case "13": {_type = ["Versuchter Diebstahl eines Boot",5000]};
    case "14": {_type = ["Diebstahl eines PKW",25000]};
    case "15": {_type = ["Diebstahl eines LKW",50000]};
    case "16": {_type = ["Diebstahl eines Helikopter",100000]};
    case "17": {_type = ["Diebstahl eines Bootes",10000]};
    case "18": {_type = ["Diebstahl von Organen",30000]};
    case "19": {_type = ["Diebstahl von Eigenbesitz",25000]};
    case "20": {_type = ["Einbruch von Häusern",10000]};
    case "21": {_type = ["Aufbrechen von Geldautomaten",25000]};
    case "22": {_type = ["Raubüberfall von Tankstellen",50000]};
    case "23": {_type = ["Raubüberfall von den Goldreserven",100000]};
    case "24": {_type = ["Beleidigung von Personen und Gruppen",5000]};
    case "25": {_type = ["Belästigung von Personen und Gruppen",2500]};
    case "26": {_type = ["Missachtung Polizeilicer Anordnung",10000]};
    case "27": {_type = ["Wiederstand gegen die Staatsgewalt",25000]};
    case "28": {_type = ["Ausbruch aus dem Gefängnis",50000]};
    case "29": {_type = ["Illegales Glücksspiel",5000]};
    case "30": {_type = ["Prellen von ADAC Rechnungen",10000]};
    case "31": {_type = ["Prellen von Arzt Rechnungen",10000]};
    case "32": {_type = ["Angriff oder Belagerungen von Rebellen",50000]};
    case "33": {_type = ["Betreten des Polizeigelände",5000]};
    case "34": {_type = ["Betreten von Drogenanbau - Verarbeitungsgebieten",25000]};
    case "35": {_type = ["Betreten des Geländes der Goldreserven",20000]};
    case "36": {_type = ["Betreten von Ganggebieten",5000]};
    case "37": {_type = ["Betreten von Urananbau - Verarbeitungsgebieten",25000]};
    case "38": {_type = ["Betreten vom Gebiet des Schwarzmarkt",50000]};
    case "39": {_type = ["Offenes Tragen von Waffen innerhalb von Städten",10000]};
    case "40": {_type = ["Waffenbesitz ohne Waffenschein",20000]};
	case "41": {_type = ["Besitz von Illegalen Waffen",50000]};
	case "42": {_type = ["Beschuss von Personen",100000]};
	case "43": {_type = ["Mord",50000]};
	case "44": {_type = ["Verwenden von Illegalen Sprengstoff",20000]};
	case "45": {_type = ["Waffengebrauch innerhalb von Städten",10000]};
	case "46": {_type = ["Foltern von Personen",25000]};
	case "47": {_type = ["Entführung von Personen",25000]};
	case "48": {_type = ["Menschenhandel",100000]};
	case "49": {_type = ["Führen von Illegalen Fahrzeugen",50000]};
	case "50": {_type = ["Besitz von Illegalen Items",10000]};
	case "51": {_type = ["Handeln von Illegalen Gegenständen",25000]};
	case "52": {_type = ["Tragen von Rebellenkleidung",10000]};
	case "53": {_type = ["Fahren/Fliegen ohne Licht",5000]};
	case "54": {_type = ["Fliegen ohne Kollisionslichter",10000]};
	case "55": {_type = ["Fahren auf der falschen Strassenseite",5000]};
	case "56": {_type = ["Fahren abseits der Strasse",10000]};
	case "57": {_type = ["Missachtung der StVo",5000]};
	case "58": {_type = ["Verursachen eines Unfalls",15000]};
	case "59": {_type = ["Fahrerflucht",25000]};
	case "60": {_type = ["Anfahren von Personen",20000]};
	case "61": {_type = ["10-20 Km/h Geschw.Überschreitung",5000]};
	case "62": {_type = ["21-30 Km/h Geschw.Überschreitung",10000]};
	case "63": {_type = ["31-50 Km/h Geschw.Überschreitung",15000]};
	case "64": {_type = ["+51 Km/h Geschw.Überschreitung",25000]};
	case "65": {_type = ["Versuchtes Landen in einer Flugverbotszone",15000]};
	case "66": {_type = ["Landen in einer Flugverbotszone",25000]};
	case "67": {_type = ["Fliegen auf einer Höhe unter 150m",10000]};
	case "68": {_type = ["Fahren/Fliegen unter Alkohol",10000]};
	case "69": {_type = ["Fahren/Fliegen unter Drogen",15000]};
	case "70": {_type = ["Hacken von Blitzeranlagen",2500]};
	case "71": {_type = ["Permanentes Hupen",1000]};
	case "72": {_type = ["Absperren von Strassen",5000]};
	case "73": {_type = ["Illegaler Fahrzeughandel",25000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,avanix_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = avanix_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	avanix_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	avanix_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};