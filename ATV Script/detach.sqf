/*
Script made by tryteyker (2013)
For use with Konyo's MH-47E Addon
1 ATV version
*/

_unit = _this select 0;
_caller = _this select 1;
_ID = _this select 2;

_unit removeAction _ID;

ATV1 allowDamage false;

	if ((getposATL chinook select 2) > 25) then {
		detach ATV1;
		if ((speed chinook) > 15) then {
		ATV1 setVelocity [(sin (getDir ATV1)) * 5, (cos (getDir ATV1)) * 5, 1];
		};
		if ((speed chinook) < 15) then {
		ATV1 setVelocity [(sin (getDir ATV1)) * 25, (cos (getDir ATV1)) * 25, 1];
		};
		ATV1 enablesimulation true;
		sleep 2.5;
		_chute = createVehicle ["B_Parachute_02_F",(getposATL ATV1),[],0,"FLY"];
		_chute setpos [(getpos ATV1 select 0), getpos ATV1 select 1, (getpos ATV1 select 2)];
		_chute setDir (getDir ATV1);
		ATV1 attachTo [_chute,[0,0,0]];
		_chute setvelocity [0,0,-1];
		_chute allowDamage false;
		ATV1 setDamage 0;
		ATV1 addAction [("<t color=""#33FFFF"">" + ("Attach ATV") + "</t>"),"attachatv.sqf",nil,5,true,true,"","(_target distance chinook) <= 30"];
			waitUntil {(getposATL ATV1 select 2) < 5};
			detach ATV1;
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
ATV1 addAction [("<t color=""#33FFFF"">" + ("Attach ATV") + "</t>"),"attachatv.sqf",[],5,true,true,"","(_target distance chinook) <= 30"];
};

ATV1 allowDamage true;