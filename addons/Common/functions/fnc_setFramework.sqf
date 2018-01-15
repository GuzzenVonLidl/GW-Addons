/*
	Author: GuzzenVonLidl
	Resets Settings Menu

	Usage:
	[] call GW_Common_Fnc_setFramework;

	Arguments: NO

	Return Value: NO

	Public: NO

*/
#include "script_Component.hpp"

{
	TRACE_1("CBA Settings", _x);
	[_x, (_x call CBA_settings_fnc_get), 1, "mission"] call CBA_settings_fnc_set;
} forEach GVARMAIN(settings3denArray);

if (GVARMAIN(mod_ACE3)) then {
	if !(([getText(configFile >> "CfgPatches" >> "ACE_main" >> "version"), 0, 3] call BIS_fnc_trimString) isEqualTo "3.11") then {	// No CBA Settings
		[] call GW_ACE_Settings_fnc_setConfigs;
	};
};

LOG("Settings Cleared and Saved");
