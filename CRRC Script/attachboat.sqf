/*
Script by tryteyker
For use with Konyo's MH-47E Addon
1 Boat Attach version
*/

_unit = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
_boats = nearestObjects [_unit,["Ship"],20];
chinook = nearestObject [_unit,"Air"];
boat1 = _boats select 0;
_unit removeAction _ID;

if (isNull chinook) exitWith {_unit addAction [("<t color=""#33FFFF"">" + ("Attach boat") + "</t>"),"attachboat.sqf",nil,5,true,true,"","(_target distance chinook) <= 30"]};
if ((getposATL chinook select 2) > 5 || (!((getposATL chinook select 2) < 2) && (getposASLW chinook select 2) > 5)) exitWith {};

if ((count _boats) > 1) exitWith {
_unit addAction [("<t color=""#33FFFF"">" + ("Attach boats") + "</t>"),"attach2boats.sqf",nil,5,true,true,"","(_target distance chinook) <= 30"];
hint "2 boats present. Use Action again to tow boats into the vehicle.";
};

if ((count crew boat1) > 0) then {
boat1crew = [];
{
boat1crew = boat1crew + [_x];
moveout _x;
_x moveincargo chinook;
_x leaveVehicle boat1;
_x addAction [("<t color=""#33FFFF"">" + ("Move into boat") + "</t>"),"boatcargoswitch.sqf"];
} foreach crew boat1;
hintSilent "Crew has been moved into cargo.";
};
boat1 attachTo [chinook,[0.1,3,-0.3]];
boat1 enablesimulation false;
boat1 setDir 180;

chinook addAction [("<t color=""#33FFFF"">" + ("Eject boat") + "</t>"),"ejectboat.sqf"];