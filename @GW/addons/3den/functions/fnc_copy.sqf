/*

	[] call GW_3DEN_fnc_Copy

*/
#include "script_component.hpp"
#define	GETATTRIBUTE(Var) ((_x get3DENAttribute Var) select 0)

params [
	"_type"
];
private _units = [];
private _objects = [];
private _return = 0;

{
	switch (_type) do {
		case 1: {	// Units
			if (_x isKindOf "CAManBase") then {
				private _stance = "Auto";
				switch (_x get3DENAttribute "UnitPos") do {
					case 0: {
						_stance = "Up";
					};
					case 1: {
						_stance = "Middle";
					};
					case 2: {
						_stance = "Down";
					};
				};
				_units pushBack [GETATTRIBUTE("position"),round(GETATTRIBUTE("rotation") select 2), _stance];
				_ObjectsClass pushBack (typeOf _x);
			};
		};

		case 2: {	// Objects & Vehicles
			if (!(_x isKindOf "CAManBase") && (_x isKindOf "All")) then {
				_objects pushBack [GETATTRIBUTE("itemClass"),GETATTRIBUTE("position"),round(GETATTRIBUTE("rotation") select 2)];
			};
		};

		case 3: {	// Vehicles
			if (!(_x isKindOf "CAManBase") && (_x isKindOf "AllVehicles")) then {
				_objects pushBack [GETATTRIBUTE("itemClass"),GETATTRIBUTE("position"),round(GETATTRIBUTE("rotation") select 2)];
			};
		};

		default {
		};
	};
} forEach (get3DENSelected "object");

switch (_type) do {
	case 1: {
		_return = format ["%1 call GW_Common_fnc_spawnStatic;", _units];
	};
	case 2: {
		_return = format ["%1 call GW_Common_fnc_spawnObjects;", _objects];
	};
	case 3: {
		_return = format ["%1 call GW_Common_fnc_spawnObjects;", _objects];
	};
};

if !(_return isEqualTo 0) then {
	copyToClipboard _return;
};

TRACE_1("Units", _units);
TRACE_1("Objects", _objects);
