#include "script_component.hpp"

#include "XEH_PREP.sqf"

GVAR(viewDistance_Enabled) = true;
GVAR(viewDistance_Default) = 1200;
GVAR(viewDistance_Max) = 10000;
GVAR(Grass_Enabled) = true;
GVAR(Grass_allowDisable) = true;

GVAR(DynamicViewDistance_Enabled) = false;
GVAR(DynamicViewDistance_AvgTargetDistance) = 25;
GVAR(DynamicViewDistance_getAvgFPS) = [];

GVAR(UnitCaching_Enabled) = false;
GVAR(UnitCaching_Objects) = [];

GVAR(ParadropHalo) = true;
GVAR(ParadropStaticHeight) = 125;

GVAR(STHud_Enabled) = isClass(configFile >> "CfgPatches" >> "STUI_Core");
if (GVAR(STHud_Enabled)) then {
	STHUD_UIMode = 0;
	STHud_NoSquadBarMode = true; // Default: false
	STHud_ShowBearingInVehicle = false; // Default: true
	STUI_Occlusion = true; // Default: true
	STUI_RemoveDeadViaProximity = true; // Default: true
	GVAR(Toggle_STHud_Compass) = true;
	GVAR(STHud_Compass_Stored) = STHud_Compass;
	FUNC(STHud_Toggle_Compass) = {
		if !(GVAR(Toggle_STHud_Compass)) then {
			GVAR(Toggle_STHud_Compass) = true;
			STHud_Compass = GVAR(STHud_Compass_Stored);
		} else {
			GVAR(Toggle_STHud_Compass) = false;
			STHud_Compass = {};
		};
	};
};
