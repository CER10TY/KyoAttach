/*
Script by tryteyker
For use with Konyo's MH-47E Addon
1 Boat Eject version
SPECIAL THANKS TO F2K SEL FOR FIXING UP THE WHILE LOOP.
*/

_unit = _this select 0;
_caller = _this select 1;
_ID = _this select 2;

_unit removeAction _ID;

_height = -0.5;
_outboat1 = 0;


while {boat1 distance chinook < 9} do {
 _outboat1 = _outboat1 - 0.001;
   sleep 0.00001;
   boat1 attachto [chinook,[0.2,_outboat1,_height]];
};

detach boat1;
boat1 enableSimulation true;
boat1 allowDamage false;

if (speed chinook > 25 && (count crew boat1) > 0) then {
boat1 setvelocity [(_vel select 0) - 15 * (sin _dir),(_vel select 1) - 15 * (cos _dir),0];  
} else {
if (speed chinook > 25) then {
boat1 setvelocity [(_vel select 0) - 5 * (sin _dir),(_vel select 1) - 5 * (cos _dir),0];  
};
};
if (speed chinook <= 25 && (count crew boat1) > 0) then {
boat1 setvelocity [(_vel select 0) - 15 * (sin _dir),(_vel select 1) - 15 * (cos _dir),0];  
} else {
if (speed chinook <= 25) then {
boat1 setvelocity [(_vel select 0) - 5 * (sin _dir),(_vel select 1) - 5 * (cos _dir),0];  
};
};
sleep 0.5;
if ((getpos chinook select 2) > 15) then {
_chuteboat1 = createVehicle ["B_Parachute_02_F",(getpos boat1),[],0,"FLY"];
_chuteboat1 setPos (getPos boat1);
_chuteboat1 setDir (getDir boat1);
boat1 attachTo [_chuteboat1,[0,0,0]];
	waitUntil {(getposASLW boat1 select 2) < 5};
	detach boat1;
};

sleep 2;
boat1 allowDamage true;

boat1 addAction [("<t color=""#33FFFF"">" + ("Attach boat") + "</t>"),"attachboat.sqf"];