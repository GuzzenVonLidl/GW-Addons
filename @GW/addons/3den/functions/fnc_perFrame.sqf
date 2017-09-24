/*
	AUTHOR: GuzzenVonLidl

	Usage:
	[1, true] call GW_3den_fnc_spawnModule;

	Parameters:
	#0	NUMBER:	Case in Switch

	Return Value: <GROUP>
	Group that spawned

	Public: NO

	{
		[] spawn FUNC(perFrame);
	} forEach ((all3DENEntities select 2) select {((_x get3DENAttribute "text") select 0) isEqualTo "HideTrigger"});

*/
#include "script_component.hpp"

params [
	"_trigger"
];

private _hiddenArray = [];
private _filter = ["BUILDING","BUNKER","BUSH","BUSSTOP","CHAPEL","CHURCH","CROSS","FENCE","FOREST BORDER","FOREST SQUARE","FOREST TRIANGLE","FOREST","FORTRESS","FOUNTAIN","FUELSTATION","HOSPITAL","HOUSE","LIGHTHOUSE","LINES","POWER""POWERSOLAR","POWERWAVE","POWERWIND","QUAY","RAILWAY","ROCK","ROCKS","RUIN","SHIPWRECK","SMALL TREE","STACK","TOURISM","TRANSMITTER","TREE","VIEW-TOWER","WALL","WATERTOWER","HIDE"];
while {!([_trigger] call FUNC(isNil3DENEntity)) && GVAR(hideObjectPerFrame)} do {
	private _radius = ((_trigger get3DENAttribute "size3") select 0);
	private _objects = (nearestTerrainObjects [_trigger, _filter, (selectMax _radius), false]);
	private _inTrigger = _objects inAreaArray _trigger;

	{
		if !(isObjectHidden _x) then {
			_x hideObjectGlobal true;
		};
		_hiddenArray pushBackUnique _x;
	} forEach _inTrigger;

	{
		_x hideObjectGlobal false;
		_hiddenArray deleteAt (_hiddenArray find _x);
	} forEach (_hiddenArray select {
		(isObjectHidden _x) && !(_x inArea _trigger)
	});
	sleep 0.1;
};

{
	_x hideObjectGlobal false;
	_hiddenArray deleteAt (_hiddenArray find _x);
} forEach (_hiddenArray select {isObjectHidden _x});
