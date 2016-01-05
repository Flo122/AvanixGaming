/* 
  File: fn_jailIn.sqf
  Edit: Avanix Gaming Community
  Description: Sets Custom Loadout when in Jail.
*/
avanix_Prison_backpack = backpack player;
avanix_Prison_uniform = uniform player;
avanix_Prison_headgear = headgear player;
avanix_Prison_vest = vest player;
uisleep 1;

//Now strip him.
removeUniform player;
removeBackpack player;
removeHeadgear player;
removeVest player;

player addUniform "U_C_Scientist";