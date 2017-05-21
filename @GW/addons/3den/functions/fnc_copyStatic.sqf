/*
	[] call GW_3DEN_fnc_Copy
*/
#include "script_component.hpp"
#define	GETATTRIBUTE(Var) ((_x get3DENAttribute Var) select 0)
//#define	CUT_X(Var1) [Var1, 2] call BIS_fnc_cutDecimals
#define	CUT_X(Var1) parseNumber(Var1 toFixed 2)
#define	CUT_XYZ(Var1,Var2,Var3) [CUT_X(Var1),CUT_X(Var2),CUT_X(Var3)]

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
		case 1: { // Units && Vehicles
			if (_x isKindOf "AllVehicles") then {
				if !(GETATTRIBUTE("init") isEqualTo "") then {
					_special pushBack [0, GETATTRIBUTE("init")];
				};
				if !(GETATTRIBUTE("allowDamage")) then {
					_special pushBack [1, GETATTRIBUTE("allowDamage")];
				};
				if !(GETATTRIBUTE("enableSimulation")) then {
					_special pushBack [2, GETATTRIBUTE("enableSimulation")];
				};
				if !(GETATTRIBUTE("lock") isEqualTo 1) then {
					_special pushBack [3, GETATTRIBUTE("lock")];
				};
				if (GETATTRIBUTE("addToDynSimGrid")) then {
					_special pushBack [4, GETATTRIBUTE("addToDynSimGrid")];
				};
				if (GETATTRIBUTE("dynamicSimulation")) then {
					_special pushBack [5, GETATTRIBUTE("dynamicSimulation")];
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
					if ((isNull (objectParent _x)) || !((objectParent _x) in (get3DENSelected "object"))) then {
						_units pushBack [GETATTRIBUTE("position"), round(GETATTRIBUTE("rotation") select 2), _stance, _special];
					};
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

					_vehicles pushBack [GETATTRIBUTE("itemClass"), GETATTRIBUTE("position"), round(GETATTRIBUTE("rotation") select 2), _crewList, _special];
				};
			};
		};

		case 2: { // Objects
			if ((_x isKindOf "All") && !(_x isKindOf "CAManBase")) then {
				if !(GETATTRIBUTE("init") isEqualTo "") then {
					_special pushBack [0, GETATTRIBUTE("init")];
				};
				if !(GETATTRIBUTE("allowDamage")) then {
					_special pushBack [1, GETATTRIBUTE("allowDamage")];
				};
				if !(GETATTRIBUTE("enableSimulation")) then {
					_special pushBack [2, GETATTRIBUTE("enableSimulation")];
				};
				if !(GETATTRIBUTE("lock") isEqualTo 1) then {
					_special pushBack [3, GETATTRIBUTE("lock")];
				};
				if (GETATTRIBUTE("addToDynSimGrid")) then {
					_special pushBack [4, GETATTRIBUTE("addToDynSimGrid")];
				};
				if (GETATTRIBUTE("dynamicSimulation")) then {
					_special pushBack [5, GETATTRIBUTE("dynamicSimulation")];
				};
				(vectorDir _x) params ["_dirX","_dirY","_dirZ"];
				(vectorUp _x) params ["_upX","_upY","_upZ"];

				_objects pushBack [GETATTRIBUTE("itemClass"), GETATTRIBUTE("position"), [CUT_XYZ(_dirX,_dirY,_dirZ), CUT_XYZ(_upX,_upY,_upZ)], _special, GETATTRIBUTE("objectIsSimple")];
			};
		};
	};
} forEach (get3DENSelected "object");

switch (_type) do {
	case 1: {
		_return = (str([_units, _vehicles]) + (" call GW_Common_fnc_spawnGroup;"));
		TRACE_1("Units", _units);
		TRACE_1("Vehicles", _vehicles);
		systemChat format ["%1 units, %2 vehicles copied - Static", (count _units), (count _vehicles)];
	};
	case 2: {
		_return = (str(_objects) + (" call GW_Common_fnc_spawnObjects;"));
		TRACE_1("Objects", _objects);
		systemChat format ["%1 objects copied - Objects", (count _objects)];
	};
};

if !(_return isEqualTo 0) then {
	copyToClipboard _return;
};

if ("Preferences" get3DENMissionAttribute "GW_DeleteOnCopy") then {
	_delete = (get3DENSelected "object") + (get3DENSelected "group");
	delete3DENEntities _delete;
};
