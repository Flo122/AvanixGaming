/*
	File: fn_useBag
	Author: DerOnkel/Avanix Gaming Community
	Email: info@avanix-gaming.de
	
	Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!   
*/
player setVariable ["hostages", false, true];
removeHeadgear player;
0 cutFadeOut 1;
[player] joinSilent my_group;
my_group = grpNull;