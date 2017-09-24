/*
	AUTHOR: GuzzenVonLidl
	Gets Location in the area and then moves selected units to the valid house positions

	Usage:
	[] call GW_3DEN_fnc_garrisonNearest

	Parameters: None

	Return Value: None

	Public: NO
*/
#include "script_component.hpp"
#define	GETATTRIBUTE(Var) ((_object get3DENAttribute Var) select 0)

params ["_object"];
private _array = [];

if !(GETATTRIBUTE("init") isEqualTo "") then {
	_array pushBack [0, GETATTRIBUTE("init")];
};
if !(GETATTRIBUTE("allowDamage")) then {
	_array pushBack [1, GETATTRIBUTE("allowDamage")];
};
if !(GETATTRIBUTE("enableSimulation")) then {
	_array pushBack [2, GETATTRIBUTE("enableSimulation")];
};
if !(GETATTRIBUTE("lock") isEqualTo 1) then {
	_array pushBack [3, GETATTRIBUTE("lock")];
};
if (GETATTRIBUTE("addToDynSimGrid")) then {
	_array pushBack [4, GETATTRIBUTE("addToDynSimGrid")];
};
if (GETATTRIBUTE("dynamicSimulation")) then {
	_array pushBack [5, GETATTRIBUTE("dynamicSimulation")];
};
if (GETATTRIBUTE("dynamicSimulation")) then {
	_array pushBack [5, GETATTRIBUTE("dynamicSimulation")];
};
if (GETATTRIBUTE("dynamicSimulation")) then {
	_array pushBack [5, GETATTRIBUTE("dynamicSimulation")];
};
if (GETATTRIBUTE("dynamicSimulation")) then {
	_array pushBack [5, GETATTRIBUTE("dynamicSimulation")];
};

if !(_object isKindOf "CAManBase") then {	// Vehicles only
	([_object] call bis_fnc_getVehicleCustomization) params ["_texture","_animations"];
	if !(GETATTRIBUTE("ObjectTexture") isEqualTo "") then {
		_array pushBack [6, _texture];
	};
	if !(GETATTRIBUTE("VehicleCustomization") isEqualTo "") then {
		_array pushBack [7, _animations];
	};
	if !(GETATTRIBUTE("pylons") isEqualTo "") then {
		_loadout = ([GETATTRIBUTE("pylons"), ";"] call BIS_fnc_splitString);
		_array pushBack [8, _loadout];
	};
	if ((count (listVehicleSensors _object)) isEqualTo 0) then {
		if !(GETATTRIBUTE("reportRemoteTargets") isEqualTo 0) then {
			_array pushBack [9, GETATTRIBUTE("reportRemoteTargets")];
		};
		if !(GETATTRIBUTE("receiveRemoteTargets") isEqualTo 0) then {
			_array pushBack [10, GETATTRIBUTE("receiveRemoteTargets")];
		};
		if !(GETATTRIBUTE("reportOwnPosition") isEqualTo 0) then {
			_array pushBack [11, GETATTRIBUTE("reportOwnPosition")];
		};
		if !(GETATTRIBUTE("RadarUsageAI") isEqualTo 0) then {
			_array pushBack [12, GETATTRIBUTE("RadarUsageAI")];
		};
	};
};

_array
