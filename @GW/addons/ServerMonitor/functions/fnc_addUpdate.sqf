/*
*	Author: GuzzenVonLidl
*	Outputs server info for admins to debug
*
*	Usage:
*	[] call GW_ServerMonitor_Fnc_addUpdate;
*	Arguments: NO
*
*	Return Value: NO
*
*	Public: NO
*
*/
#include "script_component.hpp"

GVAR(serverMonitorPFH) = [{
	// Reset variables
	GVAR(infoFPS) = [];
	GVAR(infoHC) = [];

	[QGVAR(getInfo), []] call CBA_fnc_GlobalEvent;
	[QGVAR(getInfoHC), GVARMAIN(Gamelogic)] call CBA_fnc_localEvent;
	{
		[QGVAR(getInfoHC), _x] call CBA_fnc_serverEvent;
	} forEach GVAR(HeadlessList);

	[{
		private _server = 0;
		private _listHC = [];
		private _listPlayers = [];
		{
			switch (_x select 0) do {
				case 1: {
					_server = (_x select 1);
				};
				case 2: {
					_listHC pushBack (_x select 1);
				};
				default {
					_listPlayers pushBack (_x select 1);
				};
			};
		} forEach GVAR(infoFPS);
		private _fps = [_server, (_listHC call EFUNC(Common,findAverage)), round(_listPlayers call EFUNC(Common,findAverage))];

		{
			[QGVAR(reciveServerInfo), [_fps, GVAR(infoHC)], _x] call CBA_fnc_targetEvent;
		} forEach GVAR(adminUpdateList);
	}, _this, 1] call CBA_fnc_waitAndExecute;
}, 5, []] call CBA_fnc_addPerFrameHandler;
