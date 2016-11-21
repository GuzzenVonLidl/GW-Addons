#include "script_component.hpp"

if (hasInterface) then {
	[QGVARMAIN(missionStarted), {
			if !(isNil QGVAR(serverMonitorPFH)) then {
				GVAR(serverMonitorPFH) = [{
					[QGVAR(getInfo), player] call CBA_fnc_GlobalEvent;
/*
					[QGVAR(getInfoHC), [player, GVARMAIN(Gamelogic)], _x] call CBA_fnc_targetEvent;
					{
						if (_x isKindOf "HeadlessClient_F") then {
							[QGVAR(getInfoHC), [player, _x], _x] call CBA_fnc_targetEvent;
						};
					} forEach allPlayers;
*/
					{
						[QGVAR(getInfoHC), [player, _x], _x] call CBA_fnc_targetEvent;
					} forEach ([GVARMAIN(Gamelogic)] + EGVAR(HeadlessController,HeadlessList));
					[{
						[] call FUNC(Display);
					}, _this, 1] call CBA_fnc_waitAndExecute;
				}, 5, []] call CBA_fnc_addPerFrameHandler;
			} else {
				[GVAR(serverMonitorPFH)] call CBA_fnc_removePerFrameHandler;
		//		[GW_ServerMonitor_serverMonitorPFH] call CBA_fnc_removePerFrameHandler;
			};
	}] call CBA_fnc_addEventHandler;
};

if (CBA_isHeadlessClient) then {
	[QGVAR(addHC), player] call CBA_fnc_serverEvent;
};
