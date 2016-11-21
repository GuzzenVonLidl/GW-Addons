/*

	[] call GW_3DEN_fnc_Copy


*/
#include "script_component.hpp"
#define	GETATTRIBUTE(Var) ((_x get3DENAttribute Var) select 0)

if ((["GW_Modules", "Common", "version"] call BIS_fnc_getCfgData) < 1.1) then {
	_this call FUNC(copyOld);
} else {

	params [
		"_type"
	];
	private _units = [];
	private _vehicles = [];
	private _objects = [];
	private _return = 0;

	{
		switch (_type) do {
			case 1: {	// Units
				private _stance = "Auto";

				if (_x isKindOf "CAManBase") then {
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
					_units pushBack [GETATTRIBUTE("position"), [(vectorDir _x), (vectorUp _x)], _stance];
				} else {
					if (_x isKindOf "AllVehicles") then {
						private _crewList = [];
						_crew = (fullCrew _x);
						if (count _crew > 0) then {
							{
								if (_x select 4) then {	// Force FFV to cargo instead of turret
									_crewList pushBack ["cargo", (_x select 2), (_x select 3)];
								} else {
									_crewList pushBack [(_x select 1), (_x select 2), (_x select 3)];
								};
							} forEach _crew;
							_vehicles pushBack [GETATTRIBUTE("itemClass"), GETATTRIBUTE("position"), [(vectorDir _x), (vectorUp _x)], _crewList];
						};
					};
				};
			};

			case 2: {	// Objects & Vehicles
				if (!(_x isKindOf "CAManBase") && (_x isKindOf "All")) then {
					private _special = [];
					private _simpleObject = nil;

					if !(GETATTRIBUTE("enableSimulation")) then {
						_special pushBack ["simulation", GETATTRIBUTE("enableSimulation")];
					};
					if !(GETATTRIBUTE("allowDamage")) then {
						_special pushBack ["damage", GETATTRIBUTE("allowDamage")];
					};
					if !(GETATTRIBUTE("lock") isEqualTo 1) then {
						_special pushBack ["lock", GETATTRIBUTE("lock")];
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
};
