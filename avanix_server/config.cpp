class DefaultEventhandlers;
class CfgPatches 
{
	class avanix_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "avanix_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\avanix_server\Functions\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
		};
	};
	
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\avanix_server\Functions\MySQL";
			class numberSafe {hcFunc = true;};
			class mresArray {hcFunc = true;};
			class queryRequest{hcFunc = true;};
			class asyncCall{hcFunc = true;};
			class insertRequest{hcFunc = true;};
			class updateRequest{hcFunc = true;};
			class mresToArray {hcFunc = true;};
			class insertVehicle {hcFunc = true;};
			class bool{hcFunc = true;};
			class mresString {hcFunc = true;};
			class updatePartial {hcFunc = true;};
			class randomSeq {hcFunc = true;};
		};
	};
	
	class avanix_System
	{
		tag = "avanix";
		class Wanted_Sys
		{
			file = "\avanix_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};
		
		class Jail_Sys
		{
			file = "\avanix_server\Functions\Jail";
			class jailSys {hcFunc = true;};
			class jailTimer {hcFunc = true;};
			class jailPlayer {hcFunc = true;};
		};
		
		
		class scripts
		{
			file = "\avanix_server\Functions\Fuelstation";
			class diesel {};
			class fuelConfig {};
			class fuelPrices {};
			class initFuelAction {};
			class super {};
			class vehicleCheck {};
			class scriptsave {postInit=1;};
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\avanix_server\Functions\Systems";
			class managesc {};
			class cleanup {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class logIt {};
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};
			class getImpoundedvehicles {};
            class vehicleImpound {};
		};
		
		class Housing
		{
			file = "\avanix_server\Functions\Housing";
			class addHouse {hcFunc = true;};
			class fetchPlayerHouses {hcFunc = true;};
			class initHouses {hcFunc = true;};
			class sellHouse {hcFunc = true;};
			class updateHouseContainers {hcFunc = true;};
			class updateHouseTrunk {hcFunc = true;};
			class houseCleanup {hcFunc = true;};
			class addRentHouse {hcFunc = true;};
			class updateRenttime {hcFunc = true;};
		};
		
		class Gangs
		{
			file = "\avanix_server\Functions\Gangs";
			class insertGang {hcFunc = true;};
			class queryPlayerGang {hcFunc = true;};
			class removeGang {hcFunc = true;};
			class updateGang {hcFunc = true;};
		};
		
		class Taxi
		{
			file = "\avanix_server\Functions\Taxi";
			class callTaxiDrivers {};
			class acceptedTaxiCall {};
			class goOnDuty {};
			class goOffDuty {};
		};
		
		class Paintball
		{
			file = "\avanix_server\Functions\Paintball";
			class paintball {};
			class game {};
		};
		
		class Airdrop
		{
			file = "\avanix_server\Functions\Airdrop";
			class generateAirdrop {};
		};
		
		class Hideout
		{
			file = "\avanix_server\Functions\Hideout";
			class updateHideout {hcFunc = true;};
			class updateHideoutContainers {hcFunc = true;};
			class updateHideoutTrunk {hcFunc = true;};
			class initHideout {hcFunc = true;};
			class deleteHideout {hcFunc = true;};
		};
		
		class Asservatenkammer
		{
			file = "\avanix_server\Functions\Asservatenkammer";
			class updateAsservatenkammerContainers {hcFunc = true;};
			class updateAsservatenkammerTrunk {hcFunc = true;};
			class initAsservatenkammer {hcFunc = true;};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\avanix_server\fix_headgear.sqf""";
		};
	};
};