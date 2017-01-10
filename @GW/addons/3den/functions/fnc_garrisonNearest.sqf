/*
	Author: Revo

	Description:
	Garrison one or multiple buildings in the area. Radius of the area and coverage can be defined in the preferences menu.

	Parameter(s):
	-
	Returns:
	true
*/
#include "script_component.hpp"

private _getPos = (uiNamespace getVariable "bis_fnc_3DENEntityMenu_data") select 0;
private _radius = "Preferences" get3DENMissionAttribute "GW_GarrisonRadius";
private _buildingPos = [];

{
	private _housePositions = ([_x] call BIS_fnc_buildingPositions);
	ADD(_buildingPos,_housePositions);
} forEach (nearestObjects [_getPos, ["house"], _radius]);
private _buildingPos = [_buildingPos,[],{_getPos distance2d _x},"ASCEND",{!(_x isEqualTo [0,0,0])}] call BIS_fnc_sortBy;

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
