/*
        Function: FUNC(mapMonitor_handler)
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
                [(detailInt, intervalInt)] spawn FUNC(mapMonitor_handler);

        Example(s):
                [] spawn FUNC(mapMonitor_handler); // Default configuration
                [0] spawn FUNC(mapMonitor_handler); // Low detail and normal updates
                [3, 1] spawn FUNC(mapMonitor_handler); // Very high detail and updates of 1 second

        Editable Variable(s): (You may change these variables in-game if needed)
                GVAR(mapMonitor_constantUpdate) = false; // Whether markers should update while the map isn't open.
                GVAR(mapMonitor_bulletMarkerLifetime) = 2; // Seconds of marker lifetime.
                GVAR(mapMonitor_bulletMaxFlighttime) = 3; // Seconds of max bullet lifetime.
                GVAR(mapMonitor_bulletMarkerRefreshRate) = 10; // Hertz of bullet tracking refresh rate, same as FPS.
*/
#include "script_component.hpp"

if !(GVAR(mapMonitor_Enabled)) then { // Not running
	params [["_detailLevel", 1, [0]], ["_interval", 1, [0]]];
	if (_interval > 0) then {
		GVAR(mapMonitor_Enabled) = true;
        hint format ["Map Monitor Starting.\nInterval: %1 second(s).", _interval];
        [_detailLevel, _interval] spawn FUNC(mapMonitor_loop);
    } else {
        hint format ["Map Monitor Failed to Start.\nInvalid Interval of %1 second(s).", _interval];
    };
} else { // Already Running
    GVAR(mapMonitor_sigTerm) = true;
	hint "Map Monitor Ending...";
};
