#include "script_component.hpp"

#include "XEH_PREP.sqf"

GVAR(viewDistance_Enabled) = true;
GVAR(viewDistance_Default) = 1200;
GVAR(viewDistance_Max) = 10000;
GVAR(Grass_Enabled) = true;
GVAR(Grass_allowDisable) = true;
GVAR(NameTags_Enabled) = true;
GVAR(NameTags_Max) = 50;

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

GVAR(mapMonitor_Enabled) = false;
GVAR(mapMonitor_sigTerm) = false;
GVAR(mapMonitor_constantUpdate) = false; // Whether markers should update while the map isn't open.
GVAR(mapMonitor_bulletMarkerLifetime) = 2; // Seconds of marker lifetime.
GVAR(mapMonitor_bulletMaxFlighttime) = 2; // Seconds of max bullet lifetime.
GVAR(mapMonitor_bulletMarkerRefreshRate) = 20; // Hertz of bullet tracking refresh rate, same as FPS.
FUNC(mapMonitor_compareBool) = {
		((_this select 0) && (_this select 1)) || {!(_this select 0) && !(_this select 1)}; // Either both true or both false
};

[QGVAR(settings), {
	params ["_type"];
	if (hasInterface) then {
		if !(isNil {(profileNamespace getVariable "GOL_Client_Settings")}) then {
			profileNamespace setVariable ["GOL_Client_Settings", nil];
		};
		if !(isNil {(profileNamespace getVariable QGVAR(clientSettings))}) then {
			profileNamespace setVariable [QGVAR(clientSettings), nil];
		};
		switch (toLower(_type)) do {
			case "save": {
				if (GVAR(STHud_Enabled)) then {
					profileNamespace setVariable [QGVAR(clientSettingsV2), [[viewDistance, getTerrainGrid], [STHUD_UIMode, !GVAR(Toggle_STHud_Compass)]]];
				} else {
					profileNamespace setVariable [QGVAR(clientSettingsV2), [[viewDistance, getTerrainGrid], []]];
				};
			};

			case "load": {
				private _profile = (profileNamespace getVariable QGVAR(clientSettingsV2));
				private _profilePerf = (_profile select 0);
				private _profileUI = (_profile select 1);
				setViewDistance (_profilePerf select 0);
				setTerrainGrid (_profilePerf select 1);
				if (GVAR(STHud_Enabled)) then {
					STHUD_UIMode = (_profileUI select 0);
					[(_profileUI select 1)] call FUNC(STHud_Toggle_Compass);
				};
			};
		};
	};
}] call CBA_fnc_addEventHandler;
