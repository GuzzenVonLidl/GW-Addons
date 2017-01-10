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

["CAManBase", "init", {
	[QGVAR(UnitCaching_addObject), (_this select 0)] call CBA_fnc_LocalEvent;
}, true, [], true] call CBA_fnc_addClassEventHandler;

["CAManBase", "KILLED", {
	[QGVAR(UnitCaching_removeObject), (_this select 0)] call CBA_fnc_LocalEvent;
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QGVAR(settings), {
	params ["_type"];
	if (hasInterface) then {
		if !(isNil {(profileNamespace getVariable "GOL_Client_Settings")}) then {
			profileNamespace setVariable ["GOL_Client_Settings", nil];
		};
		if !(isNil {(profileNamespace getVariable QGVAR(clientSettings))}) then {
			profileNamespace setVariable [QGVAR(clientSettings), nil];
		};
		if !(isNil {(profileNamespace getVariable QGVAR(clientSettingsV2))}) then {
			profileNamespace setVariable [QGVAR(clientSettings), nil];
		};
		switch (toLower(_type)) do {
			case "save": {
				if (GVAR(STHud_Enabled)) then {
					profileNamespace setVariable [QGVAR(clientSettingsV3), [[viewDistance, getTerrainGrid], [STHUD_UIMode, !GVAR(Toggle_STHud_Compass)]]];
				} else {
					profileNamespace setVariable [QGVAR(clientSettingsV3), [[viewDistance, getTerrainGrid], []]];
				};
//				saveProfileNamespace;
			};

			case "load": {
				private _profile = (profileNamespace getVariable QGVAR(clientSettingsV3));
				private _profilePerf = (_profile select 0);
				private _profileUI = (_profile select 1);
				setViewDistance (_profilePerf select 0);
				setTerrainGrid (_profilePerf select 1);
				if (GVAR(STHud_Enabled) && !(_profileUI isEqualTo [])) then {
					STHUD_UIMode = (_profileUI select 0);
					[(_profileUI select 1)] call FUNC(STHud_Toggle_Compass);
				};
			};
		};
	};
}] call CBA_fnc_addEventHandler;


[QGVAR(DynamicViewDistance_enablePFH), {
	if ((hasInterface && !isServer) || !isMultiplayer) then {
		params ["_toggle"];
		if (_toggle) then {
			if (isNil QGVAR(DynamicViewDistance_PFH)) then {
				GVAR(DynamicViewDistance_PFH) = [{
					[] call FUNC(DynamicViewDistance_Handler);
				}, 0.1, []] call CBA_fnc_addPerFrameHandler;
			};
		} else {
			if !(isNil QGVAR(DynamicViewDistance_PFH)) then {
				[GVAR(DynamicViewDistance_PFH)] call CBA_fnc_removePerFrameHandler;
				GVAR(DynamicViewDistance_PFH) = nil;
			};
		};
		GVAR(DynamicViewDistance_Enabled) = _toggle;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_addObject), {
	if !(_this isKindOf "HeadlessClient_F") then {
		GVAR(UnitCaching_Objects) pushBackUnique _this;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_removeObject), {
	GVAR(UnitCaching_Objects) deleteAt (GVAR(UnitCaching_Objects) find _this);
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_requestUpdate), {
	params ["_object"];
	_object setPos (getPos _object);
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_toggleObject), {
	params ["_object","_toggle"];
	if (_toggle) then {
		GVAR(UnitCaching_currentDisabled) pushBack _object;
	} else {
		GVAR(UnitCaching_currentDisabled) deleteAt (GVAR(UnitCaching_currentDisabled) find _object);
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_enablePFH), {
	if ((hasInterface && !isServer) || !isMultiplayer) then {
		params ["_toggle"];
		if (_toggle) then {
			if (isNil QGVAR(UnitCaching_PFH)) then {
				GVAR(UnitCaching_PFH) = [{
					[] call FUNC(UnitCaching_Handler);
				}, 5, []] call CBA_fnc_addPerFrameHandler;
			};
		} else {
			if !(isNil QGVAR(UnitCaching_PFH)) then {
				[GVAR(UnitCaching_PFH)] call CBA_fnc_removePerFrameHandler;
				GVAR(UnitCaching_PFH) = nil;
			};
		};
		GVAR(UnitCaching_Enabled) = _toggle;
	};
}] call CBA_fnc_addEventHandler;
