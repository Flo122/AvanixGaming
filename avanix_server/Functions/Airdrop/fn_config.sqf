/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright © 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"
*/

airdrop_helicopter_main = "B_Heli_Transport_03_unarmed_F";
airdrop_helicopter_scnd = "B_Heli_Transport_01_F";
airdrop_chance = 100;
airdrop_positions = [[22662.2,21666.2,0.00131607],[18699.7,10221.2,0.00144958],[10319.4,9126.2,0.00141907],[6427.99,12364.8,0.00233459],[11442.8,19776.5,0.00138855],[3890.81,20015.8,0.00160217],[5413.64,17919.5,0.00183868]];
_airdrop_time_interval = [1,4.5]; //Time given in hours, this is the interval in which the airdrop should take place

// Do not modify the following code

airdrop_time_min = _airdrop_time_interval select 0;
airdrop_time_max = _airdrop_time_interval select 1;
airdrop_time_min = airdrop_time_min*3600;
airdrop_time_max = airdrop_time_max*3600;

if (airdrop_time_min>=airdrop_time_max) exitWith {airdrop_enable=false;};
airdrop_enable=true;
airdrop_goingon=false;

diag_log "Airdrop config geladen";