/*
	Author: GuzzenVonLidl
	retrieves ACE configs from description and configures CBA addon settings to have correct defaults

	Usage:
	[] call GW_ACE_Settings_fnc_setConfigs;

	Arguments: NO

	Return Value: <BOOL>

	Public: No
*/
#include "script_Component.hpp"

_allConfigs = call FUNC(getConfigs);

{
	_x params ["_var","_value","","_priority"];
	[_var, _value, _priority, "mission"] call CBA_settings_fnc_set;
} forEach _allConfigs;

true
