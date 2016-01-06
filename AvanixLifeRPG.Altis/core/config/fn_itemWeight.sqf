/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	//Sonstige Items
	case "rabbit": {1};
	case "water": {1};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelF": {30};
	case "fuelE": {30};
	case "pickaxe": {2};
	case "axt": {2};
	case "tbacon": {1};
	case "lockpick": {1};
	case "redgull": {1};
	case "blastingcharge": {20};
	case "crowbar": {3};
	case "boltcutter": {3};
	case "defusekit": {5};
	case "kidney": {10};
	case "scalpel": {1};
	case "gpstracker": {2};
	case "kabelbinder": {1};
	case "truckstorage": {20};
	case "speedtrap": {5};
	case "speedtrapdetector": {3};
	case "laptop": {5};
	case "fuelManipulator": {7};
	case "fuelPipe": {3};
	case "blaulicht": {20};
	case "batterie": {2};
	
	//Objects
	case "barriere_g": {0};
	case "pylone": {0};
	case "schranke": {0};
	case "spikeStrip": {0};
	case "barriere_k": {0};
	case "strahler": {0};
	case "target": {0};
	case "sandsack": {0};
	case "bunker": {0};
	case "medhouse": {0};
	
	//Housing
	case "storagesmall": {20};
	case "storagebig": {30};
	case "methkueche": {20};
	case "burglartool": {2};
	case "alarmsystem": {2};
	case "alarmsystemGPS": {2};
	case "alarmsystemDog": {5};
	case "alarmsystemGuard": {6};  
	case "metalGrilledWindow": {8};  
	case "spytoolkit": {2};
			
	//Fisch Items
	case "salema": {1};
	case "ornate": {1};
	case "mackerel": {1};
	case "tuna": {1};
	case "mullet": {1};
	case "catshark": {1};
	case "turtle": {1};
			
	//Minen Items
	case "sand": {4};
	case "glass": {2};
	case "panzerglass": {3};
	case "rock": {6};
	case "cement": {4};
	case "beton": {5};
	case "copper": {3};
	case "copper_r": {2};
	case "electro": {2};
	case "iron": {4};
	case "iron_r": {3};
	case "stahl": {4};
	case "blei": {5};
	case "blei_r": {5};
	case "dino": {40};
	case "gold": {3};
	case "goldnuggets": {3};
	case "goldbar": {8};
			
	//Legal Job Items
	case "mango": {1};
	case "ananas": {1};
	case "salt": {3};
	case "salt_r": {2};
	case "zuckerrohr": {3};
	case "zucker": {2};
	case "holz": {4};
	case "holzscheit": {3};
	case "holzkohle": {2};
	case "rohoel": {3};
	case "erdoel": {3};
	case "plastik": {2};
	case "benzin": {3};
	case "diesel": {3};
	case "kerosin": {3};
	case "baumwolle": {2};
	case "stoff": {4};
			
	//Illegal Job Items
	case "hanf": {4};
	case "marijuana": {2};
	case "med_merijuana": {2};
	case "opium": {4};
	case "heroin": {3};
	case "morphine": {2};
	case "pseudoephedrin": {2};
	case "phenylaceton": {4};
	case "natriumamalgam": {4};
	case "meth": {2};
	case "moonschine": {4};
	case "uranu": {6};
	case "uranp": {5};
	
	//Waffen Baupläne
	case "bprook40": {0};
	case "bpacpc2": {0};
	case "bpzubr45": {0};
	case "bpp07": {0};
	case "bpsignal": {0};
	case "bp4five": {0};
	case "bppdw2000": {0};
	case "bpvermin": {0};
	case "bpsting": {0};
	case "bpsdar": {0};
	case "bptrg20": {0};
	case "bpkatiba": {0};
	case "bprahim": {0};
	case "bpzafir": {0};
	case "bpgm6lynx": {0};
	case "bpasp1": {0};
	case "bpcyrus": {0};
	case "bpmar10": {0};
	case "bpmk1": {0};
	case "bpmk14": {0};
	case "bpmk200": {0};
	case "bplrr": {0};
	case "bpmk18": {0};
	case "bpmk20": {0};
	
	//Fahrzeug Baupläne
	case "bpquad": {0};
	case "bplimo": {0};
	case "bplimosport": {0};
	case "bpoffroad": {0};
	case "bpoffroadr": {0};
	case "bpsuv": {0};
	case "bpvan": {0};
	case "bpzamak": {0};
	case "bptempest": {0};
	case "bphemtt": {0};
	case "bphunter": {0};
	case "bpifrit": {0};
	case "bpm900": {0};
	case "bporca": {0};
	case "bpmohawk": {0};
	case "bphellcat": {0};
	case "bptaru": {0};
	case "bphuron": {0};
	case "bpsdv": {0};
	case "bpboat": {0};
	
	//Waffenteile
	case "lowerreceiver": {1};
	case "zubrframe": {1};
	case "lauf9mm": {1};
	case "lauf45": {1};
	case "lauf65": {1};
	case "lauf127": {1};
	case "lauf556": {1};
	case "lauf762": {1};
	case "lauf93": {1};
	case "lauf338": {1};
	case "rollenverschluss": {1};
	case "rook40schlitten": {1};
	case "acpc2schlitten": {1};
	case "4fiveschlitten": {1};
	case "p07schlitten": {1};
	case "trommel45acp6rnd": {1};
	case "drehkopfverschluss": {1};
	case "gasdrucksystem": {1};
	case "rueckstossfeder": {1};
	case "verzoegertermasseverschluss": {1};
	case "unverriegekltermasseverschluss": {1};
	case "picatinnyschiene": {1};
	case "bullpupgearbox": {1};
	case "tragegriff": {1};
	case "eichsystem": {1};
	case "dichtungssystem": {1};
	case "kurzergaskolben": {1};
	case "geradezugverschluss": {1};
	case "zylinderverschluss": {1};
	default {1};
};
