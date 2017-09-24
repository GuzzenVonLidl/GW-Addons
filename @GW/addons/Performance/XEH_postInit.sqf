// #define DEBUG_MODE_FULL
#include "script_component.hpp"

if (isServer && !(isClass(missionConfigFile >> "GW_Modules" >> "Performance"))) then {
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

	if (isNil QGVAR(CleanUp_PFH)) then {
		GVAR(CleanUp_PFH) = [{
			if (GVAR(Enabled)) then {
				[] call FUNC(HandlerCleanUp);
			};
		}, GVAR(Delay), []] call CBA_fnc_addPerFrameHandler;
	};
};

[QGVAR(removeGroup), {
	deleteGroup _this;
}] call CBA_fnc_addEventHandler;
