#include "script_component.hpp"

private _isAdmin = (GVARMAIN(isAdmin) || (serverCommandAvailable "#logout"));

_params = _this select 1;

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
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
			],
			[
				"Modules >",
				"","","",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"modules", 1],
				-1, true,
				isClass(missionConfigFile >> "GW_Modules")
			],
			["New Server Monitor",{ [] call EFUNC(ServerMonitor,Toggle) }]
		]
	]
];

if (_menuName isEqualTo "actions") then {
	_menus pushBack [
		["actions","Actions Menu", _menuRsc],
		[
			[
				"Select Static Line",
				{ [] call GoL_ParadropType; },
				"", "", "", -1, (true), ParadropType
			],
			[
				"Select H.A.L.O",
				{ [] call GoL_ParadropType; },
				"", "", "", -1, (true), !ParadropType
			],
			[
				"Move MHQ_1",
				{ [mhq_1, player, 5] call FUNC(MoveVehicle); },
				"", "", "", -1, (true),
				isClass(missionConfigFile >> "GW_Modules")
			],
			[
				"Move MHQ",
				{ [mhq, player, 5] call FUNC(MoveVehicle); },
				"", "", "", -1, (true),
				!isClass(missionConfigFile >> "GW_Modules")
			]
		]
	];
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
			["Unit Count",{ ["Server"] call FUNC(countUnits); }],
			["Unit Count on HC",{ ["HC"] call FUNC(countUnits); }],
			["Toggle Server Fps",{ [5] spawn FUNC(serverfps) }],
			["Toggle Map Monitor",{ [2] call FUNC(mapMonitor_handler) }]
		]
	];
};

if (_menuName isEqualTo "player") then {
	_menus pushBack [
		["player","Player Menu", _menuRsc],
		[
			[
				"isActiveAdmin (True)",
				{ [QGVARMAIN(RemoveAdmin), player] call CBA_fnc_serverEvent; GVARMAIN(isActiveAdmin) = false; },
				"", "", "", -1, (true), !_isAdmin
			],
			[
				"isActiveAdmin (False)",
				{ [QGVARMAIN(AddAdmin), player] call CBA_fnc_serverEvent; GVARMAIN(isActiveAdmin) = true; },
				"", "", "", -1, (true), _isAdmin
			],
			["Open Virtual Aresnal", {['Open', true] call BIS_fnc_arsenal } ],
			[
				"Toggle Godmode (Activate)",
				{player allowDamage false; player setVariable [QGVAR(allowDamage), false]; },
				"", "", "", -1, (true),
				(player getVariable [QGVAR(allowDamage), true])
			],
			[
				"Toggle Godmode (Deactivate)",
				{player allowDamage true; player setVariable [QGVAR(allowDamage), true]; },
				"", "", "", -1, (true),
				!(player getVariable [QGVAR(allowDamage), true])
			],
			[
				"Toggle SetCaptive (Activate)",
				{player setCaptive true},
				"", "", "", -1, (true),
				!(captive player)
			],
			[
				"Toggle SetCaptive (Deactivate)",
				{player setCaptive false},
				"", "", "", -1, (true),
				(captive player)
			]
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

if (_menuName isEqualTo "modules") then {
	_menus pushBack [
		["modules","Modules Menu", _menuRsc],
		[
			[
				"Force Enable Weapon Lock",
				{["GW_StartUp_Enabled", true] call CBA_fnc_globalEvent},
				"", "", "", -1, (true),
				(isClass(missionConfigFile >> "GW_Modules" >> "StartUp") && !(player getVariable ["GW_StartUp_weaponLock", false]))
			],
			[
				"Force Disable Weapon Lock",
				{["GW_StartUp_Enabled", false] call CBA_fnc_globalEvent},
				"", "", "", -1, (true),
				(isClass(missionConfigFile >> "GW_Modules" >> "StartUp") && (player getVariable ["GW_StartUp_weaponLock", false]))
			]
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
