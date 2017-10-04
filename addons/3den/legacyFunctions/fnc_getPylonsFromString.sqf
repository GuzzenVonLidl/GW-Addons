/*
	AUTHOR: GuzzenVonLidl
	Converts BI's format for pylons from editor and puts it in a string
	// faster alternetive is BIS_fnc_splitString

	Usage:
	[] call GW_3DEN_Fnc_getPylonsFromString;

	Parameters:
	#0	OBJECT:	Vehicle
	#1	STRING:	Pylons

	Return Value: <ARRAY>
	Pylons in in correct index

	Public: NO

*/
#include "script_component.hpp"

params [
	["_vehicleClass", objNull],
	["_string", ""]
];

private _array = [];
private _lastIndex = 0;
private _counter = 0;
private _condition = (call EFUNC(Common,getPylonsAvailable));

while {(_counter < (count _condition)) && !(_vehicleClass isEqualTo objNull)} do {
	_getString = (_string select [_lastIndex]);
	_getIndex = _getString find ";";
	_getString = (_string select [_lastIndex, _getIndex]);
	_array pushBack _getString;
	_lastIndex = (_lastIndex + _getIndex + 1);
	_counter = _counter + 1;
};
_array
