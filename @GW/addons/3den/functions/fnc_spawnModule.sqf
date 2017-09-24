/*
	AUTHOR: GuzzenVonLidl

	Usage:
	[1, true] call GW_3den_fnc_spawnModule;

	Parameters:
	#0	NUMBER:	Case in Switch

	Return Value: <GROUP>
	Group that spawned

	Public: NO

	Case 1: Hide objects
	Case 2: Garrison

*/
#include "script_component.hpp"

#define	SCREENPOS	screenToWorld [0.5,0.5]
params [
	"_type",
	"_alternetive"
];

[(str _this),QFUNC(spawnModule)] call FUNC(uiSaveFunction);

switch (_type) do {
	case 1: {
		if ((({(((_x get3DENAttribute "text") select 0) isEqualTo "HideTrigger")} count (all3DENEntities select 2)) isEqualTo 0) && ("Preferences" get3DENMissionAttribute "GW_ShowMessage")) then {
			_text = "No previus 'HideTerrainTrigger' found, Move, Rotate and Scale the trigger infront of you as it desired and change the condition if required, NOTE: Overlap triggers will cause unexpected results";
			[_text, 0, 10, true] call BIS_fnc_3DENNotification;
		};
		_tool = create3DENEntity ["Trigger","EmptyDetector", SCREENPOS];
		_tool set3DENAttribute ["IsRectangle","Ellipse"];
		_tool set3DENAttribute ["size3",[25,25,10]];
//		_tool set3DENAttribute ["name", QGVAR(Logic_HideObjects)];
		_tool set3DENAttribute ["text", "HideTrigger"];
		_tool set3DENAttribute ["Condition","true"];
		_tool set3DENAttribute ["onActivation","[thisTrigger, true] call GW_Common_fnc_setHideTerrainObjects"];
		[_tool] spawn FUNC(perFrame);
	};

	case 2: {
		#define	LOGIC QGVAR(Logic_Garrison)
		#define	GET_LOGIC	([LOGIC] call FUNC(getTool))
		#define	ISLOGICNIL	([LOGIC] call FUNC(isNil))
		if (ISLOGICNIL) then {
			[
				"No position found for garrison units, Would you like to use a One of the Units as 'center' or use a Game Logic as center","No Center position Found!",
				["Unit", {
					if (count (get3DENSelected "object") isEqualTo 0) then {
						["No units were selected!", 1, 5, false] call BIS_fnc_3DENNotification;
					} else {
						[((get3DENSelected "object") select 0)] call FUNC(garrisonNearest);
					};
					false
				}],
				["Logic", {
					if (ISLOGICNIL) then {
						_tool = create3DENEntity ["Logic","Logic", SCREENPOS];
						_tool set3DENAttribute ["name", QGVAR(Logic_Garrison)];
						if ("Preferences" get3DENMissionAttribute "GW_Show3DMessage") then {
							GVAR(Logic_Garrison_ID) = addMissionEventHandler ["Draw3D", {
								if !(ISLOGICNIL) then {
									drawIcon3D ["", [1,0,0,1], GET_LOGIC, 0, 0, 0, "Logic: Garrison", 1, 0.05, "PuristaMedium"];
								} else {
									removeMissionEventHandler ["Draw3D", GVAR(Logic_Garrison_ID)];
								};
							}];
						};
					};
					false
				}]
			] call BIS_fnc_3DENShowMessage;
		} else {
			[GET_LOGIC] call FUNC(garrisonNearest);
		};
	};

	default {
		["",""] call FUNC(uiSaveFunction);
	};
};



/*

//		#define	OBJECT	([QGVAR(Logic_HideObjects)] call FUNC(getTool))
		#define	LOGIC QGVAR(Logic_HideObjects)
		#define	GET_LOGIC	([LOGIC] call FUNC(getTool))
		#define	ISLOGICNIL	([LOGIC] call FUNC(isNil))
		#define	POS	(getPos GET_LOGIC)
		#define	RADIUS	((GET_LOGIC get3DENAttribute "size3") select 0)
		#define	RADIUS_A	(RADIUS select 0)

		if (ISLOGICNIL) then {
			if ("Preferences" get3DENMissionAttribute "GW_ShowMessage") then {
				_text = "No previus Modular Trigger has been found, Move, Rotate and Scale module infront of you as it desired and then press the same button again to execute the function you wanted";
				[_text, 0, 10, true] call BIS_fnc_3DENNotification;
//				[_text,"Warning","Ok","Ok"] call BIS_fnc_3DENShowMessage;
			};
			_tool = create3DENEntity ["Trigger","EmptyDetector", SCREENPOS];
			_tool set3DENAttribute ["IsRectangle","Ellipse"];
			_tool set3DENAttribute ["size3",[25,25,25]];
			_tool set3DENAttribute ["name", QGVAR(Logic_HideObjects)];
			GVAR(Logic_HideObjects_ID) = addMissionEventHandler ["Draw3D", {
				if !(ISLOGICNIL) then {
					drawIcon3D ["", [1,0,0,1], GET_LOGIC, 0, 0, 0, "Logic: Toggle Objects", 1, 0.05, "PuristaMedium"];
				} else {
					removeMissionEventHandler ["Draw3D", GVAR(Logic_HideObjects_ID)];
				};
			}];
		} else {
			if (GET_LOGIC isKindOf "EmptyDetector") then {
				if (RADIUS_A isEqualTo (RADIUS select 1)) then {
					if (_alternetive) then {	// Hide
						["Press 'Continue' to Hide objects in area, Module will be delete in the process","Confirm Action", ["Hide", {
							[POS, RADIUS_A, true] call FUNC(setObjectHidden);
							copyToClipboard (str([POS, RADIUS_A, true]) + (" call GW_3den_fnc_setObjectHidden;"));
							delete3DENEntities [GET_LOGIC];
						}]] call BIS_fnc_3DENShowMessage;
					} else {	// Show
						["Press 'Continue' to Show objects in area, Module will be delete in the process","Confirm Action", ["Show", {
							[POS, RADIUS_A, false] call FUNC(setObjectHidden);
							copyToClipboard (str([POS, RADIUS_A, false]) + (" call GW_3den_fnc_setObjectHidden;"));
							delete3DENEntities [GET_LOGIC];
						}]] call BIS_fnc_3DENShowMessage;
					};
				} else {
					["Reason: Trigger Size does not match, Make 'Size A' and 'Size B' are equal, Once fixed try again","Could not execute action"] call BIS_fnc_3DENShowMessage;
				};
			} else {
				["Old Module still exists and does not match, Do you want to delete old and create a new one?","Warning", ["Continue", {
					delete3DENEntities [GET_LOGIC];
				}]] call BIS_fnc_3DENShowMessage;
			};
		};
*/
