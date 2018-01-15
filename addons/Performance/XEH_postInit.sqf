// #define DEBUG_MODE_FULL
#include "script_component.hpp"

if (isServer && !(isClass(missionConfigFile >> "GW_Modules" >> "Performance")) && (call EFUNC(Common,canUseAddonVersion))) then {

	["CAManBase", "init", {
		[{
			_this call FUNC(Simulation);
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
	["CAManBase", "KILLED", {
		[{
			_this call FUNC(HandlerKilled);
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	GVAR(CleanUp_PFH) = [{
		if (GVAR(Enabled)) then {
			[] call FUNC(HandlerCleanUp);
		};
	}, GVAR(Delay), []] call CBA_fnc_addPerFrameHandler;

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

[QGVAR(removeGroup), {
	deleteGroup _this;
}] call CBA_fnc_addEventHandler;
