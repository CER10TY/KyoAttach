/*
Script by tryteyker
For use with Konyo's MH-47E Addon
2 Boats Attach version
*/

_unit = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
chinook = nearestobject [_unit,"Air"];
_boats = nearestObjects [_unit,["Ship"],20];
boat1 = _boats select 0;
boat2 = _boats select 1;
_unit removeAction _ID;

if (isNull chinook) exitWith {_unit addAction [("<t color=""#33FFFF"">" + ("Attach boats") + "</t>"),"attachboat.sqf"]};
if ((getposATL chinook select 2) > 5 || (!((getposATL chinook select 2) < 2) && (getposASLW chinook select 2) > 5)) exitWith {};

if ((count _boats) == 1) exitWith {
_unit addAction [("<t color=""#33FFFF"">" + ("Attach boat") + "</t>"),"attachboat.sqf"];
hint "1 boat present. Use Action again to tow boat into the vehicle.";
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
hintSilent "Crew of the first boat has been moved into cargo.";
};

if ((count crew boat2) > 0) then {
boat2crew = [];
{
boat2crew = boat2crew + [_x];
moveout _x;
_x moveincargo chinook;
_x leaveVehicle boat2;
_x addAction [("<t color=""#33FFFF"">" + ("Move into boat") + "</t>"),"boatcargoswitch.sqf"];
} foreach crew boat2;
hintSilent "Crew of the second boat has been moved into cargo.";
};
boat1 attachTo [chinook,[0.1,3,-0.3]];
boat1 enablesimulation false;
boat1 setdir 180;
boat2 attachTo [chinook,[0.2,-1.7,-0.3]];
boat2 enablesimulation false;
boat2 setDir 180;
chinook addaction [("<t color=""#33FFFF"">" + ("Eject boats") + "</t>"),"ejectboats.sqf"];