/*
	AUTHOR: GuzzenVonLidl

	Usage:
	[] call GW_3DEN_fnc_doAction

	Parameters: None

	Return Value: No

	Public: NO
*/
#include "script_component.hpp"

params ["_case","_value"];
private _editorObject = ((get3DENSelected "object") select 0);

[(str _this),QFUNC(doAction)] call FUNC(uiSaveFunction);

switch (_case) do {
	case 0: { // Get relative location of obj 2 from obj 1
		_type = _editorObject worldToModel (position ((get3DENSelected "object") select 1));
		systemChat str _type;
		copyToClipboard str _type;
	};

	case 1: { // Unit Count
		systemChat "derp";
	};

	case 2: {
		systemChat "Unit added to Projectile Tracker";
		collect3DENHistory {
			{
				if (_x isKindOf "CAManBase") then {
					_initCurrent = ((_x get3DENAttribute "init") select 0);
//					_initAdd = "[this] call BIS_fnc_diagBulletCam;";
					_initAdd = "[this] call CBA_fnc_addUnitTrackProjectiles;";
					_x set3DENAttribute ["init", _initCurrent + _initAdd];
				};
			} forEach (get3DENSelected "object");
		};
	};

	case 3: {
		("Preferences" set3DENMissionAttribute ["GW_PatternOffset", _value]);
	};

	default {
		systemChat "Error: No Action Found";
		["",QFUNC(doAction)] call FUNC(uiSaveFunction);
	};
};

true
