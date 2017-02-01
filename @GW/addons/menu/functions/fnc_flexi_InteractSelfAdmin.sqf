#include "script_component.hpp"

_params = _this select 1;

_menuName = "";
_menuRsc = "popup";

if (typeName _params isEqualTo typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

private _menuDef = [];
private _menus = [
	[
		["main", "Admin Menu", _menuRsc],
		[
			[
				"Actions >",
				"", "", "",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"actions", 1]
			],
			[
				"Debug >",
				"", "", "",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"debug", 1]
			],
			[
				"Player Options >",
				"", "", "",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"player", 1]
			],
			[
				"Spawn Menu >",
				"", "", "",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"spawn", 1]
			]
		]
	]
];

if (_menuName isEqualTo "actions") then {
	_menus pushBack [
		["actions","Actions Menu", _menuRsc],
		[
			[
				"MHQ >",
				"","","",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"mhqlist", 1],
				-1, true,
				isClass(missionConfigFile >> "GW_Modules" >> "MHQ")
			],
			[
				"Paradrop >",
				"","","",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"paradrop", 1]
			],
			[
				"Modules >",
				"","","",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"modules", 1],
				-1, true,
				isClass(missionConfigFile >> "GW_Modules")
			]
		]
	];
};

if (_menuName isEqualTo "mhqlist") then {
	private _mhqMenu = [];
	{
		if !((_x getVariable ["GW_MHQ_info", []]) isEqualTo []) then {
			_mhqMenu pushBack ["Move MHQ_1", compile format ["[%1, player, 5] call GW_Menu_fnc_MoveVehicle;", _x]];
		};
	} forEach vehicles;
	_menus pushBack [["mhqlist", "MHQ List", _menuRsc],_mhqMenu];
};

if (_menuName isEqualTo "paradrop") then {
	_menus pushBack [
		["paradrop","Paradrop", _menuRsc],
		[
			[
				"H.A.L.O",
				{ [QGVAR(paradropMode), true] call CBA_fnc_GlobalEvent; },
				[GVAR(ParadropHalo)] call FUNC(getCheckBoxIcon)
			],
			[
				"Static Line",
				{ [QGVAR(paradropMode), false] call CBA_fnc_GlobalEvent; },
				[!GVAR(ParadropHalo)] call FUNC(getCheckBoxIcon)
			]
		]
	];
};

if (_menuName isEqualTo "modules") then {
	if ((getNumber(missionConfigFile >> "GW_Modules" >> "StartUp" >> "version")) isEqualTo 1) then {
		_menus pushBack [
			["modules","Modules Menu", _menuRsc],
			[
				[
					"Weapon Lock",
					{["GW_StartUp_Enabled", true] call CBA_fnc_globalEvent},
					[false] call FUNC(getCheckBoxIcon),
					"", "", -1, (true),
					(isClass(missionConfigFile >> "GW_Modules" >> "StartUp") && !(player getVariable ["GW_StartUp_weaponLock", false]))
				],
				[
					"Weapon Lock",
					{["GW_StartUp_Enabled", false] call CBA_fnc_globalEvent},
					[true] call FUNC(getCheckBoxIcon),
					"", "", -1, (true),
					(isClass(missionConfigFile >> "GW_Modules" >> "StartUp") && (player getVariable ["GW_StartUp_weaponLock", false]))
				]
			]
		];
	} else {
		_menus pushBack [
			["modules","Modules Menu", _menuRsc],
			[
				[
					"Weapon Lock",
					{["GW_StartUp_setSafetyMode", true] call CBA_fnc_globalEvent},
					[false] call FUNC(getCheckBoxIcon),
					"", "", -1, (true),
					(isClass(missionConfigFile >> "GW_Modules" >> "StartUp") && !GW_StartUp_Enabled)
				],
				[
					"Weapon Lock",
					{["GW_StartUp_setSafetyMode", false] call CBA_fnc_globalEvent},
					[true] call FUNC(getCheckBoxIcon),
					"", "", -1, (true),
					(isClass(missionConfigFile >> "GW_Modules" >> "StartUp") && GW_StartUp_Enabled)
				]
			]
		];
	};
};

if (_menuName isEqualTo "debug") then {
	_menus pushBack [
		["debug","Debug Menu", _menuRsc],
		[
			["Simple Camera",{ [] call BIS_fnc_cameraOld; }],
			["Advanced Camera",{ [] call bis_fnc_camera; }],
			["Spectator Mode",{
				if ((["IsSpectating"] call BIS_fnc_EGSpectator)) then {
					(["Terminate"] call BIS_fnc_EGSpectator);
				} else {
					(["Initialize", [player, [], true]] call BIS_fnc_EGSpectator);
				};
			}],
//			["Unit Count",{ ["Server"] call FUNC(countUnits); }],
			[
				"Server Monitor",
				{ [] call EFUNC(MonitorServer,Toggle) },
				[!EGVAR(MonitorServer,doEnabled)] call FUNC(getCheckBoxIcon)
			],
			[
				"Map Monitor",
				{ [] call EFUNC(MonitorMap,Handler) },
				[EGVAR(MonitorMap,Enabled)] call FUNC(getCheckBoxIcon)
			]
		]
	];
};

if (_menuName isEqualTo "player") then {
	_menus pushBack [
		["player","Player Menu", _menuRsc],
		[
			[
				"isActiveAdmin",
				{ [QGVARMAIN(RemoveAdmin), player] call CBA_fnc_serverEvent; GVARMAIN(isActiveAdmin) = false;},
				[true] call FUNC(getCheckBoxIcon),
				"", "", -1, (true), GVARMAIN(isActiveAdmin)
			],
			[
				"isActiveAdmin",
				{ [QGVARMAIN(AddAdmin), player] call CBA_fnc_serverEvent; GVARMAIN(isActiveAdmin) = true;},
				[false] call FUNC(getCheckBoxIcon),
				"", "", -1, (true), !GVARMAIN(isActiveAdmin)
			],
			[
				"Toggle Godmode",
				{player allowDamage false; player setVariable [QGVAR(allowDamage), false]},
				[false] call FUNC(getCheckBoxIcon),
				"", "", -1, (true),
				(player getVariable [QGVAR(allowDamage), true])
			],
			[
				"Toggle Godmode",
				{player allowDamage true; player setVariable [QGVAR(allowDamage), true]},
				[true] call FUNC(getCheckBoxIcon),
				"", "", -1, (true),
				!(player getVariable [QGVAR(allowDamage), true])
			],
			[
				"Toggle SetCaptive",
				{player setCaptive true},
				[false] call FUNC(getCheckBoxIcon),
				"", "", -1, (true),
				!(captive player)
			],
			[
				"Toggle SetCaptive",
				{player setCaptive false},
				[true] call FUNC(getCheckBoxIcon),
				"", "", -1, (true),
				(captive player)
			],
			["Open Virtual Aresnal", {['Open', true] call BIS_fnc_arsenal}]
		]
	];
};

if (_menuName isEqualTo "spawn") then {
	_menus pushBack [
		["spawn","Spawn Menu", _menuRsc],
		[
/*
			[
				"Loadouts >",
				"", "", "",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"loadouts", 1]
			],
*/
			["Ammo Box - Squad",{ ["small_box","Box_NATO_Ammo_F", player] remoteExecCall [QFUNC(spawnBox), 2] }],
			["Ammo Box - Platoon",{ ["big_box","B_CargoNet_01_ammo_F", player] remoteExecCall [QFUNC(spawnBox), 2] }],
			["Medical Box - Big",{ ["med_box","Box_NATO_AmmoOrd_F", player] remoteExecCall [QFUNC(spawnBox), 2] }]
		]
	];
};

{
	if (((_x select 0) select 0) isEqualTo _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if ((count _menuDef) isEqualTo 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName isEqualTo "") then {_this}else{""},__FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};
_menuDef
