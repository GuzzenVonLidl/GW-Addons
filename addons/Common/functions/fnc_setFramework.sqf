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

["client"] call CBA_settings_fnc_clear;
["server"] call CBA_settings_fnc_clear;
["mission"] call CBA_settings_fnc_clear;

{
	TRACE_1("CBA Settings", _x);
	[_x, (_x call CBA_settings_fnc_get), true, "mission"] call CBA_settings_fnc_set;
} forEach GVARMAIN(settings3denArray);

LOG("Settings Cleared and Saved");
