//	REFRENCE: \x\gw\addons\menu\functions\fnc_mapMonitor_handler
#include "script_component.hpp"

params ["_obj"];
if (isNil {_obj getVariable QGVAR(mapMonitor_firedEH)}) then {
	_obj setVariable [QGVAR(mapMonitor_firedEH),
		(_obj addEventHandler ["Fired", {_this call FUNC(mapMonitor_firedEH);}])
	];
};
