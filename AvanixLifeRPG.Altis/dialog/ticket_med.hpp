class avanix_rechnung_give
{
	idd = 2650;
	name = "avanix_rechnung_give";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class avanix_RscTitleBackground:avanix_RscText {
			colorBackground[] = {0.016,0.282,0.624,0.7};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:avanix_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class Title : avanix_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2651;
			text = "";
			x = 0.3;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class moneyEdit : avanix_RscEdit 
		{
			idc = 2652;
			
			text = "100";
			sizeEx = 0.030;
			x = 0.40; y = 0.30;
			w = 0.25; h = 0.03;
		};

		class payTicket: avanix_RscButtonMenu {
			idc = -1;
			text = "Ticket Geben";
			colorBackground[] = {0.016,0.282,0.624,0.5};
			onButtonClick = "[] call avanix_fnc_medTicketGive";
			x = 0.45;
			y = 0.35;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class avanix_rechnung_pay
{
	idd = 2600;
	name = "avanix_rechnung_pay";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class avanix_RscTitleBackground:avanix_RscText {
			colorBackground[] = {0.016,0.282,0.624,0.7};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:avanix_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class InfoMsg : avanix_RscStructuredText
		{
			idc = 2601;
			sizeEx = 0.020;
			text = "";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class payTicket: avanix_RscButtonMenu {
			idc = -1;
			text = "Bezahlen";
			colorBackground[] = {0.016,0.282,0.624,0.5};
			onButtonClick = "[] call avanix_fnc_medTicketPay;";
			x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class refuseTicket : avanix_RscButtonMenu {
			idc = -1;
			text = "Ablehnen";
			colorBackground[] = {0.016,0.282,0.624,0.5};
			onButtonClick = "closeDialog 0;";
			x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};