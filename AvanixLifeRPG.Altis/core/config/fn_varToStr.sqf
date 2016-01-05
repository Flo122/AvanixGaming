/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	/*-------------------------Virtuelle Items-------------------------*/
	//Sonstige Items
	case "avanix_inv_rabbit": {"Hasenfleisch"};
	case "avanix_inv_water": {"Wasserflasche"};
	case "avanix_inv_donuts": {"Donut"};
	case "avanix_inv_coffee": {"Kaffee"};
	case "avanix_inv_fuelF": {"Voller Benzinkanister"};
	case "avanix_inv_fuelE": {"Leerer Benzinkanister"};
	case "avanix_inv_pickaxe": {"Spitzhacke"};
	case "avanix_inv_axt": {"Holzfälleraxt"};
	case "avanix_inv_tbacon": {"Speck"};
	case "avanix_inv_lockpick": {"Dietrich"};
	case "avanix_inv_redgull": {"Avanix Energy"};
	case "avanix_inv_blastingcharge": {"Sprengstoff"};
	case "avanix_inv_crowbar": {"Brecheisen"};
	case "avanix_inv_boltcutter": {"Bolzenschneider"};
	case "avanix_inv_defusekit": {"Entschärfungskit"};
	case "avanix_inv_kidney": {"Niere"};
	case "avanix_inv_scalpel": {"Messer"};
	case "avanix_inv_gpstracker": {"GPS Tracker"};
	case "avanix_inv_kabelbinder": {"Kabelbinder"};
	case "avanix_inv_truckstorage": {"LKW Erweiterung"};
	case "avanix_inv_speedtrap": {"Radarfalle"};    
	case "avanix_inv_speedtrapdetector": {"Radarwarner"};
	case "avanix_inv_laptop": {"Laptop"};
	case "avanix_inv_fuelManipulator": {"Tank Manipulator"};    
	case "avanix_inv_fuelPipe": {"Benzinschlauch"};
	case "avanix_inv_blaulicht": {"Blaulicht"};
	case "avanix_inv_batterie": {"Batterie"};
	
	//Objects
	case "avanix_inv_barriere_g": {"Barriere Gross"};
	case "avanix_inv_pylone": {"Pylone"};
	case "avanix_inv_schranke": {"Schranke"};
	case "avanix_inv_spikeStrip": {"Nagelkette"};
	case "avanix_inv_barriere_k": {"Barriere Klein"};
	case "avanix_inv_strahler": {"Strahler"};
	case "avanix_inv_target": {"Trainingsziel"};
	case "avanix_inv_sandsack": {"Sandsackmauer"};
	case "avanix_inv_bunker": {"Bunker"};
	case "avanix_inv_medhouse": {"Container"};
	
	//Housing
	case "avanix_inv_storagesmall": {"Kleine Lagerbox"};
	case "avanix_inv_storagebig": {"Große Lagerbox"};
	case "avanix_inv_methkueche": {"Methküche"};
	case "avanix_inv_burglartool": {"Einbrecherwerkzeug"};
	case "avanix_inv_alarmsystem": {"Hausalarmanlage"};
	case "avanix_inv_alarmsystemGPS": {"GPS-Sender für Alarmanlage"};
	case "avanix_inv_alarmsystemDog": {"Wachhund"};
	case "avanix_inv_alarmsystemGuard": {"Wachmann"};    
	case "avanix_inv_metalGrilledWindow": {"vergitterte Fenster"};    
	case "avanix_inv_spytoolkit": {"Spion Werkzeuge"}; 
	
	//Fisch Items
	case "avanix_inv_salema": {"Goldstrieme"};
	case "avanix_inv_ornate": {"Hecht"};
	case "avanix_inv_mackerel": {"Makrele"};
	case "avanix_inv_tuna": {"Thunfisch"};
	case "avanix_inv_mullet": {"Meeräsche"};
	case "avanix_inv_catshark": {"Katzenhai"};
	case "avanix_inv_turtle": {"Schildkröte"};
	
	//Minen Items
	case "avanix_inv_sand": {"Sand"};
	case "avanix_inv_glass": {"Glass"};
	case "avanix_inv_panzerglass": {"Panzerglass"};
	case "avanix_inv_rock": {"Stein"};
	case "avanix_inv_cement": {"Zement"};
	case "avanix_inv_beton": {"Beton"};
	case "avanix_inv_copper": {"Kupfererz"};
	case "avanix_inv_copper_r": {"Kupferbarren"};
	case "avanix_inv_electro": {"Elektronikbauteil"};
	case "avanix_inv_iron": {"Eisenerz"};
	case "avanix_inv_iron_r": {"Eisenbarren"};
	case "avanix_inv_stahl": {"Stahl"};
	case "avanix_inv_blei": {"Bleierz"};
	case "avanix_inv_blei_r": {"Bleibarren"};
	case "avanix_inv_dino": {"Dinosaurierknochen"};
	case "avanix_inv_gold": {"Golderz"};
	case "avanix_inv_goldnuggets": {"Goldnuggets"};
	case "avanix_inv_goldbar": {"Goldbarren"};
	
	//Legal Job Items
	case "avanix_inv_mango": {"Mango"};
	case "avanix_inv_ananas": {"Ananas"};
	case "avanix_inv_salt": {"Salzkristall"};
	case "avanix_inv_salt_r": {"Salz"};
	case "avanix_inv_zuckerrohr": {"Zuckerrohr"};
	case "avanix_inv_zucker": {"Zucker"};
	case "avanix_inv_holz": {"Holz"};
	case "avanix_inv_holzscheit": {"Holzscheit"};
	case "avanix_inv_holzkohle": {"Holzkohle"};
	case "avanix_inv_rohoel": {"Rohöl"};
	case "avanix_inv_erdoel": {"Erdöl"};
	case "avanix_inv_plastik": {"Plastik"};
	case "avanix_inv_benzin": {"Benzin"};
	case "avanix_inv_diesel": {"Diesel"};
	case "avanix_inv_kerosin": {"Kerosin"};
	case "avanix_inv_baumwolle": {"Baumwolle"};
	case "avanix_inv_stoff": {"Stoff"};
	
	//Illegal Job Items
	case "avanix_inv_hanf": {"Hanfblätter"};
	case "avanix_inv_marijuana": {"Marijuana"};
	case "avanix_inv_med_merijuana": {"Medizinisches Marijuana"};
	case "avanix_inv_opium": {"Opium"};
	case "avanix_inv_heroin": {"Heroin"};
	case "avanix_inv_morphine": {"Morphium"};
	case "avanix_inv_pseudoephedrin": {"Pseudiephedrin"};
	case "avanix_inv_phenylaceton": {"Phenylaceton"};
	case "avanix_inv_natriumamalgam": {"Natriumamalgam"};
	case "avanix_inv_meth": {"Crystal Meth"};
	case "avanix_inv_moonschine": {"Moonshine"};
	case "avanix_inv_uranu": {"Radioaktives Material"};
	case "avanix_inv_uranp": {"Angereichertes Uran"};
	
	//Waffen Baupläne
	case "avanix_inv_bprook40": {"Bauplan Rook40"};
	case "avanix_inv_bpacpc2": {"Bauplan ACP-C2"};
	case "avanix_inv_bpzubr45": {"Bauplan Zubr.45"};
	case "avanix_inv_bpp07": {"Bauplan P07"};
	case "avanix_inv_bpsignal": {"Bauplan Signalpistole"};
	case "avanix_inv_bp4five": {"Bauplan 4Five"};
	case "avanix_inv_bppdw2000": {"Bauplan PDW 2000"};
	case "avanix_inv_bpvermin": {"Bauplan Vermin"};
	case "avanix_inv_bpsting": {"Bauplan Sting"};
	case "avanix_inv_bpsdar": {"Bauplan SDAR"};
	case "avanix_inv_bptrg20": {"Bauplan TRG-20"};
	case "avanix_inv_bpkatiba": {"Bauplan Katiba"};
	case "avanix_inv_bprahim": {"Bauplan Rahim"};
	case "avanix_inv_bpzafir": {"Bauplan Zafir"};
	case "avanix_inv_bpgm6lynx": {"Bauplan GM6 Lynx"};
	case "avanix_inv_bpasp1": {"Bauplan ASP-1"};
	case "avanix_inv_bpcyrus": {"Bauplan Cyrus"};
	case "avanix_inv_bpmar10": {"Bauplan MAR-10"};
	case "avanix_inv_bpmk1": {"Bauplan MK-1"};
	case "avanix_inv_bpmk14": {"Bauplan MK-14"};
	case "avanix_inv_bpmk200": {"Bauplan MK-200"};
	case "avanix_inv_bplrr": {"Bauplan LRR"};
	case "avanix_inv_bpmk18": {"Bauplan MK-18"};
	case "avanix_inv_bpmk20": {"Bauplan MK-20"};
	
	//Fahrzeug Baupläne
	case "avanix_inv_bpquad": {"Bauplan Quad"};
	case "avanix_inv_bplimo": {"Bauplan Limo"};
	case "avanix_inv_bplimosport": {"Bauplan Limo Sport"};
	case "avanix_inv_bpoffroad": {"Bauplan Offroad"};
	case "avanix_inv_bpoffroadr": {"Bauplan Rebellenoffroad"};
	case "avanix_inv_bpsuv": {"Bauplan Suv"};
	case "avanix_inv_bpvan": {"Bauplan Van"};
	case "avanix_inv_bpzamak": {"Bauplan Zamak"};
	case "avanix_inv_bptempest": {"Bauplan Tempest"};
	case "avanix_inv_bphemtt": {"Bauplan Hemtt"};
	case "avanix_inv_bphunter": {"Bauplan Hunter"};
	case "avanix_inv_bpifrit": {"Bauplan Ifrit"};
	case "avanix_inv_bpm900": {"Bauplan M900"};
	case "avanix_inv_bporca": {"Bauplan Orca"};
	case "avanix_inv_bpmohawk": {"Bauplan Mohawk"};
	case "avanix_inv_bphellcat": {"Bauplan Hellcat"};
	case "avanix_inv_bptaru": {"Bauplan Taru"};
	case "avanix_inv_bphuron": {"Bauplan Huron"};
	case "avanix_inv_bpsdv": {"Bauplan SDV"};
	case "avanix_inv_bpboat": {"Bauplan Boot"};
	
	//Waffenteile
	case "avanix_inv_lowerreceiver": {"Lower Receiver"};
	case "avanix_inv_zubrframe": {"Zubr Frame"};
	case "avanix_inv_lauf9mm": {"Lauf 9mm"};
	case "avanix_inv_lauf45": {"Lauf 45mm"};
	case "avanix_inv_lauf65": {"Lauf 6,5mm"};
	case "avanix_inv_lauf127": {"Lauf 12,7mm"};
	case "avanix_inv_lauf556": {"Lauf 5,56mm"};
	case "avanix_inv_lauf762": {"Lauf 7,62mm"};
	case "avanix_inv_lauf93": {"Lauf 9,3mm"};
	case "avanix_inv_lauf338": {"Lauf .338"};
	case "avanix_inv_rollenverschluss": {"Rollenverschluss"};
	case "avanix_inv_rook40schlitten": {"Rook40 Schlitten"};
	case "avanix_inv_acpc2schlitten": {"ACP-C2 Schlitten"};
	case "avanix_inv_4fiveschlitten": {"4five Schlitten"};
	case "avanix_inv_p07schlitten": {"P07 Schlitten"};
	case "avanix_inv_trommel45acp6rnd": {"Trommel 45 ACP 6Rnd"};
	case "avanix_inv_drehkopfverschluss": {"Drehkopfverschluss"};
	case "avanix_inv_gasdrucksystem": {"Gasdrucksystem"};
	case "avanix_inv_rueckstossfeder": {"Rückstossfeder"};
	case "avanix_inv_verzoegertermasseverschluss": {"Verzoegerter Masseverschluss"};
	case "avanix_inv_unverriegekltermasseverschluss": {"Unverriegeklter Masseverschluss"};
	case "avanix_inv_picatinnyschiene": {"Picatinnyschiene"};
	case "avanix_inv_bullpupgearbox": {"Bullpup Gearbox"};
	case "avanix_inv_tragegriff": {"Tragegriff"};
	case "avanix_inv_eichsystem": {"Eichsystem"};
	case "avanix_inv_dichtungssystem": {"Dichtungssystem"};
	case "avanix_inv_kurzergaskolben": {"Kurzer Gaskolben"};
	case "avanix_inv_geradezugverschluss": {"Geradezugverschluss"};
	case "avanix_inv_zylinderverschluss": {"Zylinderverschluss"};
	
	/*-------------------------License Block-------------------------*/
	//Führerscheine
	case "license_civ_driver": {"Führerschein"};
	case "license_civ_truck": {"LKW Führerschein"};
	case "license_civ_boat": {"Bootsschein"};
	case "license_civ_air": {"Pilotenschein"};
	case "license_civ_dive": {"Taucherschein"};
	case "license_civ_transport": {"Transportlizenz"};
	case "license_civ_taxi": {"Taxischein"};
			
	//Verarbeitungslizenzen Legal
	case "license_civ_salt": {"Salz Verarbeitung"};
	case "license_civ_zucker": {"Zucker Verarbeitung"};
	case "license_civ_holz": {"Holz Verarbeitung"};
	case "license_civ_rohoel": {"Öl Verarbeitung"};
	case "license_civ_baumwolle": {"Baumwollverarbeitung"};
	case "license_civ_sand": {"Sand Verarbeitung"};
	case "license_civ_rock": {"Zement Verarbeitung"};
	case "license_civ_copper": {"Kupfer Verarbeitung"};
	case "license_civ_iron": {"Eisen Verarbeitung"};
	case "license_civ_blei": {"Blei Verarbeitung"};
	case "license_civ_gold": {"Gold Verarbeitung"};
	case "license_civ_treibstoff": {"Treibstoff Verarbeitung"};
			
	//Verarbeitungslizenzen Illegal
	case "license_civ_heroin": {"Heroin Verarbeitung"};
	case "license_civ_hanf": {"Marijuana Verarbeitung"};
			
	//Sonstige Lizenzen
	case "license_civ_gun": {"Waffenschein"};
	case "license_civ_schwarzmarkt": {"Schwarzmarktlizenz"};
};
