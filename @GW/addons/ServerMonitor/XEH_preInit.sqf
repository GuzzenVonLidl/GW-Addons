#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.sqf"

GVAR(infoFPS) = [];
GVAR(infoHC) = [];

[QGVAR(sendInfo), {
	GVAR(infoFPS) pushBack _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(getInfo), {
	params ["_target"];
	private _machine = 0;
	if (isServer) then {
		_machine = 1;
	};
	if (CBA_isHeadlessClient) then {
		_machine = 2;
	};

	[QGVAR(sendInfo), [_machine, (round diag_fps)], _target] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(sendInfoHC), {
	GVAR(infoHC) pushBack _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(getInfoHC), {
	params ["_target","_headless"];
	private ["_countGroups","_countUnits"];
	if (_headless isEqualTo GVARMAIN(Gamelogic)) then { _headless = "Server"; };
	_countGroups = ({local _x} count allGroups);
	_countUnits = ({local _x} count allUnits);

	[QGVAR(sendInfoHC), [_headless, _countGroups, _countUnits, (round diag_fps)], _target] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;


ADDON = true;
