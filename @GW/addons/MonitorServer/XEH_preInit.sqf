#include "script_component.hpp"
#include "XEH_PREP.sqf"

GVAR(doEnabled) = true;
GVAR(infoFPS) = [];
GVAR(infoHC) = [];
GVAR(adminUpdateList) = [];
GVAR(HeadlessList) = [];

[QGVAR(addHC), {
	GVAR(HeadlessList) pushBack _this;
	addMissionEventHandler ["HandleDisconnect",{
		params ["_unit","_id","_uid","_name"];
		if !(_unit isKindOf "HeadlessClient_F") exitWith {false};
		GVAR(HeadlessList) deleteAt (GVAR(HeadlessList) find _unit);
		publicVariable QGVAR(HeadlessList);
	}];
}] call CBA_fnc_addEventHandler;

[QGVAR(addServerRequest), {
	GVAR(adminUpdateList) pushBackUnique _this;
	if (isNil QGVAR(PFH)) then {
		GVAR(PFH) = [{
			[] call FUNC(addUpdate);
		}, 5, []] call CBA_fnc_addPerFrameHandler;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(removeServerRequest), {
	params ["_unit"];
	GVAR(adminUpdateList) deleteAt (GVAR(adminUpdateList) find _unit);

	if ((count GVAR(adminUpdateList)) isEqualTo 0) then {
		[GVAR(PFH)] call CBA_fnc_removePerFrameHandler;
		GVAR(PFH) = nil;
		GVAR(infoFPS) = [];
		GVAR(infoHC) = [];
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(getInfo), {
	private _machine = 0;
	if (isServer) then {
		_machine = 1;
	};
	if (CBA_isHeadlessClient) then {
		_machine = 2;
		[QGVAR(getInfoHC), player] call CBA_fnc_localEvent;
	};
	[QGVAR(sendInfo), [_machine, (round diag_fps)]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(sendInfo), {
	GVAR(infoFPS) pushBack _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(getInfoHC), {
	params ["_headless"];
	if (CBA_isHeadlessClient) then {
		[QGVAR(sendInfoHC), [_headless, (round diag_fps)]] call CBA_fnc_serverEvent;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(sendInfoHC), {
	params ["_headless","_fps"];
	private ["_units","_groups"];
	_units = ({(owner _x) isEqualTo (owner _headless)} count allUnits);
	_groups = ({(groupOwner _x) isEqualTo (owner _headless)} count allGroups);
	GVAR(infoHC) pushBack [_headless, _units, _groups, _fps];
}] call CBA_fnc_addEventHandler;

[QGVAR(reciveServerInfo), {
	_this call FUNC(Display);
}] call CBA_fnc_addEventHandler;

[QGVAR(removeUpdatesfromServer), {
	[QGVAR(removeServerRequest), player] call CBA_fnc_serverEvent;
	[{
		hintSilent "";
	}, [], 3] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
