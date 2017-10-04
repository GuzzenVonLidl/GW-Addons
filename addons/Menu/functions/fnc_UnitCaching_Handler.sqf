#include "script_component.hpp"

private _updated = [];
_onFoot = (GVAR(UnitCaching_Objects) select {((isNull (objectParent _x)))});

{
	if ((player distance _x) < (getObjectViewDistance select 0)) then { // Show _x
		if (_x getVariable [QGVAR(UnitCaching_isHidden), false]) then {
			_x setVariable [QGVAR(UnitCaching_isHidden), false];
			_x enableSimulation true;
			GVAR(UnitCaching_currentDisabled) deleteAt (GVAR(UnitCaching_currentDisabled) find _object);
		};
	} else {	// Hide _x
		if !(_x getVariable [QGVAR(UnitCaching_isHidden), false]) then {
			_x setVariable [QGVAR(UnitCaching_isHidden), true];
			_x enableSimulation false;
			GVAR(UnitCaching_currentDisabled) pushBack _object;
		};

		if (time > (_x getVariable [QGVAR(UnitCaching_nextUpdate), 0])) then {	// Late update
			_x setVariable [QGVAR(UnitCaching_nextUpdate), (time + (20 + floor(random 10)))];
			[QGVAR(UnitCaching_requestUpdate), _x] call CBA_fnc_localEvent;
		};
	};
} forEach (GVAR(UnitCaching_Objects) - _onFoot);

{
	if (_x getVariable [QGVAR(UnitCaching_isHidden), false]) then {
		_x setVariable [QGVAR(UnitCaching_isHidden), false];
		_x enableSimulation true;
		GVAR(UnitCaching_currentDisabled) deleteAt (GVAR(UnitCaching_currentDisabled) find _object);
	};
} forEach _onFoot;

//	(allUnits + allDeadMen) select {isPlayer _x && {!(_x isKindOf "HeadlessClient_F")}}
//	systemChat format ["%1, %2, %3, %4", time, {simulationEnabled _x} count allUnits, {!simulationEnabled _x} count allUnits, (count _updated)];

/*
			// Late update
			_x enableSimulation true;
			[{
				_this enableSimulation false;
			}, _x, 1] call CBA_fnc_waitAndExecute;
*/
