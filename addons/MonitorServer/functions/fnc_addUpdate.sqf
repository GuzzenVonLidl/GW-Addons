/*
*	Author: GuzzenVonLidl
*	Outputs server info for admins to debug
*
*	Usage:
*	[] call GW_MonitorServer_Fnc_addUpdate;
*	Arguments: NO
*
*	Return Value: NO
*
*	Public: NO
*
*/
#include "script_component.hpp"

// Reset variables
GVAR(infoFPS) = [];
GVAR(infoHC) = [["Server",({local _x} count allUnits),({local _x} count allGroups),(round diag_fps)]];

[QGVAR(getInfo), []] call CBA_fnc_GlobalEvent;

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
	private _fpsList = [_server, (_listHC call EFUNC(Common,findAverage)), round(_listPlayers call EFUNC(Common,findAverage))];

	{
		[QGVAR(reciveServerInfo), [_fpsList, GVAR(infoHC)], _x] call CBA_fnc_targetEvent;
	} forEach GVAR(adminUpdateList);
}, _this, 1] call CBA_fnc_waitAndExecute;
