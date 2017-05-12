/*
	AUTHOR: GuzzenVonLidl
	Hides island objects and does not affect editor/zeus objects
	NOTE: Hidden objects do not take damage

	Usage:
	[[0,0,0], 25, true] call GW_3DEN_fnc_setObjectHidden

	Parameters:
	#0	OBJECT || STRING || ARRAY:	Center Location of buildings/positions
	#1	NUMBER:	Radius of area	(Optional: Default: 50)
	#2	BOOL:	Hides or Shows objects

	Return Value: <GROUP>
	Group that spawned

	Public: NO

	Excluded from filter:
	"MAIN ROAD",
	"ROAD",
	"TRACK",
	"TRAIL",
*/
#include "script_component.hpp"

params [
	"_location",
	"_radius",
	"_toggle"
];

private _filter = ["BUILDING","BUNKER","BUSH","BUSSTOP","CHAPEL","CHURCH","CROSS","FENCE","FOREST BORDER","FOREST SQUARE","FOREST TRIANGLE","FOREST","FORTRESS","FOUNTAIN","FUELSTATION","HOSPITAL","HOUSE","LIGHTHOUSE","LINES","POWER""POWERSOLAR","POWERWAVE","POWERWIND","QUAY","RAILWAY","ROCK","ROCKS","RUIN","SHIPWRECK","SMALL TREE","STACK","TOURISM","TRANSMITTER","TREE","VIEW-TOWER","WALL","WATERTOWER","HIDE"];
private _objects = (nearestTerrainObjects [_location, _filter, _radius, false]);

{
	if ((getObjectType _x) isEqualTo 1) then {
		_x hideObjectGlobal _toggle;
	};
} forEach _objects;

_objects
