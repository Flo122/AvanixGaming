/*
	Autor: ConCeZ
	Beschreibung: Folter die Person
*/
private["_unit","_randomDamage"];
_unit = cursorTarget;
_randomDamage = random(0.07);

/////Start der Folter
uisleep 7;
enableCamShake true;
addCamShake [10, 120, 10];
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (_randomDamage + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};
uisleep 2;
_unit setDamage (1 + (damage _unit));
if(!alive _unit) exitWith {resetCamShake;};