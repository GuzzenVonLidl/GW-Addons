#include "script_component.hpp"

#include "XEH_PREP.sqf"

GVAR(Simulation) = true;			//	Removes lag from spawning units
GVAR(Delay) = 60;					//	Delay between each loop for removing objects

GVAR(DynamicViewDistance_Enabled) = false;
GVAR(DynamicViewDistance_AvgTargetDistance) = 25;
GVAR(DynamicViewDistance_getAvgFPS) = [];

GVAR(UnitCaching_Enabled) = false;
GVAR(UnitCaching_Objects) = [];

if ((getNumber (missionConfigFile >> "GW_Modules" >> "Common" >> "version")) >= 1.6) then {
	[] spawn {
		[
			QGVAR(Enabled), "LIST",
			["Enable clean up", "Toggle clean up"],
			QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], true
		] call FUNCMAIN(settingsInit);

		[
			QGVAR(UnitEnabled), "LIST",
			["Gear removal", "Remove all equipment from dead unit execpt for uniform"],
			QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], true
		] call FUNCMAIN(settingsInit);
	};
};
