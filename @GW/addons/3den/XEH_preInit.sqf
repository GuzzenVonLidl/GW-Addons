#include "script_component.hpp"

#include "XEH_PREP.sqf"

if (is3DEN) then {
	GVAR(hideObjectPerFrame) = true;
	GVAR(hiddenTriggers) = [];
	1 call FUNC(doActionMisc);
	'init' call bis_fnc_3DENStatusBar;
//	'init' call bis_fnc_3DENControlsHint;
//	'init' call bis_fnc_3DENInterface;

	"BIS_fnc_isDebugConsoleAllowed" call BIS_fnc_recompile;

//	setViewDistance 3000;
//	setObjectViewDistance [2500, 100];

	[] spawn {
		while {is3DEN} do {
			[] call FUNC(showStats);
			uiSleep 0.1;
		};
	};

	[] spawn {
		if ("Preferences" get3DENMissionAttribute "GW_Show3DMessage") then {
			addMissionEventHandler ["Draw3D", {
				{
					if (!([_x] call FUNC(isNil3DENEntity)) && ("Preferences" get3DENMissionAttribute "GW_Show3DMessage")) then {
						drawIcon3D ["", [1,0,0,1], _x, 0, 0, 0, "Logic: HideTerrainTrigger", 1, 0.05, "PuristaMedium"];
					};
				} forEach GVAR(hiddenTriggers);
			}];
		};

		// On Load
		{
			[_x] spawn FUNC(perFrame);
		} forEach ((all3DENEntities select 2) select {(((_x get3DENAttribute "text") select 0) isEqualTo "HideTrigger")});

		while {is3DEN} do {
			{
				if (_x in (get3DENSelected "trigger")) then {
					[_x] spawn FUNC(perFrame);
				};
				GVAR(hiddenTriggers) pushBackUnique _x;
			} forEach ((all3DENEntities select 2) select {(((_x get3DENAttribute "text") select 0) isEqualTo "HideTrigger") && !(_x in GVAR(hiddenTriggers))});

			uiSleep 1;
		};
	};
};
