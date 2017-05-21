/*

	[] call GW_3DEN_fnc_Init

*/
#include "script_component.hpp"

if (canSuspend) exitWith {false};

if (is3DEN) then {
	if (getText(configfile >> "CfgPatches" >> "cba_main" >> "version") isEqualTo "3.3.1.170504") then {
		[] call CBA_fnc_preInit;
	};

	if (isClass (missionConfigFile >> "GW_FRAMEWORK")) then {
		TRACE_1("XEH_preInit started from", (_this select 0));
	//	["init"] call FUNCMAIN(init3DEN);
	//	[] call compile preprocessFileLineNumbers "core\XEH_preInit.sqf";
		LOG("XEH_preInit reloaded");
	};

	setViewDistance 3000;
	setObjectViewDistance [2500, 100];

	[] spawn {
		_time = 0;
		while {true} do {
			[] call FUNC(showStats);
			uiSleep 0.1;
		};
	};
};
