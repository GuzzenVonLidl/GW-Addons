#include "script_component.hpp"

params ["_type"];

(findDisplay 49) closeDisplay 0;

private _isAdmin = (GVARMAIN(isAdmin) || (serverCommandAvailable "#logout"));

switch (_type) do {
	case 1: {
		["player",[],100, [QUOTE(call FUNC(flexi_InteractSelfClient)),"main"]] call cba_fnc_fleximenu_openMenuByDef;
	};
	case 2: {
		if (_isAdmin) then {
			["player",[],100, [QUOTE(call FUNC(flexi_InteractSelfAdmin)),"main"]] call cba_fnc_fleximenu_openMenuByDef;
		};
	};
	case 3: {
		if (_isAdmin) then {
			['keyDown', [findDisplay 49,59], ''] execVM 'a3\ui_f\scripts\GUI\RscDisplayInterrupt.sqf';
		};
	};

	default {
	};
};
