/*
Author: tryteyker
For use with MH-47E Addon
Last revision: 31-08-2014 
*/

// Fetch variables passed onto function
_vehicle = _this select 0; // Will be an object
_type = toLower (typeOf _vehicle); // So we convert it


switch _type do { // There is isKindOf, but it requires us to specify a specific type (which we cant really do)
	case "b_quadbike_01_f":
	{
		_localATVs = nearestObjects [_vehicle,["car"],50];
		chinook = nearestObject [_vehicle,"Air"];
		if (count _localATVs == 1) then {
		ATV1 = _localATVs select 0;
		atv1 attachTo [chinook,[0.1,3,0]];
		atv1 enableSimulation false;
		atv1 setDir 180;
		detachATV = chinook addAction [("<t color=""#33FFFF"">" + ("Eject ATV") + "</t>"),"detach.sqf"];
		} else {
		atv1 = _localATVs select 0;
		atv2 = _localaTVs select 1;
		atv1 attachTo [chinook,[0.2,-3,-0.5]];
		atv2 attachTo [chinook,[0.2,3,-0.3]];
		atv1 setdir 180;
		atv2 setDir 180;
		atv1 enablesimulation false;
		atv2 enablesimulation false;
		ejectATV = chinook addAction [("<t color=""#33FFFF"">" + ("Eject ATVs") + "</t>"),"ejectatvs.sqf"];
		};
	};
	case "b_boat_transport_01_f":
	{
		_boats = nearestObjects [_vehicle,["Ship"],20];
		chinook = nearestObject [_vehicle,"Air"];
		if (count _boats == 1) then {
		boat1 = _boats select 0;
		boat1 attachTo [chinook,[0.1,3,-0.3]];
		boat1 enablesimulation false;
		boat1 setDir 180;
		chinook addAction [("<t color=""#33FFFF"">" + ("Eject boat") + "</t>"),"ejectboat.sqf"];
		} else {
		boat1 = _boats select 0;
		boat2 = _boats select 1;
		boat1 attachTo [chinook,[0.1,3,-0.3]];
		boat1 enablesimulation false;
		boat1 setdir 180;
		boat2 attachTo [chinook,[0.2,-1.7,-0.3]];
		boat2 enablesimulation false;
		boat2 setDir 180;
		chinook addaction [("<t color=""#33FFFF"">" + ("Eject boats") + "</t>"),"ejectboats.sqf"];
		};
	};
};