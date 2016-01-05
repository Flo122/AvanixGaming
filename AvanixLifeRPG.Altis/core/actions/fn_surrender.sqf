/*
	Author: MrKraken
	filename: fn_surrender.sqf
	Edit: Avanix Gaming Community
	Description: places player into a surrendered state!
*/
player setVariable ["surrender", true, true]; //Set surrender to true

while { player getVariable ["surrender", false] }  do { 
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"; //Animation in
	avanix_action_gathering = true;
	
	// Check if player is alive.
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"; //Animation out
avanix_action_gathering = false;