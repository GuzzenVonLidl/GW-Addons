/*
	AUTHOR: GuzzenVonLidl

	Usage:
	[] call GW_3DEN_fnc_doActionMisc

	Parameters: None

	Return Value: No

	Public: NO
*/
#include "script_component.hpp"

params ["_case","_value"];
private _editorObject = ((get3DENSelected "object") select 0);

[(str _this),QFUNC(doActionMisc)] call FUNC(uiSaveFunction);

switch (_case) do {
	case 0: {
		do3DENAction "ToggleMapIDs";
	};
	case 1: {	// Reset Toggle
		{
			if ((get3DENActionState _x) isEqualTo 1) then {
				do3DENAction _x;
			};
		} forEach ["MoveGridToggle","RotateGridToggle","ScaleGridToggle"];
	};
	case 2: {
		[] call BIS_fnc_diagFindMissingAuthors;
		systemChat "Export Missing Authors";
	};

	case 3: {
		[true] call BIS_fnc_diagMissionWeapons;
		systemChat "Export Weapons and Magazines used in mission";
	};

	case 4: { // Get relative location of obj 2 from obj 1
		_type = _editorObject worldToModel (position ((get3DENSelected "object") select 1));
		systemChat str _type;
		copyToClipboard str _type;
	};

	default {
		systemChat "Error: No Action Found";
		["",QFUNC(doActionMisc)] call FUNC(uiSaveFunction);
	};
};

true
