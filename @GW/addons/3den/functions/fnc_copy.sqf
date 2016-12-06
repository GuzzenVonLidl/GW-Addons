/*
	[] call GW_3DEN_fnc_Copy
*/
#include "script_component.hpp"
#define	GETATTRIBUTE(Var) ((_x get3DENAttribute Var) select 0)

params [
	"_type"
];
private _units = [];
private _vehicles = [];
private _objects = [];
private _return = 0;

{
	private _special = [];
	switch (_type) do {
		case 1: {	// Units
			if (_x isKindOf "AllVehicles") then {
				if !(GETATTRIBUTE("init") isEqualTo "") then {
					_special pushBack ["init", GETATTRIBUTE("init")];
				};
				if !(GETATTRIBUTE("enableSimulation")) then {
					_special pushBack ["simulation", GETATTRIBUTE("enableSimulation")];
				};
				if !(GETATTRIBUTE("allowDamage")) then {
					_special pushBack ["damage", GETATTRIBUTE("allowDamage")];
				};
				if !(GETATTRIBUTE("lock") isEqualTo 1) then {
					_special pushBack ["lock", GETATTRIBUTE("lock")];
				};
				if (GETATTRIBUTE("addToDynSimGrid")) then {
					_special pushBack ["addToDyn", GETATTRIBUTE("addToDynSimGrid")];
				};
				if (GETATTRIBUTE("dynamicSimulation")) then {
					_special pushBack ["dynamic", GETATTRIBUTE("dynamicSimulation")];
				};

				if (_x isKindOf "CAManBase") then {
					private _stance = "Auto";
					switch ((_x get3DENAttribute "UnitPos") select 0) do {
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
					_units pushBack [GETATTRIBUTE("position"), (GETATTRIBUTE("rotation") select 2), _stance, _special];
				} else {
					private _crewList = [];
					private _crew = (fullCrew _x);
					if ((count _crew) isEqualTo 0) then {
						_crew = (fullCrew [_x, "", true]);
					} else {
						{
							if (_x select 4) then {	// Force FFV to cargo instead of turret
								_crewList pushBack ["cargo", (_x select 2), (_x select 3)];
							} else {
								_crewList pushBack [(_x select 1), (_x select 2), (_x select 3)];
							};
						} forEach _crew;
					};

					_vehicles pushBack [GETATTRIBUTE("itemClass"), GETATTRIBUTE("position"), [(vectorDir _x), (vectorUp _x)], _crewList, _special];
				};
			};
		};

		case 2: {	// Objects & Vehicles
			if ((_x isKindOf "All") && !(_x isKindOf "CAManBase")) then {
				if !(GETATTRIBUTE("init") isEqualTo "") then {
					_special pushBack ["init", GETATTRIBUTE("init")];
				};
				if !(GETATTRIBUTE("enableSimulation")) then {
					_special pushBack ["simulation", GETATTRIBUTE("enableSimulation")];
				};
				if !(GETATTRIBUTE("allowDamage")) then {
					_special pushBack ["damage", GETATTRIBUTE("allowDamage")];
				};
				if !(GETATTRIBUTE("lock") isEqualTo 1) then {
					_special pushBack ["lock", GETATTRIBUTE("lock")];
				};
				if (GETATTRIBUTE("dynamicSimulation")) then {
					_special pushBack ["dynamic", GETATTRIBUTE("dynamicSimulation")];
				};

				_objects pushBack [GETATTRIBUTE("itemClass"), GETATTRIBUTE("position"), [(vectorDir _x), (vectorUp _x)], _special, GETATTRIBUTE("objectIsSimple")];
			};
		};

		case 3: {
			["Composition is just pre placed objects. It is easily used but also created, make sure the objects you want to have in it is selected and have the player close because he is used as a ""center"" of all objects","About Composition"] call BIS_fnc_3DENShowMessage;
		};
	};
} forEach (get3DENSelected "object");

switch (_type) do {
	case 1: {
		_return = format ["%1 call GW_Common_fnc_spawnGroup;", [_units, _vehicles]];
		TRACE_1("Units", _units);
		TRACE_1("Vehicles", _vehicles);
		systemChat format ["%1 units, %2 vehicles copied", (count _units), (count _vehicles)];
	};
	case 2: {
		_return = format ["%1 call GW_Common_fnc_spawnObjects;", _objects];
		TRACE_1("Objects", _objects);
		systemChat format ["%1 objects copied", (count _objects)];
	};
};

if !(_return isEqualTo 0) then {
	copyToClipboard _return;
};
