/*
*	Author: GuzzenVonLidl
*	Outputs server info for admins to debug
*
*	Usage:
*	[] call GW_ServerMonitor_Fnc_Toggle;
*	Arguments: NO
*
*	Return Value: NO
*
*	Public: NO
*
*/
#include "script_component.hpp"

if (isNil QGVAR(serverMonitorPFH)) then {
	GVAR(serverMonitorPFH) = [{
		[QGVAR(getInfo), player] call CBA_fnc_GlobalEvent;
		{
			[QGVAR(getInfoHC), [player, _x], _x] call CBA_fnc_targetEvent;
		} forEach ([GVARMAIN(Gamelogic)] + EGVAR(HeadlessController,HeadlessList));
		[{
			[] call FUNC(Display);
		}, _this, 1] call CBA_fnc_waitAndExecute;
	}, 5, []] call CBA_fnc_addPerFrameHandler;
} else {
	[GVAR(serverMonitorPFH)] call CBA_fnc_removePerFrameHandler;
	[{
		hintSilent "";
	}, [], 5] call CBA_fnc_waitAndExecute;
//	[GW_ServerMonitor_serverMonitorPFH] call CBA_fnc_removePerFrameHandler;
};
