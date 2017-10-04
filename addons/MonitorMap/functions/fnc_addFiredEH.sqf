#include "script_component.hpp"

params ["_obj"];
if (isNil {_obj getVariable QGVAR(firedEH)}) then {
	_obj setVariable [QGVAR(firedEH),
		(_obj addEventHandler ["Fired", {_this call FUNC(firedEH);}])
	];
};
