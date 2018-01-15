/*
	Author: GuzzenVonLidl
	Shows a hint with custom text and then disapears after specified time

	Usage:
	["Hello", 3] call GW_Common_Fnc_Hint;

	Arguments:
	0: Text <STRING>
	1: Delay <NUMBER>

	Return Value: BOOL

	Public: NO
*/
#include "script_Component.hpp"

params ["_string","_delay"];

hintSilent _string;

[{
	hintSilent "";
}, [], _delay] call CBA_fnc_waitAndExecute;

true
