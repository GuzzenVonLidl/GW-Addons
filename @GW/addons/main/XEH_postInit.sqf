#include "script_component.hpp"

[{
	if ((getPlayerUID player) in GVARMAIN(adminList)) then {
		GVARMAIN(isAdmin) = true;
		if (GVARMAIN(isActiveAdmin)) then {
			[QGVARMAIN(AddAdmin), player] call CBA_fnc_serverEvent;
		} else {
			[QGVARMAIN(RemoveAdmin), player] call CBA_fnc_serverEvent;
		};
	};
}, [], 1] call CBA_fnc_waitAndExecute;
