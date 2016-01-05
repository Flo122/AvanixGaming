/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			//Sonstige Items
			case "rabbit": {"avanix_inv_rabbit"};
			case "water": {"avanix_inv_water"};
			case "donuts": {"avanix_inv_donuts"};
			case "coffee": {"avanix_inv_coffee"};
			case "fuelF": {"avanix_inv_fuelF"};
			case "fuelE": {"avanix_inv_fuelE"};
			case "pickaxe": {"avanix_inv_pickaxe"};
			case "axt": {"avanix_inv_axt"};
			case "tbacon": {"avanix_inv_tbacon"};
			case "lockpick": {"avanix_inv_lockpick"};
			case "redgull": {"avanix_inv_redgull"};
			case "blastingcharge": {"avanix_inv_blastingcharge"};
			case "crowbar": {"avanix_inv_crowbar"};
			case "boltcutter": {"avanix_inv_boltcutter"};
			case "defusekit": {"avanix_inv_defusekit"};
			case "kidney": {"avanix_inv_kidney"};
			case "scalpel": {"avanix_inv_scalpel"};
			case "gpstracker": {"avanix_inv_gpstracker"};
			case "kabelbinder": {"avanix_inv_kabelbinder"};
			case "truckstorage": {"avanix_inv_truckstorage"};
			case "speedtrap": {"avanix_inv_speedtrap"};
			case "speedtrapdetector": {"avanix_inv_speedtrapdetector"};
			case "laptop": {"avanix_inv_laptop"};
			case "fuelManipulator": {"avanix_inv_fuelManipulator"};
			case "fuelPipe": {"avanix_inv_fuelPipe"};
			case "blaulicht": {"avanix_inv_blaulicht"};
			case "batterie": {"avanix_inv_batterie"};
			
			//Objects
			case "barriere_g": {"avanix_inv_barriere_g"};
			case "pylone": {"avanix_inv_pylone"};
			case "schranke": {"avanix_inv_schranke"};
			case "spikeStrip": {"avanix_inv_spikeStrip"};
			case "barriere_k": {"avanix_inv_barriere_k"};
			case "strahler": {"avanix_inv_strahler"};
			case "target": {"avanix_inv_target"};
			case "sandsack": {"avanix_inv_sandsack"};
			case "bunker": {"avanix_inv_bunker"};
			case "medhouse": {"avanix_inv_medhouse"};
			
			//Housing
			case "storagesmall": {"avanix_inv_storagesmall"};
			case "storagebig": {"avanix_inv_storagebig"};
			case "methkueche": {"avanix_inv_methkueche"};
			case "burglartool": {"avanix_inv_burglartool"};
			case "alarmsystem": {"avanix_inv_alarmsystem"};
			case "alarmsystemGPS": {"avanix_inv_alarmsystemGPS"};
			case "alarmsystemDog": {"avanix_inv_alarmsystemDog"};
			case "alarmsystemGuard": {"avanix_inv_alarmsystemGuard"};   
			case "metalGrilledWindow": {"avanix_inv_metalGrilledWindow"};   
			case "spytoolkit": {"avanix_inv_spytoolkit"};
			
			//Fisch Items
			case "salema": {"avanix_inv_salema"};
			case "ornate": {"avanix_inv_ornate"};
			case "mackerel": {"avanix_inv_mackerel"};
			case "tuna": {"avanix_inv_tuna"};
			case "mullet": {"avanix_inv_mullet"};
			case "catshark": {"avanix_inv_catshark"};
			case "turtle": {"avanix_inv_turtle"};
			
			//Minen Items
			case "sand": {"avanix_inv_sand"};
			case "glass": {"avanix_inv_glass"};
			case "panzerglass": {"avanix_inv_panzerglass"};
			case "rock": {"avanix_inv_rock"};
			case "cement": {"avanix_inv_cement"};
			case "beton": {"avanix_inv_beton"};
			case "copper": {"avanix_inv_copper"};
			case "copper_r": {"avanix_inv_copper_r"};
			case "electro": {"avanix_inv_electro"};
			case "iron": {"avanix_inv_iron"};
			case "iron_r": {"avanix_inv_iron_r"};
			case "stahl": {"avanix_inv_stahl"};
			case "blei": {"avanix_inv_blei"};
			case "blei_r": {"avanix_inv_blei_r"};
			case "dino": {"avanix_inv_dino"};
			case "gold": {"avanix_inv_gold"};
			case "goldnuggets": {"avanix_inv_goldnuggets"};
			case "goldbar": {"avanix_inv_goldbar"};
			
			//Legal Job Items
			case "mango": {"avanix_inv_mango"};
			case "ananas": {"avanix_inv_ananas"};
			case "salt": {"avanix_inv_salt"};
			case "salt_r": {"avanix_inv_salt_r"};
			case "zuckerrohr": {"avanix_inv_zuckerrohr"};
			case "zucker": {"avanix_inv_zucker"};
			case "holz": {"avanix_inv_holz"};
			case "holzscheit": {"avanix_inv_holzscheit"};
			case "holzkohle": {"avanix_inv_holzkohle"};
			case "rohoel": {"avanix_inv_rohoel"};
			case "erdoel": {"avanix_inv_erdoel"};
			case "plastik": {"avanix_inv_plastik"};
			case "benzin": {"avanix_inv_benzin"};
			case "diesel": {"avanix_inv_diesel"};
			case "kerosin": {"avanix_inv_kerosin"};
			case "baumwolle": {"avanix_inv_baumwolle"};
			case "stoff": {"avanix_inv_stoff"};
			
			//Illegal Job Items
			case "hanf": {"avanix_inv_hanf"};
			case "marijuana": {"avanix_inv_marijuana"};
			case "med_merijuana": {"avanix_inv_med_merijuana"};
			case "opium": {"avanix_inv_opium"};
			case "heroin": {"avanix_inv_heroin"};
			case "morphine": {"avanix_inv_morphine"};
			case "pseudoephedrin": {"avanix_inv_pseudoephedrin"};
			case "phenylaceton": {"avanix_inv_phenylaceton"};
			case "natriumamalgam": {"avanix_inv_natriumamalgam"};
			case "meth": {"avanix_inv_meth"};
			case "moonschine": {"avanix_inv_moonschine"};
			case "uranu": {"avanix_inv_uranu"};
			case "uranp": {"avanix_inv_uranp"};
			
			//Baupläne
			case "bprook40": {"avanix_inv_bprook40"};
			case "bpacpc2": {"avanix_inv_bpacpc2"};
			case "bpzubr45": {"avanix_inv_bpzubr45"};
			case "bpp07": {"avanix_inv_bpp07"};
			case "bpsignal": {"avanix_inv_bpsignal"};
			case "bp4five": {"avanix_inv_bp4five"};
			case "bppdw2000": {"avanix_inv_bppdw2000"};
			case "bpvermin": {"avanix_inv_bpvermin"};
			case "bpsting": {"avanix_inv_bpsting"};
			case "bpsdar": {"avanix_inv_bpsdar"};
			case "bptrg20": {"avanix_inv_bptrg20"};
			case "bpkatiba": {"avanix_inv_bpkatiba"};
			case "bprahim": {"avanix_inv_bprahim"};
			case "bpzafir": {"avanix_inv_bpzafir"};
			case "bpgm6lynx": {"avanix_inv_bpgm6lynx"};
			case "bpasp1": {"avanix_inv_bpasp1"};
			case "bpcyrus": {"avanix_inv_bpcyrus"};
			case "bpmar10": {"avanix_inv_bpmar10"};
			case "bpmk1": {"avanix_inv_bpmk1"};
			case "bpmk14": {"avanix_inv_bpmk14"};
			case "bpmk200": {"avanix_inv_bpmk200"};
			case "bplrr": {"avanix_inv_bplrr"};
			case "bpmk18": {"avanix_inv_bpmk18"};
			case "bpmk20": {"avanix_inv_bpmk20"};
			
			//Fahrzeug Baupläne
			case "bpquad": {"avanix_inv_bpquad"};
			case "bplimo": {"avanix_inv_bplimo"};
			case "bplimosport": {"avanix_inv_bplimosport"};
			case "bpoffroad": {"avanix_inv_bpoffroad"};
			case "bpoffroadr": {"avanix_inv_bpoffroadr"};
			case "bpsuv": {"avanix_inv_bpsuv"};
			case "bpvan": {"avanix_inv_bpvan"};
			case "bpzamak": {"avanix_inv_bpzamak"};
			case "bptempest": {"avanix_inv_bptempest"};
			case "bphemtt": {"avanix_inv_bphemtt"};
			case "bphunter": {"avanix_inv_bphunter"};
			case "bpm900": {"avanix_inv_bpm900"};
			case "bporca": {"avanix_inv_bporca"};
			case "bpmohawk": {"avanix_inv_bpmohawk"};
			case "bphellcat": {"avanix_inv_bphellcat"};
			case "bptaru": {"avanix_inv_bptaru"};
			case "bphuron": {"avanix_inv_bphuron"};
			case "bpsdv": {"avanix_inv_bpsdv"};
			case "bpboat": {"avanix_inv_bpboat"};
			
			//Waffenteile
			case "lowerreceiver": {"avanix_inv_lowerreceiver"};
			case "zubrframe": {"avanix_inv_zubrframe"};
			case "lauf9mm": {"avanix_inv_lauf9mm"};
			case "lauf45": {"avanix_inv_lauf45"};
			case "lauf65": {"avanix_inv_lauf65"};
			case "lauf127": {"avanix_inv_lauf127"};
			case "lauf556": {"avanix_inv_lauf556"};
			case "lauf762": {"avanix_inv_lauf762"};
			case "lauf93": {"avanix_inv_lauf93"};
			case "lauf338": {"avanix_inv_lauf338"};
			case "rollenverschluss": {"avanix_inv_rollenverschluss"};
			case "rook40schlitten": {"avanix_inv_rook40schlitten"};
			case "acpc2schlitten": {"avanix_inv_acpc2schlitten"};
			case "4fiveschlitten": {"avanix_inv_4fiveschlitten"};
			case "p07schlitten": {"avanix_inv_p07schlitten"};
			case "trommel45acp6rnd": {"avanix_inv_trommel45acp6rnd"};
			case "drehkopfverschluss": {"avanix_inv_drehkopfverschluss"};
			case "gasdrucksystem": {"avanix_inv_gasdrucksystem"};
			case "rueckstossfeder": {"avanix_inv_rueckstossfeder"};
			case "verzoegertermasseverschluss": {"avanix_inv_verzoegertermasseverschluss"};
			case "unverriegekltermasseverschluss": {"avanix_inv_unverriegekltermasseverschluss"};
			case "picatinnyschiene": {"avanix_inv_picatinnyschiene"};
			case "bullpupgearbox": {"avanix_inv_bullpupgearbox"};
			case "tragegriff": {"avanix_inv_tragegriff"};
			case "eichsystem": {"avanix_inv_eichsystem"};
			case "dichtungssystem": {"avanix_inv_dichtungssystem"};
			case "kurzergaskolben": {"avanix_inv_kurzergaskolben"};
			case "geradezugverschluss": {"avanix_inv_geradezugverschluss"};
			case "zylinderverschluss": {"avanix_inv_zylinderverschluss"};
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			//Sonstige Items
			case "avanix_inv_rabbit": {"rabbit"};
			case "avanix_inv_water": {"water"};
			case "avanix_inv_donuts": {"donuts"};
			case "avanix_inv_coffee": {"coffee"};
			case "avanix_inv_fuelF": {"fuelF"};
			case "avanix_inv_fuelE": {"fuelE"};
			case "avanix_inv_pickaxe": {"pickaxe"};
			case "avanix_inv_axt": {"axt"};
			case "avanix_inv_tbacon": {"tbacon"};
			case "avanix_inv_lockpick": {"lockpick"};
			case "avanix_inv_redgull": {"redgull"};
			case "avanix_inv_blastingcharge": {"blastingcharge"};
			case "avanix_inv_crowbar": {"crowbar"};
			case "avanix_inv_boltcutter": {"boltcutter"};
			case "avanix_inv_defusekit": {"defusekit"};
			case "avanix_inv_kidney": {"kidney"};
			case "avanix_inv_scalpel": {"scalpel"};
			case "avanix_inv_gpstracker": {"gpstracker"};
			case "avanix_inv_kabelbinder": {"kabelbinder"};
			case "avanix_inv_truckstorage": {"truckstorage"};
			case "avanix_inv_speedtrap": {"speedtrap"};
			case "avanix_inv_speedtrapdetector": {"speedtrapdetector"};
			case "avanix_inv_laptop": {"laptop"};
			case "avanix_inv_fuelManipulator": {"fuelManipulator"};
			case "avanix_inv_fuelPipe": {"fuelPipe"};
			case "avanix_inv_blaulicht": {"blaulicht"};
			case "avanix_inv_batterie": {"batterie"};
			
			//Objects
			case "avanix_inv_barriere_g": {"barriere_g"};
			case "avanix_inv_pylone": {"pylone"};
			case "avanix_inv_schranke": {"schranke"};
			case "avanix_inv_spikeStrip": {"spikeStrip"};
			case "avanix_inv_barriere_k": {"barriere_k"};
			case "avanix_inv_strahler": {"strahler"};
			case "avanix_inv_target": {"target"};
			case "avanix_inv_sandsack": {"sandsack"};
			case "avanix_inv_bunker": {"bunker"};
			case "avanix_inv_medhouse": {"medhouse"};
			
			//Housing
			case "avanix_inv_storagesmall": {"storagesmall"};
			case "avanix_inv_storagebig": {"storagebig"};
			case "avanix_inv_methkueche": {"methkueche"};
			case "avanix_inv_burglartool": {"burglartool"};
			case "avanix_inv_alarmsystem": {"alarmsystem"};
			case "avanix_inv_alarmsystemGPS": {"alarmsystemGPS"};
			case "avanix_inv_alarmsystemDog": {"alarmsystemDog"};
			case "avanix_inv_alarmsystemGuard": {"alarmsystemGuard"};   
			case "avanix_inv_metalGrilledWindow": {"metalGrilledWindow"};  
			case "avanix_inv_spytoolkit": {"spytoolkit"};
			
			//Fisch Items
			case "avanix_inv_salema": {"salema"};
			case "avanix_inv_ornate": {"ornate"};
			case "avanix_inv_mackerel": {"mackerel"};
			case "avanix_inv_tuna": {"tuna"};
			case "avanix_inv_mullet": {"mullet"};
			case "avanix_inv_catshark": {"catshark"};
			case "avanix_inv_turtle": {"turtle"};
			
			//Minen Items
			case "avanix_inv_sand": {"sand"};
			case "avanix_inv_glass": {"glass"};
			case "avanix_inv_panzerglass": {"panzerglass"};
			case "avanix_inv_rock": {"rock"};
			case "avanix_inv_cement": {"cement"};
			case "avanix_inv_beton": {"beton"};
			case "avanix_inv_copper": {"copper"};
			case "avanix_inv_copper_r": {"copper_r"};
			case "avanix_inv_electro": {"electro"};
			case "avanix_inv_iron": {"iron"};
			case "avanix_inv_iron_r": {"iron_r"};
			case "avanix_inv_stahl": {"stahl"};
			case "avanix_inv_blei": {"blei"};
			case "avanix_inv_blei_r": {"blei_r"};
			case "avanix_inv_dino": {"dino"};
			case "avanix_inv_gold": {"gold"};
			case "avanix_inv_goldnuggets": {"goldnuggets"};
			case "avanix_inv_goldbar": {"goldbar"};
			
			//Legal Job Items
			case "avanix_inv_mango": {"mango"};
			case "avanix_inv_ananas": {"ananas"};
			case "avanix_inv_salt": {"salt"};
			case "avanix_inv_salt_r": {"salt_r"};
			case "avanix_inv_zuckerrohr": {"zuckerrohr"};
			case "avanix_inv_zucker": {"zucker"};
			case "avanix_inv_holz": {"holz"};
			case "avanix_inv_holzscheit": {"holzscheit"};
			case "avanix_inv_holzkohle": {"holzkohle"};
			case "avanix_inv_rohoel": {"rohoel"};
			case "avanix_inv_erdoel": {"erdoel"};
			case "avanix_inv_plastik": {"plastik"};
			case "avanix_inv_benzin": {"benzin"};
			case "avanix_inv_diesel": {"diesel"};
			case "avanix_inv_kerosin": {"kerosin"};
			case "avanix_inv_baumwolle": {"baumwolle"};
			case "avanix_inv_stoff": {"stoff"};
			
			//Illegal Job Items
			case "avanix_inv_hanf": {"hanf"};
			case "avanix_inv_marijuana": {"marijuana"};
			case "avanix_inv_med_merijuana": {"med_merijuana"};
			case "avanix_inv_opium": {"opium"};
			case "avanix_inv_heroin": {"heroin"};
			case "avanix_inv_morphine": {"morphine"};
			case "avanix_inv_pseudoephedrin": {"pseudoephedrin"};
			case "avanix_inv_phenylaceton": {"phenylaceton"};
			case "avanix_inv_natriumamalgam": {"natriumamalgam"};
			case "avanix_inv_meth": {"meth"};
			case "avanix_inv_moonschine": {"moonschine"};
			case "avanix_inv_uranu": {"uranu"};
			case "avanix_inv_uranp": {"uranp"};
			
			//Waffen Baupläne
			case "avanix_inv_bprook40": {"bprook40"};
			case "avanix_inv_bpacpc2": {"bpacpc2"};
			case "avanix_inv_bpzubr45": {"bpzubr45"};
			case "avanix_inv_bpp07": {"bpp07"};
			case "avanix_inv_bpsignal": {"bpsignal"};
			case "avanix_inv_bp4five": {"bp4five"};
			case "avanix_inv_bppdw2000": {"bppdw2000"};
			case "avanix_inv_bpvermin": {"bpvermin"};
			case "avanix_inv_bpsting": {"bpsting"};
			case "avanix_inv_bpsdar": {"bpsdar"};
			case "avanix_inv_bptrg20": {"bptrg20"};
			case "avanix_inv_bpkatiba": {"bpkatiba"};
			case "avanix_inv_bprahim": {"bprahim"};
			case "avanix_inv_bpzafir": {"bpzafir"};
			case "avanix_inv_bpgm6lynx": {"bpgm6lynx"};
			case "avanix_inv_bpasp1": {"bpasp1"};
			case "avanix_inv_bpcyrus": {"bpcyrus"};
			case "avanix_inv_bpmar10": {"bpmar10"};
			case "avanix_inv_bpmk1": {"bpmk1"};
			case "avanix_inv_bpmk14": {"bpmk14"};
			case "avanix_inv_bpmk200": {"bpmk200"};
			case "avanix_inv_bplrr": {"bplrr"};
			case "avanix_inv_bpmk18": {"bpmk18"};
			case "avanix_inv_bpmk20": {"bpmk20"};
			
			//Fahrzeug Baupläne
			case "avanix_inv_bpquad": {"bpquad"};
			case "avanix_inv_bplimo": {"bplimo"};
			case "avanix_inv_bplimosport": {"bplimosport"};
			case "avanix_inv_bpoffroad": {"bpoffroad"};
			case "avanix_inv_bpoffroadr": {"bpoffroadr"};
			case "avanix_inv_bpsuv": {"bpsuv"};
			case "avanix_inv_bpvan": {"bpvan"};
			case "avanix_inv_bpzamak": {"bpzamak"};
			case "avanix_inv_bptempest": {"bptempest"};
			case "avanix_inv_bphemtt": {"bphemtt"};
			case "avanix_inv_bphunter": {"bphunter"};
			case "avanix_inv_bpifrit": {"bpifrit"};
			case "avanix_inv_bpm900": {"bpm900"};
			case "avanix_inv_bporca": {"bporca"};
			case "avanix_inv_bpmohawk": {"bpmohawk"};
			case "avanix_inv_bphellcat": {"bphellcat"};
			case "avanix_inv_bptaru": {"bptaru"};
			case "avanix_inv_bphuron": {"bphuron"};
			case "avanix_inv_bpsdv": {"bpsdv"};
			case "avanix_inv_bpboat": {"bpboat"};
	
			//Waffenteile
			case "avanix_inv_lowerreceiver": {"lowerreceiver"};
			case "avanix_inv_zubrframe": {"zubrframe"};
			case "avanix_inv_lauf9mm": {"lauf9mm"};
			case "avanix_inv_lauf45": {"lauf45"};
			case "avanix_inv_lauf65": {"lauf65"};
			case "avanix_inv_lauf127": {"lauf127"};
			case "avanix_inv_lauf556": {"lauf556"};
			case "avanix_inv_lauf762": {"lauf762"};
			case "avanix_inv_lauf93": {"lauf93"};
			case "avanix_inv_lauf338": {"lauf338"};
			case "avanix_inv_rollenverschluss": {"rollenverschluss"};
			case "avanix_inv_rook40schlitten": {"rook40schlitten"};
			case "avanix_inv_acpc2schlitten": {"acpc2schlitten"};
			case "avanix_inv_4fiveschlitten": {"4fiveschlitten"};
			case "avanix_inv_p07schlitten": {"p07schlitten"};
			case "avanix_inv_trommel45acp6rnd": {"trommel45acp6rnd"};
			case "avanix_inv_drehkopfverschluss": {"drehkopfverschluss"};
			case "avanix_inv_gasdrucksystem": {"gasdrucksystem"};
			case "avanix_inv_rueckstossfeder": {"rueckstossfeder"};
			case "avanix_inv_verzoegertermasseverschluss": {"verzoegertermasseverschluss"};
			case "avanix_inv_unverriegekltermasseverschluss": {"unverriegekltermasseverschluss"};
			case "avanix_inv_picatinnyschiene": {"picatinnyschiene"};
			case "avanix_inv_bullpupgearbox": {"bullpupgearbox"};
			case "avanix_inv_tragegriff": {"tragegriff"};
			case "avanix_inv_eichsystem": {"eichsystem"};
			case "avanix_inv_dichtungssystem": {"dichtungssystem"};
			case "avanix_inv_kurzergaskolben": {"kurzergaskolben"};
			case "avanix_inv_geradezugverschluss": {"geradezugverschluss"};
			case "avanix_inv_zylinderverschluss": {"zylinderverschluss"};
		};
	};
};
