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

private _allmenus = [
	[
		"<t color='#B22400'>Parachute Jump </t>",
		{ [player] call GW_Menu_fnc_doParadrop },
		QPATHTOF(DATA\parachute_icon.paa),
		"","",-1,true,
		(!(isNull (objectParent player)) && (getPosATL (vehicle player) select 2 > GVAR(ParadropHaloHeight)))
	],
	[
		"<t color='#DF9100'>Player Menu ></t>",
		"","","",
		[QUOTE(call FUNC(flexi_InteractSelf)),"actions", 1]
	],
	[
		"<t color='#1C4ED6'>Settings ></t>",
		"","","",
		[QUOTE(call FUNC(flexi_InteractSelf_Settings)),"settings_main", 1]
	],
	[
		"Eject",
		{
			player action ["Eject", (Vehicle player)];
			moveOut player;
		},
		"","","",-1,true,
		!(isNull (objectParent player))
	]
];

if !(isNil QEGVAR(miscSettings,FlexiMenu)) then {
	_allmenus = _allmenus + EGVAR(miscSettings,FlexiMenu);
};

private _menuDef = [];
private _menus = [
	[
		["main", "Player Menu", _menuRsc],
		_allmenus
	]
];

if (_menuName isEqualTo "actions") then {
	_menus pushBack [
		["actions","Player Actions", _menuRsc],
		[
			[
				"Fix SW Radio", {
					_radio = (call TFAR_fnc_activeSwRadio);
					[_radio, 1, "10"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 2, "20"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 3, "30"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 4, "40"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 5, "50"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 6, "50.1"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 7, "50.2"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 8, "50.3"] call TFAR_fnc_SetChannelFrequency;
					[(_radio select 0), (_radio select 1), 6] call TFAR_fnc_setLrChannel;
					[(_radio select 0), (_radio select 1), 5] call TFAR_fnc_setLrVolume;
					titleText ["Radio Frencency Reset!", "PLAIN DOWN"];
				},"","","",-1,true, !((call TFAR_fnc_activeSwRadio) isEqualTo "")
			],
			[
				"Fix LR Radio", {
					_radio = (call TFAR_fnc_activeLrRadio);
					[_radio, 1, "10"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 2, "20"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 3, "30"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 4, "40"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 5, "50"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 6, "50.1"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 7, "50.2"] call TFAR_fnc_SetChannelFrequency;
					[_radio, 8, "50.3"] call TFAR_fnc_SetChannelFrequency;
					[(_radio select 0), (_radio select 1), 6] call TFAR_fnc_setLrChannel;
					[(_radio select 0), (_radio select 1), 5] call TFAR_fnc_setLrVolume;
					titleText ["Radio Frencency Reset!", "PLAIN DOWN"];
				},"","","",-1,true, !((call TFAR_fnc_activeLrRadio) isEqualTo "")
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
