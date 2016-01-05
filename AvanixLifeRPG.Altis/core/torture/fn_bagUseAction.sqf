/*
	File: fn_useBag
	Author: DerOnkel/Avanix Gaming Community
	Email: info@avanix-gaming.de
	
	Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!   
*/
private["_gagger"];
_gagger = param[0,ObjNull,[ObjNull]];
hint format["Du wurdest von %1 ruhig gestellt.", _gagger getVariable["realname",_gagger]];
titleText ["Da du ruhig gestellt wurdest kannst du nicht mehr sprechen!", "PLAIN"];
5 enableChannel false;
//Disable Group Chat
3 enableChannel false;
//Disable Vehicle Chat
4 enableChannel false;
//Disable Side Chat
7 enableChannel false;
waitUntil{!(player getVariable ["gagged",false]) OR !(player getVariable ["restrained",false])};
hint "Du wurdest befreit du kannst nun wieder sprechen!";
titleText ["Du wurdest berfreit!", "PLAIN"];
5 enableChannel true;
3 enableChannel true;
4 enableChannel true;
7 enableChannel true;