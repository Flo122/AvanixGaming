/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price","_bauliste1","_bauliste2","_bauplan1","_bauplan2","_random1","_random2","_div","_name"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
avanix_delivery_in_progress = false;
avanix_dp_point = nil;
_dis = round((getPos avanix_dp_start) distance (getPos _dp));
_price = round(1.7 * _dis);
_bauliste1 = ["avanix_inv_bprook40","avanix_inv_bpacpc2","avanix_inv_bpzubr45","avanix_inv_bpp07","avanix_inv_bpsignal","avanix_inv_bp4five","avanix_inv_bppdw2000","avanix_inv_bpvermin","avanix_inv_bpsting","avanix_inv_bpsdar","avanix_inv_bptrg20","avanix_inv_bpkatiba","avanix_inv_bprahim","avanix_inv_bpmk18","avanix_inv_bpmk20","avanix_inv_bpquad","avanix_inv_bplimo","avanix_inv_bpoffroad","avanix_inv_bpsuv","avanix_inv_bpvan","avanix_inv_bpzamak","avanix_inv_bptempest","avanix_inv_bphemtt","avanix_inv_bpm900","avanix_inv_bporca","avanix_inv_bpmohawk","avanix_inv_bpsdv","avanix_inv_bpboat"];
_bauliste2 = ["avanix_inv_bpzafir","avanix_inv_bpgm6lynx","avanix_inv_bpasp1","avanix_inv_bpcyrus","avanix_inv_bpmar10","avanix_inv_bpmk1","avanix_inv_bpmk14","avanix_inv_bpmk200","avanix_inv_bplrr","avanix_inv_bplimosport","avanix_inv_bpoffroadr","avanix_inv_bphunter","avanix_inv_bpifrit","avanix_inv_bphellcat","avanix_inv_bptaru","avanix_inv_bphuron"];
_random1 = random 10;
_random2 = random 10;
["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call avanix_fnc_numberText]]] call bis_fnc_showNotification;
avanix_cur_task setTaskState "Succeeded";
player removeSimpleTask avanix_cur_task;
avanix_cash = avanix_cash + _price;

if (_random1 < 6) then 
{
	if (_random2 < 9) then 
	{
		_bauplan1 = _bauliste1 select (floor(random (count _bauliste1)));
		_div = [_bauplan1,1,avanix_carryWeight,avanix_maxWeight] call avanix_fnc_calWeightDiff;
		if(_div <= 0) exitWith {hint "Du hast nicht genug Platz!"};
		_name = [_bauplan1] call avanix_fnc_varToStr;
		_bauplan1 = [_bauplan1,1] call avanix_fnc_varHandle;
		if(([true,_bauplan1,1] call avanix_fnc_handleInv)) then
		{
			hint format["Du hast ein %1 bekommen",_name];
		};
	} else {
		_bauplan2 = _bauliste2 select (floor(random (count _bauliste2)));
		_div = [_bauplan2,1,avanix_carryWeight,avanix_maxWeight] call avanix_fnc_calWeightDiff;
		if(_div <= 0) exitWith {hint "Du hast nicht genug Platz!"};
		//_name = [([_bauplan2,0] call avanix_fnc_varHandle)] call avanix_fnc_varToStr;
		_name = [_bauplan2] call avanix_fnc_varToStr;
		_bauplan2 = [_bauplan2,1] call avanix_fnc_varHandle;
		if(([true,_bauplan2,1] call avanix_fnc_handleInv)) then
		{
			hint format["Du hast ein %1 bekommen",_name];
		};
	};
};