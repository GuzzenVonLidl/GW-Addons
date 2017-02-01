#include "script_component.hpp"

private _updated = [];

if (isNull (objectParent player)) then {
	{
		if ((vehicle _x) isEqualTo _x) then {
			if ((player distance _x) < (getObjectViewDistance select 0)) then {
				if (_x getVariable [QGVAR(UnitCaching_isHidden), false]) then {
					_x setVariable [QGVAR(UnitCaching_isHidden), false];
					_x enableSimulation true;
					[QGVAR(UnitCaching_toggleObject), [_x, false]] call CBA_fnc_LocalEvent;
				};
			} else {
				if !(_x getVariable [QGVAR(UnitCaching_isHidden), false]) then {
					_x setVariable [QGVAR(UnitCaching_isHidden), true];
					_x enableSimulation false;
					[QGVAR(UnitCaching_toggleObject), [_x, true]] call CBA_fnc_LocalEvent;
				};

				if (time > (_x getVariable [QGVAR(UnitCaching_nextUpdate), 0])) then {
					_x setVariable [QGVAR(UnitCaching_nextUpdate), (time + (20 + floor(random 10)))];
					_x enableSimulation true;
					[{
						_this enableSimulation false;
					}, _x, 1] call CBA_fnc_waitAndExecute;
				};
			};
		};
	} forEach GVAR(UnitCaching_Objects);
} else {
	{
		[QGVAR(UnitCaching_toggleObject), [_x, false]] call CBA_fnc_LocalEvent;
	} forEach GVAR(UnitCaching_currentDisabled);
};

//	systemChat format ["%1, %2, %3, %4", time, {simulationEnabled _x} count allUnits, {!simulationEnabled _x} count allUnits, (count _updated)];
