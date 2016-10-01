#include "script_component.hpp"

if !(GOL_IsAdmin || (serverCommandAvailable "#logout")) exitWith {false};

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];

_target = _this select 0;
_params = _this select 1;

if ((_target distance player) > 5) exitWith {};

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__]};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

//-----------------------------------------------------------------------------

_players = call CBA_fnc_players;

// Preventing any errors if something were to happen
if (isNil "CBA_UI_Target") then { CBA_UI_Target = cursorTarget; };

// If target has not been assaigned the variables
if (isNil {CBA_UI_Target getVariable "GOL_admin_allowDamage"}) then { CBA_UI_Target setVariable ['GOL_admin_allowDamage', true]; };

_menus = [
	[
		["main", "Admin Menu", _menuRsc],
		[
			[
				"<t color='#B40404'>Admin Menu ></t>",
				"","","",
				["_this call GOL_Fnc_Admin_InteractMenu","vehicle_menu", 1],
				-1,(true),
				(CBA_UI_Target isKindOf "Air" || CBA_UI_Target isKindOf "LandVehicle" || CBA_UI_Target isKindOf "Car" || CBA_UI_Target isKindOf "Tank")
			],
			[
				"<t color='#B40404'>Admin Menu ></t>",
				"","","",
				["_this call GOL_Fnc_Admin_InteractMenu","player_menu", 1],
				-1,(true),
				(CBA_UI_Target isKindOf "CAManBase")
			]
		]
	]
];

// ----------------------------------------------------------------------------- \\
// ------------------------------ Vehicle Menu --------------------------------- \\
// ----------------------------------------------------------------------------- \\

if (_menuName == "vehicle_menu") then {
	_menus set [count _menus,
		[
			["vehicle_menu","Vehicle Menu", _menuRsc],
			[
				["Heal Vehicle","CBA_UI_Target setDamage 0;"],
				["Resupply Vehicle", { CBA_UI_Target setFuel 1; CBA_UI_Target setVehicleAmmo 1; } ],
				["Flip Vehicle","CBA_UI_Target setPos [getPos CBA_UI_Target select 0, getPos CBA_UI_Target select 1, 0.5];"],
				[
					"Damage Vehicle >",
					"","","",
					["_this call GOL_Fnc_Admin_InteractMenu","vehicle_delete", 1]
				],
				["Teleport Player",{ [CBA_UI_Target] spawn GOL_Fnc_TeleportUnit; }]
			]
		]
	];
};

if (_menuName == "vehicle_delete") then {
	_menus set [count _menus,
		[
			["vehicle_delete","Confirm", _menuRsc],
			[
				["Damage Vehicle","CBA_UI_Target setDamage 0.5;"],
				["Destroy Vehicle","CBA_UI_Target setDamage 1;"],
				["Delete Vehicle","deleteVehicle CBA_UI_Target;"]
			]
		]
	];
};

// ----------------------------------------------------------------------------- \\
// ------------------------------- Player Menu --------------------------------- \\
// ----------------------------------------------------------------------------- \\

if (_menuName == "player_menu") then {
	_menus set [count _menus,
		[
			["player_menu","Player Menu", _menuRsc],
			[
				["Fix Bleeding Bug","CBA_UI_Target setDamage 0;"],
				[
					"Toggle Godmode (Activate)",
					{CBA_UI_Target allowDamage false; CBA_UI_Target setVariable ['GOL_admin_allowDamage', false]; },
					"","","",-1,(true),
					(CBA_UI_Target getVariable "GOL_admin_allowDamage")
				],
				[
					"Toggle Godmode (Deactivate)",
					{CBA_UI_Target allowDamage true; CBA_UI_Target setVariable ['GOL_admin_allowDamage', true]; },
					"","","",-1,(true),
					!(CBA_UI_Target getVariable "GOL_admin_allowDamage")
				],
				[
					"Toggle SetCaptive (Activate)",
					{CBA_UI_Target setCaptive true},
					"","","",-1,(true),
					!(captive CBA_UI_Target)
				],
				[
					"Toggle SetCaptive (Deactivate)",
					{CBA_UI_Target setCaptive false},
					"","","",-1,(true),
					(captive CBA_UI_Target)
				],
				["Teleport Player",{ [CBA_UI_Target] spawn GOL_Fnc_TeleportUnit; }]
			]
		]
	];
};

//-----------------------------------------------------------------------------

_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2", str _menuName, if (_menuName == "") then {_params} else {""}];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _params, __FILE__];
};

_menuDef // return value
