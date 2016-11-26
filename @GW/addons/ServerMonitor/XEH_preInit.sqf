#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.sqf"

GVAR(doEnabled) = true;
GVAR(infoFPS) = [];
GVAR(infoHC) = [];
GVAR(adminUpdateList) = [];
GVAR(HeadlessList) = [];

[QGVAR(addHC), {
	GVAR(HeadlessList) pushBack _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(sendInfo), {
	GVAR(infoFPS) pushBack _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(getInfo), {
	private _machine = 0;
	if (isServer) then {
		_machine = 1;
	};
	if (CBA_isHeadlessClient) then {
		_machine = 2;
	};
	[QGVAR(sendInfo), [_machine, (round diag_fps)]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(sendInfoHC), {
	GVAR(infoHC) pushBack _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(getInfoHC), {
	params ["_headless"];
	private ["_countGroups","_countUnits"];
	if (_headless isEqualTo GVARMAIN(Gamelogic)) then { _headless = "Server"; };
	_countGroups = ({local _x} count allGroups);
	_countUnits = ({local _x} count allUnits);

	[QGVAR(sendInfoHC), [_headless, _countGroups, _countUnits, (round diag_fps)]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(addServerRequest), {
	GVAR(adminUpdateList) pushBackUnique _this;
	if (isNil QGVAR(serverMonitorPFH)) then {
		[] call FUNC(addUpdate);
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(removeServerRequest), {
	GVAR(adminUpdateList) deleteAt (GVAR(adminUpdateList) find _this);

	if ((count GVAR(adminUpdateList)) isEqualTo 0) then {
		[GVAR(serverMonitorPFH)] call CBA_fnc_removePerFrameHandler;
		GVAR(serverMonitorPFH) = nil;
		GVAR(infoFPS) = [];
		GVAR(infoHC) = [];
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(reciveServerInfo), {
	_this call FUNC(Display);
}] call CBA_fnc_addEventHandler;

[QGVAR(removeUpdatesfromServer), {
	[QGVAR(removeServerRequest), player] call CBA_fnc_serverEvent;
	[{
		hintSilent "";
	}, [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

ADDON = true;
