class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class avanix_Client_Core
{
	tag = "avanix";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		//class welcomeNotification {};
		class init {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
	};
	
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class medicInteractionMenu {};
		class alkoholdrugtester {};
		class medAction {};
		class medicSiren2 {};
		class medTicketGive {};
		class medTicketPay {};
		class medTicketPrompt {};
		class medOperieren {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class sellLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainActionCop {};
		class restrainActionCiv {};
		class searchAction {};
		class searchVehAction {};
		class unrestrainCop {};
		class unrestrainCiv {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class storeVehicle {};
		class robAction {};
		class surrender {};
		class takeOrgans {};
		class healKidney{};
		class impoundPermAction {};
		class dynProcess {};
		class packupBarriere_g {};
		class packupBarriere_k {};
		class packupBunker {};
		class packupContainer {};
		class packupPylone {};
		class packupSandsack {};
		class packupSchranke {};
		class packupSpikes {};
		class packupStrahler {};
		class packupTarget {};
		class hasOrgan {};
	};
	
	class Gather
	{
		file = "core\gather";
		class gather {};
		class searchProteus {};
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
		class getAlarmsystems {};
        class removeAlarmsystem {};
        class showAlarmsystemsList {};
		class placeAlarmsystem {};
		class alarmHouse {};
		class lockpickHouse {};
		class spyOutHouse {};
		class alarmsystemGPS {};
		class getBuildID {};
		class rentHouse {};
		class rentmenu {};
		class updateRenttime {};
	};
	
	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		class vehFuelCap {};
		class houseRentConfig {};
		
		//Clothing Store Configs
		class clothing_bruce {};
		class clothing_cop {};
		class clothing_dive {};
		class clothing_donator {};
		class clothing_kart {};
		class clothing_med {};
		class clothing_schwarzmarkt {};
		class clothing_taxi {};
		class clothing_gang {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class p_UpdatePlayer {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class wantedadd2 {};
		class wanted2 {};
		class callCellphone {};
		class AAN {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class welcome {};
        class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class pullOutVehCiv {};
		class pullOutVehMedic {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class globalSoundClient {};
		class globalsound {};
		class carAlarmSound {};
		class randomRound {};
		class progressWaitUntilFinished {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class demoChargeTimer {};
		class civLoadout {};
		class civInteractionMenu {};
		class rebInteractionMenu {};
		class restrainCiv {};
		class jailIn {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
		class updateVehTrunk {};
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrainCop {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class copSiren2 {};
		class copYelp {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
		class seize {};
		class seizeCheck {};
		class copSearchPlayer {};
		class revokeLicense {};
		class copopener {};
		class sirene {};
		class seizeObjects {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangMarkers {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class licenses {};
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class jerryRefuel {};
		class flashbang {};
		class crowbar {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class axtUse {};
		class gpsTracker {};
		class truckStorage {};
		class blaulicht {};
		class barriere_g {};
		class barriere_k {};
		class bunker {};
		class container {};
		class pylone {};
		class sandsack {};
		class schranke {};
		class spikeStrip {};
		class strahler {};
		class target {};
		class fuelE {};
		class boltcutter {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class gangWithdraw {};
		class impoundedMenu {};
        class willswieder {};
        class impoundLBChange {};
		class calldialog {};
		class sendChannel {};
	};
	
	class Misc
	{
		file = "core\avanix\misc";
		class brokeAsservatenkammer {};
		class repairAsservatenkammer {};
	};
	
	class EMP
	{
		file = "core\emp";
		class openEmpMenu {};
		class isEmpOperator {};
		class scanVehicles {};
		class warnVehicle {};
		class empVehicle {};
		class vehicleWarned {};
		class vehicleEmpd {};
	};
	
	class Torture
	{
		file = "core\torture";
		class TorturePlayer {};
		class waterboarding {};
		class elektroschock {};
		class robsmartphoneAction {};
		/*
		class giveZyankali {};
		*/
		class bagUse {};
		class bagUseAction {};
		class removeBag {};
		class removeBagAction {};
	};
	
	class Phone
	{
		file = "core\phone";
		class openMessages {}
        class initMessages{}
        class getMessage {}
        class playerSent {}
        class recieveMessage {}
        class getMessagePos {}
        class findUser {}        
        class clearMessages {}
	};
	
	class Taxi
	{
		file = "core\taxi";
		class taxi_call {};
		class taxi_respond {};
		class taxi_acceptCall {};
		class finishRide {};
		class openTaxiMenu {};
	};
	
	class Paintball
	{
		file = "core\paintball";
		class pb_response {};
	};
	
	class Fuelchanger
	{
		file = "core\avanix\fuelchanger";
        class fuelchanger {};
        class fuelchangerManipulate {};
		class fuelPipe {};
	};
	
	class Speedtrap
	{
		file = "core\avanix\speedtrap";
		class speedtrap {};
		class speedtrapGetPhotoList {};
        class speedtrapActivate {};
        class speedtrapSetSpeedLimit {};
        class speedtrapRemove {};
        class speedtrapAdd {};
        class trapped {};
        class trappedFlash {};
        class setSpeedtrapLimit {};
        class speedtrapHack {};
	};
	
	class Robshop
	{
		file = "core\avanix\robShop";
		class robShops {};
		class robShopReset {};
	};
	
	class Crafting
	{
		file = "core\avanix\crafting";
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
		class craftAction {};
		class craftCfg {};
		class openCraftMenu {};
	};
	
	class Hideout
	{
		file = "core\hideout";
		class captureHideout {};
		class cancelCaptureHideout {};
	};
	
	class FederalBank
	{
		file = "core\federalBank";
		class federalBankMenu {};
		class enterFedKey {};
	};
	
	class Ausweis
	{
		file = "core\ausweis";
		class openPassMenu {};
	};
};