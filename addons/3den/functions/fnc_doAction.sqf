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

	case 4: {
		if ((({(((_x get3DENAttribute "text") select 0) isEqualTo "HideTrigger")} count (all3DENEntities select 2)) isEqualTo 0) && ("Preferences" get3DENMissionAttribute "GW_ShowMessage")) then {
			_text = "No previus 'HideTerrainTrigger' found, Move, Rotate and Scale the trigger infront of you as it desired and change the condition if required, NOTE: Overlap triggers will cause unexpected results";
			[_text, 0, 10, true] call BIS_fnc_3DENNotification;
		};
		_tool = create3DENEntity ["Trigger","EmptyDetector", (screenToWorld [0.5,0.5])];
		_tool set3DENAttribute ["IsRectangle","Ellipse"];
		_tool set3DENAttribute ["size3",[5,5,5]];
//		_tool set3DENAttribute ["name", QGVAR(Logic_HideObjects)];
		_tool set3DENAttribute ["text", "HideTrigger"];
		_tool set3DENAttribute ["Condition","true"];
		_tool set3DENAttribute ["isServerOnly","true"];
		_tool set3DENAttribute ["onActivation","[thisTrigger, true] call GW_Common_fnc_setHideTerrainObjects"];
		[_tool] spawn FUNC(perFrame);

		_layer = ((all3DENEntities select 6) select {((_x get3DENAttribute "name") select 0) isEqualTo "Triggers (Hide)"});
		if (_layer isEqualTo []) then {
			_layer = [(-1 add3DENLayer "Triggers (Hide)")];
		};
		_tool set3DENLayer (_layer select 0);
	};

	case 5: {
		[getpos (selectRandom(get3DENSelected "object"))] call FUNC(setUnitGarrison);
	};

	default {
		systemChat "Error: No Action Found";
		["",QFUNC(doAction)] call FUNC(uiSaveFunction);
	};
};

true
