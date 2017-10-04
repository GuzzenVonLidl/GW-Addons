/*
	AUTHOR: GuzzenVonLidl

	Usage:
	[] call GW_3DEN_fnc_uiSaveFunction

	Parameters: None

	Return Value: No

	Public: NO
*/
#include "script_component.hpp"

params [["_params", (uiNamespace getVariable [QGVAR(FunctionParams), ""])],["_function", (uiNamespace getVariable [QGVAR(FunctionName), ""])]];

if !(_function isEqualTo "") exitWith {
	(uiNamespace setVariable [QGVAR(FunctionParams), _params]);
	(uiNamespace setVariable [QGVAR(FunctionName), _function]);
	true
};
false
