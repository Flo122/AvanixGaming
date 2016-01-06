avanix_fnc_sidechat =
compileFinal "
	if(avanix_sidechat) then {avanix_sidechat = false;} else {avanix_sidechat = true;};
	[[player,avanix_sidechat,playerSide],""TON_fnc_managesc"",false,false] spawn avanix_fnc_MP;
	[] call avanix_fnc_settingsMenu;
";

publicVariable "avanix_fnc_sidechat";

TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};
	
	[[avanix_atmcash,avanix_cash,owner player,player],""avanix_fnc_admininfo"",_ret,false] spawn avanix_fnc_MP;
";
publicVariable "TON_fnc_player_query";

publicVariable "TON_fnc_index";

TON_fnc_clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	avanix_atmcash = avanix_atmcash + _val;
	hint format[""%1 hat dir %2€ ueberwiesen."",_from,[_val] call avanix_fnc_numberText];
	
";
publicVariable "TON_fnc_clientWireTransfer";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;
	
	{
		if(_x in _valid) then	
		{}
		else
		{
			_return = false;
		};
	} foreach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		avanix_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint ""Du wurdest aus der Gang geworfen."";
		
	};
";
publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in avanix_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 hat dir die Schluessel zu einem %2 gegeben"",_giver,_name];
		avanix_vehicles pushBack _vehicle;
		[[getPlayerUID player,playerSide,_vehicle,1],""TON_fnc_keyManagement"",false,false] spawn avanix_fnc_MP;
	};
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Du wurdest zum neuen Gangleader ernannt."";
	};
";

publicVariable "TON_fnc_clientGangLeader";

//Cell Phone Messaging
/*
	-fnc_cell_textmsg
	-fnc_cell_textcop
	-fnc_cell_textadmin
	-fnc_cell_adminmsg
	-fnc_cell_adminmsgall
*/

//To EMS
TON_fnc_cell_emsrequest = 
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""Feuerwehr"";
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3022,true];};
		
	[[_msg,name player,5],""TON_fnc_clientMessage"",independent,false] spawn avanix_fnc_MP;
	[] call avanix_fnc_cellphone;
	hint format[""Du hast eine Nachricht an die Feuerwehr gesendet."",_to,_msg];
	ctrlShow[3022,true];
";
//To One Person
TON_fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint ""Du musst einen Spieler auswahlen!""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint ""Du musst eine Nachtich eingeben!"";ctrlShow[3015,true];};
	
	[[_msg,name player,0],""TON_fnc_clientMessage"",_to,false] spawn avanix_fnc_MP;
	[] call avanix_fnc_cellphone;
	hint format[""Du hast %1 eine Nachricht gesendet: %2"",name _to,_msg];
	ctrlShow[3015,true];
";
//To All Cops
TON_fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""Polizei"";
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3016,true];};
		
	[[_msg,name player,1],""TON_fnc_clientMessage"",true,false] spawn avanix_fnc_MP;
	[] call avanix_fnc_cellphone;
	hint format[""Du hast folgenden Nachricht an die %1 gesendet: %2"",_to,_msg];
	ctrlShow[3016,true];
";
//To All Admins
TON_fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = ""An die Admins"";
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3017,true];};
		
	[[_msg,name player,2],""TON_fnc_clientMessage"",true,false] spawn avanix_fnc_MP;
	[] call avanix_fnc_cellphone;
	hint format[""Du hast folgende Nachricht %1 gesendet: %2"",_to,_msg];
	ctrlShow[3017,true];
";
//Admin To One Person
TON_fnc_cell_adminmsg =
compileFinal "
	if(isServer) exitWith {};
	if((call avanix_adminlevel) < 1) exitWith {hint ""Du bist kein Admin!"";};
	private[""_msg"",""_to""];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {};
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";};
	
	[[_msg,name player,3],""TON_fnc_clientMessage"",_to,false] spawn avanix_fnc_MP;
	[] call avanix_fnc_cellphone;
	hint format[""Admin Nachricht gesendet an: %1 - Nachricht: %2"",name _to,_msg];
";

TON_fnc_cell_adminmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call avanix_adminlevel) < 1) exitWith {hint ""Du bist kein Admin!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";};
	
	[[_msg,name player,4],""TON_fnc_clientMessage"",true,false] spawn avanix_fnc_MP;
	[] call avanix_fnc_cellphone;
	hint format[""Admin Nachricht an alle Spieler: %1"",_msg];
";

publicVariable "TON_fnc_cell_textmsg";
publicVariable "TON_fnc_cell_textcop";
publicVariable "TON_fnc_cell_textadmin";
publicVariable "TON_fnc_cell_adminmsg";
publicVariable "TON_fnc_cell_adminmsgall";
publicVariable "TON_fnc_cell_emsrequest";
//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
*/
TON_fnc_clientMessage =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_from"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == """") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private[""_message""];
			_message = format["">>>Nachricht von %1: %2"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			[""TextMessage"",[format[""Du hast eine neue Nachricht von %1 erhalten."",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			_message = format[""---Polizei Notruf von %1: %2"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Neuer Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Polizisten<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			[""PoliceDispatch"",[format[""Ein neuer Notruf von: %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 2 :
		{
			if((call avanix_adminlevel) < 1) exitWith {};
			private[""_message""];
			_message = format[""???Admin Nachricht von %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Die Admins<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			[""AdminDispatch"",[format[""%1 hat eine Nachricht an die Admin gesendet!"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 3 :
		{
			private[""_message""];
			_message = format[""!!!ADMIN NACHRICHT: %1"",_msg];
			_admin = format[""Gesendet von einem Admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>Einem Admin<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			[""AdminMessage"",[""Du hast eine Nachricht von einem Admin!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call avanix_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""!!!ADMIN NACHRICHT: %1"",_msg];
			_admin = format[""Gesendet von einem Admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>Einem Admin<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			[""AdminMessage"",[""You Have Received A Message From An Admin!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call avanix_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 5: {
			private[""_message""];
			_message = format[""!!!THW NOTRUF: %1"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>THW Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			[""TextMessage"",[format[""THW Notruf von %1"",_from]]] call bis_fnc_showNotification;
		};
		
		case 6 :
		{
			private[""_message"", ""_marker""];
			_message = format[""SMS Alarmanlage von: %1"",_msg];
			hint parseText format [""<t color='#1E90FF'><t size='2'><t align='center'>SMS Alarmanlage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>SMS Alarmanlage<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>In dein Haus bei: %1 wird eingebrochen"",_msg];
			systemChat _message;
			
			_marker = createMarkerLocal [""HouseMarker"", _msg ];
			_marker setMarkerColorLocal ""ColorRed"";
			_marker setMarkerTypeLocal ""Mil_dot"";
			_marker setMarkerTextLocal ""Hier wird eingebrochen"";
			
		};
	};
";
publicVariable "TON_fnc_clientMessage";


TON_fnc_showMsg =
compileFinal "

        [
		format[""<t size='%1' color='%2'>%3</t><br/>%4."",_this select 0,_this select 1, _this select 2,_this select 3],
		0,
		0.2,
		99999999999999,
		0,
		0,
		8
	   ] spawn BIS_fnc_dynamicText;
";
publicVariable "TON_fnc_showMsg";