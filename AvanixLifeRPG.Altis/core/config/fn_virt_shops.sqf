/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Markt",["mango","ananas","redgull","coffee","water","tbacon","rabbit","axt","pickaxe","truckstorage","dino"]]};
	case "gang": {["Gang Markt", ["redgull","coffee","water","tbacon","rabbit","kabelbinder"]]};
	case "coffee": {["Kaffee",["coffee","donuts"]]};
	case "cop": {["Polizei Markt",["tbacon","rabbit","coffee","water","donuts","redgull","defusekit","gpstracker","speedtrap","laptop","barriere_g","pylone","schranke","spikeStrip","barriere_k","strahler","target","sandsack","bunker"]]};
	case "tankstelle": {["Tankstellen Kiosk",["tbacon","rabbit","water","coffee","donuts","fuelE","fuelF","benzin","diesel","kerosin"]]};
	case "medic": {["Notarzt Markt",["tbacon","rabbit","water","coffee","donuts","redgull","gpstracker","barriere_g","pylone","barriere_k","strahler","medhouse"]]};
	case "housingmarket": {["Haus und Hof",["alarmsystem","alarmsystemGPS","alarmsystemDog","alarmsystemGuard","metalGrilledWindow","storagesmall","storagebig"]]};
	case "jail_market": {["Knastküche",["tbacon","rabbit","water","coffee","donuts"]]};
	case "kiosk": {["Taxi Markt",["tbacon","rabbit","redgull","water","coffee","donuts"]]};
	case "schwarzmarkt": {["Schwarzmarkt",["uranp","lockpick","redgull","crowbar","boltcutter","scalpel","kidney","blastingcharge","kabelbinder","gpstracker","spytoolkit","burglartool","speedtrapdetector"/*,"fuelManipulator"*/,"fuelPipe","blaulicht"]]};
	case "oel": {["Öl Händler",["erdoel","fuelE","fuelF"]]};
	case "fishmarket": {["Fisch Markt",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Baustoffhändler",["glass","cement"]]};
	case "iron": {["Industrie Händler",["copper_r","iron_r","blei_r","gold","goldnuggets","goldbar"]]};
	case "salt": {["Salz Händler",["salt_r","zucker"]]};
	case "schreinerei": {["Schreinerei",["holzscheit","axt"]]};
	case "apotheke": {["Apotheke",["morphine","med_merijuana"]]};
	case "heroin": {["Drogendealer",["marijuana","heroin","meth","moonschine"]]};
	case "wongs": {["Wong's Spezialitäten",["turtle"]]};
	case "stoff": {["Kleidungshändler",["stoff"]]};
};