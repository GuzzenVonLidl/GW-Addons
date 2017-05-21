/*
	AUTHOR: GuzzenVonLidl
	Gets Location in the area and then moves selected units to the valid house positions

	Usage:
	[] call GW_3DEN_fnc_getObjetsToHide

	Parameters: None

	Return Value: None

	Public: NO
*/
#include "script_component.hpp"

private _pos = call FUNC(getRightClick);

private _radius = ("Preferences" get3DENMissionAttribute "GW_GarrisonRadius");
private _buildingPos = [];

{
	if (!(isObjectHidden _x)) then {
		private _housePositions = ([_x] call BIS_fnc_buildingPositions);
		ADD(_buildingPos,_housePositions);
	};
} forEach (nearestObjects [_pos, ["house"], _radius]);
private _buildingPos = [_buildingPos,[],{_pos distance2d _x},"ASCEND",{!(_x isEqualTo [0,0,0])}] call BIS_fnc_sortBy;

{
	private _unit = _x;
	_selectedPos = (_buildingPos select _forEachIndex);
	if (_unit isKindOf "CAManBase") then {
		_unit set3DENAttribute ["position",_selectedPos];
		_unit set3DENAttribute ["rotation", [0,0,floor(random 360)]];
	};
	if (_forEachIndex isEqualTo (count _buildingPos)) exitWith {
		["Units exided bulding positons"] call BIS_fnc_3DENNotification;
	};
} forEach (get3DENSelected "object");

true
