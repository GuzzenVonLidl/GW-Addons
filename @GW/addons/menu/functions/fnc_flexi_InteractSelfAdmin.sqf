#include "script_component.hpp"

if !(GOL_IsAdmin || (serverCommandAvailable "#logout")) exitWith {false};

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
				"Debug >",
				"", "", "",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"debug_options", 1]
			],
			[
				"Player Options >",
				"", "", "",
				[QUOTE(call FUNC(flexi_InteractSelfAdmin)),"player_options", 1]
			]
		]
	]
];

if (_menuName isEqualTo "debug_options") then {
	_menus pushBack [
		["debug_options","Debug Menu", _menuRsc],
		[
			["Simple Camera",{ [] call BIS_fnc_cameraOld; }],
			["Advanced Camera",{ [] call bis_fnc_camera; }],
			["Spectator",{
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

if (_menuName isEqualTo "player_options") then {
	_menus pushBack [
		["player_options","Player Menu", _menuRsc],
		[
			["Airdrop Type", { [] call GoL_ParadropType; } ],
			["Move MHQ", { [MHQ, player, 5] call GOL_Fnc_MoveVehicle; } ],
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



{
	if (((_x select 0) select 0) isEqualTo _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if ((count _menuDef) isEqualTo 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName isEqualTo "") then {_this}else{""},__FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};
_menuDef
