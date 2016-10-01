_suboptions = [];

_units = playableUnits;
// _units = allUnits;

_count = count _units;
if (_count > 15) then {_units = [_units] call CBA_fnc_shuffle};

{
	_suboptions set [count _suboptions,
	[
		format ["%1",(name _x)],
//        format ["%1 execVM 'GOL_Menu\Menus_Admin\Teleport_unit.sqf'",_x],
		format ["%1",[_x] spawn GOL_Fnc_TeleportUnit],
		"",
		"",
		"",
		-1,
		true,
		true
	]];
} forEach _units;

[
	["TeleportUnitList", "Teleport Player", "popup"],
	_suboptions
]
