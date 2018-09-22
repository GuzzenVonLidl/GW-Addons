#include "script_Component.hpp"

private _return = false;
private _enableDebugConsole = ["DebugConsole",getMissionConfigValue ["enableDebugConsole", 0]] call (missionNamespace getVariable "BIS_fnc_getParamValue");

// Always allowed by mission config or mission param or if you're local server
if ((_enableDebugConsole isEqualTo 2 || (hasInterface && isServer)) || is3DEN) then {
	_return = true;
} else {
	// Editor
	if (!isMultiplayer && {(allDisplays find findDisplay 26 in [0, 1]) || (allDisplays find findDisplay 313 in [0, 1])}) then {
		_return = true;
	} else {
		// In multiplayer mode and server host or logged in admin
		if (isMultiplayer && ((missionNamespace getVariable ["GW_isAdmin", false]) || (serverCommandAvailable "#kick"))) then {
			_return = true;
		};
	};
};

_return
