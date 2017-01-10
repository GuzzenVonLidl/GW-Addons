#include "script_component.hpp"

[{
	if (CBA_isHeadlessClient) then {
		[QGVAR(addHC), player] call CBA_fnc_serverEvent;
	};
}, [], 1] call CBA_fnc_waitAndExecute;
