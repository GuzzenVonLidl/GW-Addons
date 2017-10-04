/*
	AUTHOR: GuzzenVonLidl

	Usage:
	[] call GW_3DEN_fnc_uiCallFunction

	Parameters: None

	Return Value: No

	Public: NO
*/
#include "script_component.hpp"

params [["_params", (uiNamespace getVariable [QGVAR(FunctionParams), ""])],["_function", (uiNamespace getVariable [QGVAR(FunctionName), ""])]];

if !(_function isEqualTo "") exitWith {
	_compile = (compile (format ["%1", (toString(toArray(format ["%1 call %2", _params, _function])))]));

	[] call _compile;
	true
};
false
