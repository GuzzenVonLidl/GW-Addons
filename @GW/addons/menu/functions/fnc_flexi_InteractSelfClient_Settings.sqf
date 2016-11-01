#include "script_component.hpp"

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
		["settings_main", "Settings Menu", _menuRsc],
		[
			[
				"View Distance >",
				"","","",
				[QUOTE(call FUNC(flexi_InteractSelfClient_Settings)),"settings_viewDistance", 1],
				-1,true,
				GVAR(viewDistance_Enabled)
			],
			[
				"Grass Settings >",
				"","","",
				[QUOTE(call FUNC(flexi_InteractSelfClient_Settings)),"settings_grass", 1],
				-1,true,
				GVAR(Grass_Enabled)
			],
			[
				"Hud Options >",
				"","","",
				[QUOTE(call FUNC(flexi_InteractSelfClient_Settings)),"settings_sthud", 1],
				-1, true,
				GVAR(STHud_Enabled)
			],
			["Save Settings", { [QGVAR(settings), "save"] call CBA_fnc_localEvent; } ],
			["Load Settings", { [QGVAR(settings), "load"] call CBA_fnc_localEvent; } ]
		]
	]
];

if (_menuName == "settings_viewDistance") then {
	_menus pushBack [
		["settings_viewDistance","View Distance", _menuRsc],
		[
			[
				"500",
				"setViewDistance 500; setObjectViewDistance 500;"
			],
			[
				"1000",
				"setViewDistance 1000; setObjectViewDistance 835;",
				"","","",-1,true,
				(GVAR(viewDistance_Max) >= 1000)
			],
			[
				"1200",
				"setViewDistance 1200; setObjectViewDistance 925;",
				"","","",-1,true,
				(GVAR(viewDistance_Max) >= 1200)
			],
			[
				"1500",
				"setViewDistance 1500; setObjectViewDistance 1060;",
				"","","",-1,true,
				(GVAR(viewDistance_Max) >= 1500)
			],
			[
				"2000",
				"setViewDistance 2000; setObjectViewDistance 1286;",
				"","","",-1,true,
				(GVAR(viewDistance_Max) >= 2000)
			],
			[
				"3000",
				"setViewDistance 3000; setObjectViewDistance 1736;",
				"","","",-1,true,
				(GVAR(viewDistance_Max) >= 3000)
			],
			[
				"4000",
				"setViewDistance 4000; setObjectViewDistance 2187;",
				"","","",-1,true,
				(GVAR(viewDistance_Max) >= 4000)
			],
			[
				"6000",
				"setViewDistance 6000; setObjectViewDistance 3088;",
				"","","",-1,true,
				(GVAR(viewDistance_Max) >= 6000)
			],
			[
				"8000",
				"setViewDistance 8000; setObjectViewDistance 3989;",
				"","","",-1,true,
				(GVAR(viewDistance_Max) >= 8000)
			],
			[
				"10000",
				"setViewDistance 10000; setObjectViewDistance 4890;",
				"","","",-1,true,
				(GVAR(viewDistance_Max) >= 10000)
			]
		]
	];
};

if (_menuName == "settings_grass") then {
	_menus pushBack [
		["settings_grass","Grass Settings", _menuRsc],
		[
			[
				"None",
				"setTerrainGrid 50;",
				"","","",-1,true,
				GVAR(Grass_allowDisable)
			],
			[
				"Low",
				"setTerrainGrid 25;",
				"","","",-1,true,true
			],
			[
				"Medium",
				"setTerrainGrid 12.5;",
				"","","",-1,true,true
			],
			[
				"High",
				"setTerrainGrid 6.25;",
				"","","",-1,true,true
			]
		]
	];
};

if (GVAR(STHud_Enabled)) then {	// New
	if (_menuName isEqualTo "settings_sthud") then {
		_menus pushBack [
			["settings_sthud","ST HUD", _menuRsc],
			[
				[
					"Display Mode >",
					"","","",
					[QUOTE(call FUNC(flexi_InteractSelfClient_Settings)),"settings_sthud_subMenu", 1]
				],
				["Toggle compass",{[] call FUNC(STHud_Toggle_Compass)}],
				["Restart HUD",{STHUD_UIMode = 3;}]
			]
		];
	};

	if (_menuName isEqualTo "settings_sthud_subMenu") then {
		_menus pushBack [
			["settings_sthud_subMenu","Display Mode", _menuRsc],
			[
				["Normal", { STHUD_UIMode = 3; } ],
				["Names only", { STHUD_UIMode = 2; } ],
				["HUD only", { STHUD_UIMode = 1; } ],
				["Off", { STHUD_UIMode = 0; } ]
			]
		];
	};
};

{
	if (((_x select 0) select 0) isEqualTo _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if ((count _menuDef) isEqualTo 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName isEqualTo "") then {_this}else{""},__FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};
_menuDef
