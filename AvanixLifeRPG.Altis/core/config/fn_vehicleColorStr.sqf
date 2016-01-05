#include <macro.h>
/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Hellbraun";};
			case 1: {_color = "Schwarz";};
			case 2: {_color = "Blau";};
			case 3: {_color = "Rot";};
			case 4: {_color = "Weiss";};
			case 5: {_color = "Rebel"};
		};
	};
	
	case "C_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rot";};
			case 1: {_color = "Hellbraun";};
			case 2: {_color = "Silber";};
			case 3: {_color = "Blau";};
			case 4: {_color = "Dunkelrot";};
			case 5: {_color = "Dunkelblau"};
		};
	};
	
	case "B_G_Offroad_01_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rebel"};
		};
	};
	
	case "B_G_Offroad_01_armed_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rebel"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dunkelrot";};
			case 1: {_color = "Schwarz";};
			case 2: {_color = "Grau";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Polizei";};
			case 5: {_color = "Feuerwehr";};
			case 6: {_color = "Kripo";};
			case 7: {_color = "SEK";};
			case 8: {_color = "Taxi";};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige"};
			case 1: {_color = "Hellbraun"};
			case 2: {_color = "Grün"};
			case 3: {_color = "Blau"};
			case 4: {_color = "Dunkelblau"};
			case 5: {_color = "Gelb"};
			case 6: {_color = "Grau"};
			case 7: {_color = "Schwarz"};
			case 8: {_color = "Schwarz Alt"};
			case 9: {_color = "Polizei";};
			case 10: {_color = "Feuerwehr"};
			case 11: {_color = "Kripo"};
			case 12: {_color = "Kripo Alt"};
			case 13: {_color = "SEK";};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige"};
			case 1: {_color = "Hellbraun"};
			case 2: {_color = "Grün"};
			case 3: {_color = "Blau"};
			case 4: {_color = "Dunkelblau"};
			case 5: {_color = "Gelb"};
			case 6: {_color = "Grau"};
			case 7: {_color = "Schwarz"};
			case 8: {_color = "Schwarz Alt"};
			case 9: {_color = "Polizei";};
			case 10: {_color = "Feuerwehr"};
			case 11: {_color = "Kripo"};
			case 12: {_color = "Kripo Alt"};
			case 13: {_color = "SEK";};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Weiss"};
			case 2: {_color = "Rot"};
		};
	};
	
	case "C_Van_01_box_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Weiss"};
			case 2: {_color = "Rot"};
			case 3: {_color = "Feuerwehr"};
			case 4: {_color = "TWD"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Weiss"};
			case 2: {_color = "Rot"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange";};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange";};
		};
	};
	
	case "O_Truck_02_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Einsatzleitung";};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei";};
			case 1: {_color = "Rebel"};
		};
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blau"};
			case 1: {_color = "Dunkelrot"};
			case 2: {_color = "Blueline"};
			case 3: {_color = "Elliptical"};
			case 4: {_color = "Furious"};
			case 5: {_color = "Jeans"};
			case 6: {_color = "Light"};
			case 7: {_color = "Shadow"};
			case 8: {_color = "Speedy"};
			case 9: {_color = "Sunset"};
			case 10: {_color = "Vrana"};
			case 11: {_color = "Marvin"};
			case 12: {_color = "Wave"};
			case 13: {_color = "Polizei";};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blau-Weiss"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei";};
			case 1: {_color = "SEK";};
			case 2: {_color = "Rebel"};
		};
	};
	
	case "O_Heli_Transport_04_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Feuerwehr";};
			case 2: {_color = "VIP";};
		};
	};
	
	case "O_Heli_Transport_04_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Feuerwehr";};
			case 2: {_color = "VIP";};
		};
	};
	
	case "B_Heli_Transport_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "SEK";};
			case 2: {_color = "VIP";};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei";};
			case 1: {_color = "SEK";};
			case 2: {_color = "Rebel"};
			case 3: {_color = "Feuerwehr"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "SEK";};
		};
	};
	
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel"};
		};
	};
	
	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "SEK"};
		};
	};
	
	case "B_SDV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "SEK";};
		};
	};
	
	case "C_Rubberboat":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Schwarz";};
			case 1: {_color = "Schwarz";};
		};
	};
};

_color;