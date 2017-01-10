/*
	Author: Revo

	Description:
	Garrison one or multiple buildings in the area. Radius of the area and coverage can be defined in the preferences menu.

	Parameter(s):
	-
	Returns:
	true
*/
#include "script_component.hpp"

private _getPos = (uiNamespace getVariable "bis_fnc_3DENEntityMenu_data") select 0;
private _radius = "Preferences" get3DENMissionAttribute "GW_WaypointRadius";
private _waypointCount = "Preferences" get3DENMissionAttribute "GW_WaypointCount";

_leader = leader ((get3DENSelected "object") select 0);
for "_i" from 1 to _waypointCount do {
	private "_waypoint";
	private _pos = (_leader getRelPos [_radius, (360/_waypointCount) * _i]);
	if !(_waypointCount isEqualTo _i) then {
		_waypoint = (group _leader) create3DENEntity ["Waypoint","MOVE", _pos];
		_waypoint set3DENAttribute ["timeout", [0,3,6]];
		if (_i isEqualTo 1) then {
			_waypoint set3DENAttribute ["formation", 5];	// File
			_waypoint set3DENAttribute ["speedMode", 1];	// Slow
			_waypoint set3DENAttribute ["behaviour", "SAFE"];

		};
	} else {
		_waypoint = (group _leader) create3DENEntity ["Waypoint","CYCLE", _pos];
	};
};

true
