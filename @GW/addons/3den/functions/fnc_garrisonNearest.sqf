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

params [["_pos", [0,0,0]]];

//private _radius = ("Preferences" get3DENMissionAttribute "GW_GarrisonRadius");
private _radius = 50;
private _buildingPos = [];
private _buildingPosSort = [];
private _buildingPosUsed = [];

if (count (get3DENSelected "object") isEqualTo 0) exitWith {
	["No units were selected!", 1, 5, false] call BIS_fnc_3DENNotification;
	false
};

if (_pos isEqualTo [0,0,0]) then {
	_object = (call FUNC(getTool));
	_pos = (getPos _object);
	_radius = ((_object get3DENAttribute "size3") select 0);
};

{
	if (!(isObjectHidden _x)) then {
		_housePositions = ([_x] call BIS_fnc_buildingPositions);
		if (count _housePositions > 0) then {
//			_buildingPos = (_buildingPos + _housePositions);
			ADD(_buildingPos,_housePositions);
		};
	};
} forEach (nearestObjects [_pos, ["house"], _radius]);

_buildingPosSort = [_buildingPos,[],{_pos distance _x},"ASCEND"] call BIS_fnc_sortBy;

if (count _buildingPosSort > 0) then {
	collect3DENHistory {
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
	};
} else {
	["No Buildings were found, Printed to log", 1, 5, false] call BIS_fnc_3DENNotification;
//	diag_log _buildingPos;
//	diag_log _buildingPosSort;
//	diag_log _buildingPosUsed;
};

true
