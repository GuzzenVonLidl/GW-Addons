/*
	AUTHOR: GuzzenVonLidl
	Gets Location in the area and then moves selected units to the valid house positions

	Usage:
	[] call GW_3DEN_fnc_garrisonNearest

	Parameters: None

	Return Value: None

	Public: NO
*/
#include "script_component.hpp"

params ["_pos"];

private _radius = ("Preferences" get3DENMissionAttribute "GW_GarrisonRadius");
private _buildingPos = [];
private _buildingPosSort = [];
private _buildingPosUsed = [];

{
	if (!(isObjectHidden _x)) then {
		_housePositions = ([_x] call BIS_fnc_buildingPositions);
		if (count _housePositions > 0) then {
			_buildingPos = (_buildingPos + _housePositions);
			ADD(_buildingPos,_housePositions);
		};
	};
} forEach (nearestObjects [_pos, ["house"], _radius]);

_buildingPosSort = [_buildingPos,[],{_pos distance _x},"ASCEND"] call BIS_fnc_sortBy;

{
	private _unit = _x;
	_selectedPos = (_buildingPosSort select _forEachIndex);
	if (_unit isKindOf "CAManBase") then {
		_unit set3DENAttribute ["position",_selectedPos];
		_unit set3DENAttribute ["rotation", [0,0,floor(random 360)]];
	};
	if (_forEachIndex isEqualTo (count _buildingPosSort)) exitWith {
		["Units exided bulding positons"] call BIS_fnc_3DENNotification;
	};
	_buildingPosSort deleteAt (_buildingPosSort find _selectedPos);
} forEach (get3DENSelected "object");

true
