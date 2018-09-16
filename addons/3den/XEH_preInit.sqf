#include "script_component.hpp"

if !(is3DEN) exitWith {false};

#include "XEH_PREP.sqf"

clearRadio;

GVAR(AutoTestEvents) = [];
GVAR(ExportErrorCount) = 0;
GVAR(hiddenTriggers) = [];
GVAR(MHQ_Object) = objNull;

1 call FUNC(doActionMisc);
'init' call bis_fnc_3DENStatusBar;

[QGVAR(updateNewCopy), {
	_getVersion = (getNumber (missionConfigFile >> "GW_Modules" >> "Common" >> "version"));
	if !(_getVersion isEqualTo 0) then {
		_useNewCopy = false;
		if (_getVersion >= 1.6) then {
			_useNewCopy = true;
		};
		if !(_useNewCopy isEqualTo ("Preferences" get3DENMissionAttribute "GW_useNewCopy")) then {
			"Preferences" set3DENMissionAttribute ["GW_useNewCopy", _useNewCopy];
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(updateNewCopy), []] call CBA_fnc_localEvent;

addMissionEventHandler ["Draw3D", {
	_layer = ((all3DENEntities select 6) select {((_x get3DENAttribute "name") select 0) isEqualTo "Triggers (Hide)"});
	if (("Preferences" get3DENMissionAttribute "GW_Show3DMessage") && !(_layer isEqualTo [])) then {
		if ((((_layer select 0) get3DENAttribute "Visibility") select 0) && (((_layer select 0) get3DENAttribute "Transformation") select 0)) then {
			{
				if (!([_x] call FUNC(isNil3DENEntity)) && ((get3DENCamera distance _x) < 600)) then {
					drawIcon3D ["", [1,0,0,1], _x, 0, 0, 0, "Logic: HideTerrainTrigger", 1, 0.04, "PuristaMedium"];
				};
			} forEach GVAR(hiddenTriggers);
		};
	};
}];

{	// On Load
	_radius = ((_x get3DENAttribute "size3") select 0);
	_objects = (nearestTerrainObjects [_x, HIDEOBJECTFILTER, (selectMax _radius), false]);

	{
		if !(isObjectHidden _x) then {
			_x hideObjectGlobal true;
		};
	} forEach (_objects inAreaArray _x);
} forEach ((all3DENEntities select 2) select {(((_x get3DENAttribute "text") select 0) isEqualTo "HideTrigger")});

[] spawn {
	while {is3DEN} do {
		{
			[_x] spawn FUNC(perFrame);
			GVAR(hiddenTriggers) pushBackUnique _x;
		} forEach ((all3DENEntities select 2) select {(((_x get3DENAttribute "text") select 0) isEqualTo "HideTrigger") && !(_x in GVAR(hiddenTriggers))});

		uiSleep 1;
	};
};

[] spawn {
	while {is3DEN} do {
		[] call FUNC(showStats);
		uiSleep 0.1;
	};
};
