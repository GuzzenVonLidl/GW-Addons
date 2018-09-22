/*
	Function: FUNC(handler)
	Author(s): Naught
	Version: 1.5
	Website: unitedoperations.net

	Description:
		Tracks units, vehicles, bodies, and bullets
		in real-time on the in-game map screen.

	Notes:
		1. Call the function once to turn the monitor on. Call it
		   again to turn it off.
		2. Valid marker detail options are:
			- 0: Low; only markers.
			- 1: Normal; markers and player names.
			- 2: High; markers, player names, and vehicle names and types.
			- 3: Very High; markers, player and AI names, and vehicle names and types.

	Parameters:
		0: Marker Detail Level [integer] (optional).
		   Default: 1.
		1: Marker Update Interval in Seconds [integer] (optional).
		   Default: 1 (second).

	Syntax:
		[2] spawn GW_MonitorMap_fnc_handler;

	Example(s):
		[] spawn FUNC(handler); // Default configuration
		[0] spawn FUNC(handler); // Low detail and normal updates
		[3, 1] spawn FUNC(handler); // Very high detail and updates of 1 second

	Editable Variable(s): (You may change these variables in-game if needed)
		GVAR(constantUpdate) = false; // Whether markers should update while the map isn't open.
		GVAR(bulletMarkerLifetime) = 2; // Seconds of marker lifetime.
		GVAR(bulletMaxFlighttime) = 3; // Seconds of max bullet lifetime.
		GVAR(bulletMarkerRefreshRate) = 10; // Hertz of bullet tracking refresh rate, same as FPS.
*/
#include "script_component.hpp"

if !(GVAR(Enabled)) then { // Not running
	params [["_detailLevel", 1, [0]], ["_interval", 1, [0]], ["_silent", false]];
	if (_interval > 0) then {
		GVAR(Enabled) = true;
		if !(_silent) then {
			hint format ["Map Monitor Starting.\nInterval: %1 second(s).", _interval];
		};
		[_detailLevel, _interval] spawn FUNC(loop);
	} else {
		if !(_silent) then {
			hint format ["Map Monitor Failed to Start.\nInvalid Interval of %1 second(s).", _interval];
		};
	};
} else { // Already Running
	GVAR(sigTerm) = true;
	params [["_silent", false]];
	hint "Map Monitor Ending...";
};

	hintSilent "";
if !(_silent) then {
	[{
		hintSilent "";
	}, [], 3] call CBA_fnc_waitAndExecute;
};
