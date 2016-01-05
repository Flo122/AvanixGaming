if("ItemRadio" in assignedItems player) then 
{
	[] spawn avanix_fnc_openMessages;
}
	else
{
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Kein Telefon</t><br/><br/>
	<t size='0.90 'font='puristaLight' align='left'>Geh in den nächsten Baumarkt und kauf dir ein Telefon</t><br/>"];
};