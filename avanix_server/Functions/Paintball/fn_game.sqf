pb_spielstatus=1;
[[4,"<br/><t align='center'><t size='6'><img image='textures\misc\paintball.jpg'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>PAINTBALL</t></t><br/><br/><t size='1'>Ein Spieler hat soeben eine Lobby in der Paintballarena eroeffnet! Die Lobby schliesst sich in 5 Minuten!</t>"],"avanix_fnc_broadcast",true,false] spawn avanix_fnc_MP;
uisleep 300;

if (count pb_spieler>=2) then {

    pb_spielstatus=2;
    {
        [[2],"avanix_fnc_pb_response",_x,false] spawn avanix_fnc_MP;
    } forEach pb_spieler;
    uisleep 60;
    _msg = "Das Spiel läuft noch 4 Minuten";
    {
        [[1,_msg],"avanix_fnc_pb_response",_x,false] spawn avanix_fnc_MP;
    } forEach pb_spieler;
    uisleep 60;
    _msg = "Das Spiel läuft noch 3 Minuten";
    {
        [[1,_msg],"avanix_fnc_pb_response",_x,false] spawn avanix_fnc_MP;
    } forEach pb_spieler;
    uisleep 60;
    _msg = "Das Spiel läuft noch 2 Minuten";
    {
        [[1,_msg],"avanix_fnc_pb_response",_x,false] spawn avanix_fnc_MP;
    } forEach pb_spieler;
    uisleep 60;
    _msg = "Das Spiel läuft noch eine Minute!";
    {
        [[1,_msg],"avanix_fnc_pb_response",_x,false] spawn avanix_fnc_MP;
    } forEach pb_spieler;
    uisleep 60;
    {
        [[3],"avanix_fnc_pb_response",_x,false] spawn avanix_fnc_MP;
    } forEach pb_spieler;
    pb_spieler = [];
    pb_spielstatus=0;
    joinmode = 0;
    publicVariable "joinmode";

} else {

    _msg = "Da zu wenig Spieler sich in der Lobby befanden wurde das Spiel abgebrochen!";
    {
        [[1,_msg],"avanix_fnc_pb_response",_x,false] spawn avanix_fnc_MP;
    } forEach pb_spieler;
    pb_spieler = [];
    pb_spielstatus=0;
    joinmode = 0;
    publicVariable "joinmode";

};