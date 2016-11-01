/*

	[] call GW_3DEN_fnc_init

*/
#include "script_component.hpp"

if (canSuspend) exitWith {false};

if (is3DEN && isClass (missionConfigFile >> "GW_FRAMEWORK")) then {
	TRACE_1("XEH_preInit started from", (_this select 0));
//	["init"] call FUNCMAIN(init3DEN);
	[] call compile preprocessFileLineNumbers "core\XEH_preInit.sqf";
	LOG("XEH_preInit reloaded");
};
