/*

	[] call GW_3DEN_fnc_init

*/
#include "script_component.hpp"

if (canSuspend) then {
	sleep 1;
};

if (isClass (missionConfigFile >> "GW_FRAMEWORK")) then {
//	[] call FUNC(init3DEN);
	[] call compile preprocessFileLineNumbers "core\XEH_preInit.sqf";
	LOG("XEH_preInit reloaded");
};
