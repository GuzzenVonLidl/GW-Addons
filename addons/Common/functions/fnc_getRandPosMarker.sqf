#include "script_Component.hpp"

params ["_marker"];
private _pos = (markerPos _marker);

//if ((markerShape _marker) isEqualTo "ICON") exitWith {_pos};
if ((markerShape _marker) isEqualTo "ICON") exitWith {[0,0,0]};

(markerSize _marker) params ["_a","_b"];

private _posVector = [0,0,0];

if ((markerShape _marker) isEqualTo "RECTANGLE") then {
	_posVector = [random(_a*2) - _a, random(_b*2) - _b, 0];
} else {
	private _radius = (random 1);
	private _dir = (random 360);

	_posVector = [(sqrt(_radius) * cos(_dir) * _a), (sqrt(_radius) * sin(_dir) * _b), 0];
};

_posVector = [_posVector, -(markerDir _marker)] call BIS_fnc_rotateVector2D;

_pos vectorAdd _posVector
