/*
	AUTHOR: GuzzenVonLidl
	Hides island objects and does not affect editor/zeus objects
	NOTE: Hidden objects do not take damage

	Usage:
	["marker_0"] call Test_fnc_getRandPos;
	["marker_0", ["WATER", "ROAD", ["BLACKLIST",[]]]] call Test_fnc_getRandPos;

	Parameters:
	#0	OBJECT || STRING || ARRAY:	Center position
	#2	ARRAY: Specific elements to overwrite
		#0 STRING: Element to change
		#1 VALUE: Value to bypass

	Return Value: <GROUP>
	Group that spawned

	Public: NO

	"LAND"	- Only Land positions are allowed (Default)
	"WATER"	- Only water positions are allowed
	"ANY"	-  Position does not matter, can be both land or sea
	"ROAD"	-  Find random position, including roads

*/
#include "script_Component.hpp"

#define	FINDPARAM(Var1)	([Var1, _extra] call FUNC(findParamArray))
#define	GETPARAM(Var1)	([Var1, _extra] call FUNC(getParamArray))
#define	GETPARAM0(Var1)	(GETPARAM(Var1) select 0)
#define	GETPARAM1(Var1)	(GETPARAM(Var1) select 1)
#define	GETPARAM2(Var1)	(GETPARAM(Var1) select 2)

params ["_centerPos",["_extra", []]];

private _pos = [];
private _exit = false;
private _isMarker = true;

private _blackList = [];
private _distance = 200;
private _emptyPos = [];
private _roadEnabled = false;
private _water = 0;

if (FINDPARAM("BLACKLIST")) then {_blackList = GETPARAM1("BLACKLIST");};
if (FINDPARAM("DISTANCE")) then {_distance = GETPARAM1("DISTANCE");};
if (FINDPARAM("CLASS")) then {_emptyPos = GETPARAM1("CLASS");};
if (FINDPARAM("ROAD")) then {_roadEnabled = true;};
if (FINDPARAM("LAND")) then {_water = 0;};
if (FINDPARAM("ANY")) then {_water = 1;};
if (FINDPARAM("WATER")) then {_water = 2;};

if !(_centerPos isEqualType "") then {
	_isMarker = false;
	_pos = (_centerPos call CBA_fnc_getRandPos);
};

for "_i" from 1 to 50 step 1 do {
	if (_exit) exitWith {false};

	if (_isMarker) then {
		_pos = _centerPos call FUNC(getRandPosMarker);
	} else {
		_pos = (_centerPos getPos [(random _distance), (random 360)]);
	};


	if (_roadEnabled) then {
		private _range = 200;
		private _getRoads = (_pos nearroads _range);
		private _countRoads = (count _getRoads);

		if (!(_countRoads isEqualTo 0)) then {	// Road position(s) found
			_getRoads = _getRoads apply {[(_x distance _pos), _x]};	// return closest road
			_getRoads sort true;

			_pos = (getpos ((_getRoads select 0) select 1));
		};
	};

	private _tryNewPos = [];
	private _vehType = "";
	private _searchDistance = 200;

	if (_emptyPos isEqualType "") then {
		_vehType = _emptyPos;
	};
	if (_emptyPos isEqualType []) then {
		_emptyPos params ["_searchDistance","_vehType"];
	};

	_tryNewPos = (_pos findEmptyPosition [0,_searchDistance,_vehType]);

	if !(_tryNewPos isEqualTo []) then {
		_pos = _tryNewPos;	// If suitable empty position found
	};

	_isWaterPos = (surfaceIsWater _pos);
	if ((_water isEqualTo 0) && !_isWaterPos) then {	// Find land position
		_exit = true;
	};
	if (_water isEqualTo 1) then {						// Find land or water position
		_exit = true;
	};
	if ((_water isEqualTo 2) && _isWaterPos) then {		// Find water position
		_exit = true;
	};

	if (!(_blackList isEqualTo []) && _exit) then {
		{
			if ([_pos,_x] call FUNC(isBlacklisted)) exitwith {	// If blacklisted, jump out of blacklist check and continue main loop.
				_exit = false;
			};
		} foreach _blackList;
	};
};

if (_exit) then {
	_pos
} else {
	[0,0,0]
};
