#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.sqf"

GVAR(viewDistance_Enabled) = true;
GVAR(viewDistance_Default) = 1200;
GVAR(viewDistance_Max) = 10000;
GVAR(Grass_Enabled) = true;
GVAR(Grass_allowDisable) = true;
GVAR(NameTags_Enabled) = true;
GVAR(NameTags_Max) = 50;

GVAR(STHud_Enabled) = (isClass(configFile >> "CfgPatches" >> "STUI_Core") || isClass(configFile >> "CfgPatches" >> "ST_STHud"));
if (isClass (configFile >> "CfgPatches" >> "STUI_Core")) then {
	STHUD_UIMode = 0;
	STHud_ShowBearingInVehicle = false;
	STUI_Occlusion = true;
	GVAR(Toggle_STHud_Compass) = true;
	GVAR(STHud_Compass_Stored) = STHud_Compass;
	FUNC(STHud_Toggle_Compass) = {
		if !(GVAR(Toggle_stHud_Compass)) then {
			GVAR(Toggle_stHud_Compass) = true;
			STHud_Compass = GVAR(STHud_Compass_Stored);
		} else {
			GVAR(Toggle_stHud_Compass) = false;
			STHud_Compass = {};
		};
	};
} else {
	ST_STHud_ShownUI = 0;
	ST_STHud_ShowCompass = true;
};

GVAR(mapMonitor_Enabled) = false;
GVAR(mapMonitor_sigTerm) = false;
GVAR(mapMonitor_constantUpdate) = false; // Whether markers should update while the map isn't open.
GVAR(mapMonitor_bulletMarkerLifetime) = 2; // Seconds of marker lifetime.
GVAR(mapMonitor_bulletMaxFlighttime) = 3; // Seconds of max bullet lifetime.
GVAR(mapMonitor_bulletMarkerRefreshRate) = 24; // Hertz of bullet tracking refresh rate, same as FPS.
FUNC(mapMonitor_compareBool) = {
		((_this select 0) && (_this select 1)) || {!(_this select 0) && !(_this select 1)}; // Either both true or both false
};

[QGVAR(settings), {
	params ["_type"];
	if (hasInterface) then {
		switch (_type) do {
			case "save": {
				if (isClass (configFile >> "CfgPatches" >> "STUI_Core")) then {
					profileNamespace setVariable [QGVAR(clientSettings), [viewDistance, STHUD_UIMode, GVAR(Toggle_stHud_Compass)]];
				} else {
					profileNamespace setVariable [QGVAR(clientSettings), [viewDistance, ST_STHud_ShownUI, ST_STHud_ShowCompass]];
				};
			};

			case "load": {
				private _profile = (profileNamespace getVariable QGVAR(clientSettings));
				setViewDistance (_profile select 0);
				setTerrainGrid 25;
				if (isClass (configFile >> "CfgPatches" >> "STUI_Core")) then {
					STHUD_UIMode = (_profile select 1);
					[] call FUNC(STHud_Toggle_Compass);
				} else {
					(_profile select 1) call fn_sthud_usermenu_changeMode;
					ST_STHud_ShowCompass = (_profile select 2);
				};
			};
		};
	};
}] call CBA_fnc_addEventHandler;

ADDON = true;
