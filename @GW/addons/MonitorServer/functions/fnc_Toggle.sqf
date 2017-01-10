/*
*	Author: GuzzenVonLidl
*	Outputs server info for admins to debug
*
*	Usage:
*	[] call GW_MonitorServer_Fnc_Toggle;
*	Arguments: NO
*
*	Return Value: NO
*
*	Public: NO
*
*/
#include "script_component.hpp"

if (GVAR(doEnabled)) then {
	[QGVAR(addServerRequest), player] call CBA_fnc_serverEvent;
	GVAR(doEnabled) = false;
} else {
	[QGVAR(removeUpdatesfromServer), player] call CBA_fnc_localEvent;
	GVAR(doEnabled) = true;
};
