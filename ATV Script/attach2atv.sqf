/*
Script made by tryteyker (2013)
For use with Konyo's MH-47E Addon
2 ATV AddAction version
*/

_unit = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
chinook = nearestObject [player,"Air"];
ATV = nearestObjects [player,["Car"],50];
atv1 = ATV select 0;
atv2 = ATV select 1;

_unit removeaction _ID;

if (isNull chinook) exitWith {_unit addAction [("<t color=""#33FFFF"">" + ("Attach ATVs") + "</t>"),"attach2atv.sqf"]};

if ((count ATV) == 1) exitWith {
_unit addAction [("<t color=""#33FFFF"">" + ("Attach ATV") + "</t>"),"attachatv.sqf"];
hint "1 ATV present. Use Action again to tow ATV into the vehicle.";
};

atv1 attachTo [chinook,[0.2,-3,-0.5]];
atv2 attachTo [chinook,[0.2,3,-0.3]];
atv1 setdir 180;
atv2 setDir 180;
atv1 enablesimulation false;
atv2 enablesimulation false;

ejectatv = chinook addAction [("<t color=""#33FFFF"">" + ("Eject ATVs") + "</t>"),"ejectatvs.sqf"];