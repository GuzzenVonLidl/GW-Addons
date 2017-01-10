#include "script_component.hpp"

params [
	["_unit", player, [objNull]],
	["_target", objNull, [objNull]]
];

(((_unit getVariable [QGVAR(type), ""]) isEqualTo "") && ((count (crew _target)) isEqualTo 0))
