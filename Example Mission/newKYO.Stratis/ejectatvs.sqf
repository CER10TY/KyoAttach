/*
Script made by tryteyker (2013)
For use with Konyo's MH-47E Addon
2 ATV Version
*/

_unit = _this select 0;
_caller = _this select 1;
_ID = _this select 2;

_unit removeAction _ID;
ATV1 allowDamage false;
ATV2 allowDamage false;

	if ((getposATL chinook select 2) > 25) then {
		detach atv1;
		if ((speed chinook) > 15) then {
		atv1 setVelocity [(sin (getDir ATV1)) * 5, (cos (getDir ATV1)) * 5, 1];
		};
		if ((speed chinook) <= 15) then {
		ATV1 setVelocity [(sin (getDir ATV1)) * 25, (cos (getDir ATV1)) * 25, 1];
		};
		ATV1 enablesimulation true;
		sleep 2.5;
		_chute = createVehicle ["ParachuteWest",(getpos ATV1),[],0,"FLY"];
		_chute setpos [(getpos ATV1 select 0), getpos ATV1 select 1, (getpos ATV1 select 2)];
		_chute setDir (getDir ATV1);
		ATV1 attachTo [_chute,[0,0,0]];
		_chute setvelocity [0,0,-1];
		_chute allowDamage false;
		ATV1 setDamage 0;
		sleep 2;
		detach ATV2;
		if ((speed chinook) > 15) then {
		ATV2 setVelocity [(sin (getDir ATV2)) * 5, (cos (getDir ATV2)) * 5, 1];
		};
		if ((speed chinook) <= 15) then {
		ATV2 setVelocity [(sin (getDir ATV2)) * 20, (cos (getDir ATV2)) * 20, 1];
		};
		ATV2 enablesimulation true;
		sleep 2.5;
		_chute2 = createVehicle ["ParachuteWest",(getpos ATV2),[],0,"FLY"];
		_chute2 setpos [(getpos ATV2 select 0), getpos ATV2 select 1, (getpos ATV2 select 2)];
		_chute2 setDir (getDir ATV2);
		ATV2 attachTo [_chute2,[0,0,0]];
		_chute2 setvelocity [0,0,-1];
		_chute2 allowDamage false;
		ATV2 setDamage 0;
		ATV1 addAction [("<t color=""#33FFFF"">" + ("Attach ATV") + "</t>"),"attachatv.sqf"];
};

if ((getposATL chinook select 2) <= 25) then {
detach ATV1;

if ((speed chinook) > 15) then {
ATV1 setVelocity [(sin (getDir ATV1)) * 5, (cos (getDir ATV1)) * 5, 1];
};
if ((speed chinook) < 15) then {
ATV1 setVelocity [(sin (getDir ATV1)) * 20, (cos (getDir ATV1)) * 20, 1];
};
ATV1 enablesimulation true;
sleep 2;
detach ATV2;
if ((speed chinook) > 15) then {
ATV2 setVelocity [(sin (getDir ATV2)) * 5, (cos (getDir ATV2)) * 5, 1];
};
if ((speed chinook) < 15) then {
ATV2 setVelocity [(sin (getDir ATV2)) * 20, (cos (getDir ATV2)) * 20, 1];
};
ATV2 enablesimulation true;
ATV1 addAction [("<t color=""#33FFFF"">" + ("Attach ATV") + "</t>"),"attachatv.sqf"];
};

ATV1 allowDamage true;
ATV2 allowDamage true;