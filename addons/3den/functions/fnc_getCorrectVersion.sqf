/*
	AUTHOR: GuzzenVonLidl
	Gets Location in the area and then moves selected units to the valid house positions

	Usage:
	[] call GW_3DEN_fnc_getCorrectVersion

	Parameters: None

	Return Value: None

	Public: NO
*/
#include "script_component.hpp"

params ["_copyGroup","_copyType"];

_isNil = (isNil {(["GW_Modules", "Common", "version"] call BIS_fnc_getCfgData)});
_getVersion = (getNumber (missionConfigFile >> "GW_Modules" >> "Common" >> "version"));

if (_isNil || (_getVersion >= 1.5)) then {
	if (_copyGroup) then {
		[_copyType] call FUNC(copyGroup);
	} else {
		[_copyType] call FUNC(copyStatic);
	};
} else {
	if (_copyGroup) then {
		[_copyType] call FUNC(copyGroupOld);
	} else {
		[_copyType] call FUNC(copyStaticOld);
	};
};
