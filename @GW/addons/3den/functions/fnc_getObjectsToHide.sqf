/*
	AUTHOR: GuzzenVonLidl
	Gets Location from 3den then hides objects and copies code to be placed in spawnList

	Usage:
	[true] call GW_3DEN_fnc_getObjetsToHide

	Parameters:
	#0	BOOL:	Hides or Shows objects

	Return Value: <CODE>
	Copy of code to be executed when desired

	Public: NO
*/
#include "script_component.hpp"

params ["_case"];

if (is3DEN) then {
	private _pos = [] call FUNC(getRightClick);

	_radius = ("Preferences" get3DENMissionAttribute "GW_HideObjectRadius");
	if !(_case) then {
		_radius = ("Preferences" get3DENMissionAttribute "GW_ShowObjectRadius");
	};

	[_pos, _radius, _case] call FUNC(setObjectHidden);
	copyToClipboard (str([_pos, _radius, _case]) + (" call GW_3den_fnc_setObjectHidden;"));
};
