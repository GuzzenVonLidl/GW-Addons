// #define DEBUG_MODE_FULL
#include "script_component.hpp"

if (isClass(missionConfigFile >> "GW_Modules" >> "Performance")) exitWith {false};

[QGVAR(removeGroup), {
	if (_this getVariable [QGVAR(autoDelete), true]) then {
		deleteGroup _this;
	};
}] call CBA_fnc_addEventHandler;

if (isServer) then {
/*
	["CAManBase", "init", {
		_this call FUNC(Simulation);
	}, true, [], true] call CBA_fnc_addClassEventHandler;
*/

	["CAManBase", "KILLED", {
		_this call FUNC(HandlerKilled);
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	GVAR(CleanUp_PFH) = [{
		if (GVAR(Enabled)) then {
			[] call FUNC(HandlerCleanUp);
		};
	}, GVAR(Delay), []] call CBA_fnc_addPerFrameHandler;

	if (isClass(missionConfigFile >> "GW_Modules" >> "Performance")) then {
		GVAR(bodyCleanup) = addMissionEventHandler ["HandleDisconnect", {
			params ["_unit"];
			if (EGVAR(startUp,Enabled)) then {
				deleteVehicle _unit;
			};
		}];

		[QEGVAR(startUp,setSafetyMode), {
			if (isNil QGVAR(bodyCleanup)) then {
				removeMissionEventHandler ["HandleDisconnect", GVAR(bodyCleanup)];
			};
		}] call CBA_fnc_addEventHandler;
	};
};
