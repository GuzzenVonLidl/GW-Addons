#include "script_component.hpp"

params [["_detailLevel", 1, [0]], ["_interval", 1, [0]]];
private _markers = [];

while {GVAR(Enabled)} do {
	private ["_doneObjs", "_sigTerm"];
	_doneObjs = [];
	waitUntil {
		_sigTerm = GVAR(sigTerm);
		visibleMap || {shownGPS} || {GVAR(constantUpdate)} || {_sigTerm};
	};

	{ // forEach
		private ["_obj", "_marker", "_alive", "_side", "_isPlayer"];
		_obj = _x select 0;
		_marker = _x select 1;
		_alive = _x select 2;
		_side = _x select 3;
		_isPlayer = _x select 4;
		if ( // Object has changed state or script is ending
			_sigTerm || // Script ending
			{isNull _obj} || // Object deleted
			{(side _obj) != _side} || // Changed sides
			{(vehicle _obj) != _obj} || // Switched vehicles
			{!([(alive _obj), _alive] call FUNC(compareBool))} || // Died or was revived
			{!([(isPlayer _obj), _isPlayer] call FUNC(compareBool))} // Changed playable status
		) then { // Delete marker
			deleteMarkerLocal _marker;
			_markers set [_forEachIndex, objNull];
		} else { // Keep marker
			_doneObjs set [(count _doneObjs), _obj];
			private ["_objPos", "_mrkPos"];
			_objPos = getPos _obj;
			_mrkPos = getMarkerPos _marker;
			if ( // Object has moved
				((getDir _obj) != (markerDir _marker)) ||
				{((_objPos select 0) != (_mrkPos select 0)) || {(_objPos select 1) != (_mrkPos select 1)}}
			) then { // Update marker position if needed
				_marker setMarkerPosLocal _objPos;
				_marker setMarkerDirLocal (getDir _obj);
			};
		};
	} forEach _markers;

	_markers = _markers - [objNull];
	/* Exit if received termination signal */
	if (_sigTerm) exitWith {
		GVAR(sigTerm) = false;
	};
	if (visibleMap || GVAR(constantUpdate)) then { // Repaint map markers

	/* Paint unit map markers */
	{ // forEach
		if (alive _x) then {
			[_x] call FUNC(addFiredEH);
			private ["_playerStat"];
			_playerStat = _x getVariable QGVAR(playerStat);
			if ((isNil "_playerStat") || {!([(isPlayer _x), (_playerStat select 1)] call FUNC(compareBool))}) then {
				_x setVariable [QGVAR(playerStat), [(name _x), (isPlayer _x)], true];
			};
			if (!(_x in _doneObjs) && {(vehicle _x) == _x}) then {
				private ["_color", "_type", "_marker"];
				_color = [side _x] call FUNC(getSideColor);
				_type = if (isPlayer _x) then {"mil_arrow2"} else {"mil_arrow"};
				_marker = [_markers, _x, _type, _color, [0.4, 0.4], MARKER_ALPHA] call FUNC(paintObjMarker);
				if (_detailLevel >= 1) then {
					if ((isPlayer _x) || {_detailLevel >= 3}) then {
						_marker setMarkerTextLocal (name _x);
					};
				};
			};
		};
	} forEach allUnits;

	/* Paint dead map markers */
	{ // forEach
		if (!(_x in _doneObjs)) then {
			private ["_marker", "_playerStat"];
			_marker = [_markers, _x, "mil_arrow", "ColorBlack", [0.4, 0.4], MARKER_ALPHA] call FUNC(paintObjMarker);
			_playerStat = _x getVariable QGVAR(playerStat);
			if ((_detailLevel >= 1) && {!isNil "_playerStat"}) then {
				if ((_playerStat select 1) || {_detailLevel >= 3}) then {
					_marker setMarkerTextLocal (_playerStat select 0);
				};
			};
		};
	} forEach allDead;

	/* Paint vehicle map markers */
	{ // forEach
		if (_x isKindOf "AllVehicles") then { // Protect against fake vehicles
			if (alive _x) then {
				if !(_x getVariable [QGVAR(firedEH), false]) then {
					_x setVariable [QGVAR(firedEH),true];
					_x addEventHandler ["Fired", {_this call FUNC(firedEH);}];
				};
			//	[_x] call FUNC(addFiredEH);
			};
			if (!(_x in _doneObjs)) then {
				private ["_type", "_color", "_marker"];
				_type = switch (true) do {
					case (_x isKindOf "StaticWeapon"): {"b_inf"}; // Static Weapon
					case (_x isKindOf "Car"): {"b_motor_inf"}; // Motorized
					case (_x isKindOf "Tank"): {"b_armor"}; // Armor
					case (_x isKindOf "Helicopter"): {"b_air"}; // Helicopter
					case (_x isKindOf "Plane"): {"b_plane"}; // Airplane
					default {"b_unknown"}; // Anything else
				};
				if (alive _x) then {
					_color = [side _x] call FUNC(getSideColor);
				} else {
					_color ="ColorBlack";
				};
				_marker = [_markers, _x, _type, _color, [0.8, 0.8], MARKER_ALPHA] call FUNC(paintObjMarker);
				if (_detailLevel >= 1) then {
					if (((count (crew _x)) > 0) && {isPlayer((crew _x) select 0)}) then {
					_marker setMarkerTextLocal (name ((crew _x) select 0));
					} else {
						if (_detailLevel >= 2) then {
							_marker setMarkerTextLocal ('"' + (typeOf(_x)) + '"');
						};
					};
				};
			};
		};
	} forEach vehicles;
	};
	uiSleep _interval;
};

hint "Map Monitor Ended.";
GVAR(Enabled) = false;
