/*
Script made by tryteyker (2013)
For use with Konyo's MH-47E Addon
1 ATV AddAction version
*/

_unit = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
chinook = nearestObject [player,"Air"];
ATV = nearestObjects [_unit,["Car"],20];
atv1 = ATV select 0;
_unit removeaction _ID;

//hint format ["%1",chinook];

if (isNull chinook) exitWith {_unit addAction [("<t color=""#33FFFF"">" + ("Attach ATV") + "</t>"),"attachatv.sqf"]};

if ((count ATV) > 1) exitWith {
_unit addAction [("<t color=""#33FFFF"">" + ("Attach ATVs") + "</t>"),"attach2atv.sqf"];
hint "2 ATVs present, use the action again to tow both into the Chinook.";
};

atv1 attachTo [chinook,[0.1,3,0]];
atv1 enablesimulation false;
atv1 setDir 180;
detachATV = chinook addAction [("<t color=""#33FFFF"">" + ("Eject ATV") + "</t>"),"detach.sqf"];
