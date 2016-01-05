/*
	Author: Bryan "Tonic" Boardwine
	Edit: Avanix Gaming Community
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint "Du musst Picture in Picture (PiP) in deinen Video-Einstellungen aktivieren, um dies nutzen zu können!";};
if(isNil "avanix_fed_scam") then {
	avanix_fed_scam = "camera" camCreate [0,0,0];
	avanix_fed_scam camSetFov 0.5;
	avanix_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	avanix_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "side": {
		avanix_fed_scam camSetPos [16029.1,16938.9,3.08817];
		avanix_fed_scam camSetTarget [16034.9,16930.6,0.00146008];
		avanix_fed_scam camCommit 0;
	};
	
	case "vault": {
		avanix_fed_scam camSetPos [16031.1,16936.6,10.287];
		avanix_fed_scam camSetTarget [16017.1,16957.3,0.597221];
		avanix_fed_scam camCommit 0;
	};
	
	case "front": {
		avanix_fed_scam camSetPos [16084.3,16997.8,23.6492] ;
		avanix_fed_scam camSetTarget [16037.8,16966.7,0.00145817];
		avanix_fed_scam camCommit 0;
	};
	
	case "back": {
		avanix_fed_scam camSetPos [16002,16904.9,5.71753];
		avanix_fed_scam camSetTarget [15998.7,16939.7,0.00146866];
		avanix_fed_scam camCommit 0;
	};
	
	case "off" : {
		avanix_fed_scam cameraEffect ["terminate", "back"];
		camDestroy avanix_fed_scam;
		_laptop setObjectTexture [0,""];
		avanix_fed_scam = nil;
	};
	
	case "verhoer_1" : {
		avanix_fed_scam camSetPos [15300.1,17473.6,2.087];
		avanix_fed_scam camSetTarget [15298.3,17469.4,0.587221];
		avanix_fed_scam camCommit 0;
	};
	
	case "jail_1" : {
		avanix_fed_scam camSetPos [15298.4,17475.1,3.687];
		avanix_fed_scam camSetTarget [15277.2,17480,0.587221];
		avanix_fed_scam camCommit 0;
	};
	
	case "jail_2" : {
		avanix_fed_scam camSetPos [15282.5,17490.8,3.687];
		avanix_fed_scam camSetTarget [15287.5,17462.1,0.587221];
		avanix_fed_scam camCommit 0;
	};
	
	case "jail_3" : {
		avanix_fed_scam camSetPos [15341.3,17506.6,10.287];
		avanix_fed_scam camSetTarget [15290.4,17498.8,0.597221];
		avanix_fed_scam camCommit 0;
	};
	
	case "jail_4" : {
		avanix_fed_scam camSetPos [15265.3,17473.2,10.287];
		avanix_fed_scam camSetTarget [15283.3,17460.3,0.597221];
		avanix_fed_scam camCommit 0;
	};
};
