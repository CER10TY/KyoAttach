/*
Script by tryteyker
For use with Konyo's MH-47E Addon
AddAction to switch back to boat seats.
SPECIAL THANKS TO F2K SEL FOR IDEAS AND SUCCESSFUL IMPLEMENTATION OF THE IF STATEMENTS.
*/

_unit = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
_emptypos = _unit emptypositions "cargo";

if (_caller in boat1crew) then {
	if ((count crew boat1) == 0) then {
	moveout _caller;
	_caller moveindriver boat1;
	_caller leaveVehicle _unit;
	} else {
	moveout _caller;
	_caller moveincargo boat1;
	_caller leaveVehicle _unit;
	};
};

if (_caller in boat2crew) then {
	if ((count crew boat2) == 0) then {
	 moveout _caller;
	_caller moveindriver boat2;
	_caller leaveVehicle _unit;
	} else {
	 moveout _caller;
	_caller moveindriver boat2;
	_caller leaveVehicle _unit;
	};
};

if (_emptypos == 23) then {
_unit removeAction _ID;
hintSilent "All units are in the boats";
};