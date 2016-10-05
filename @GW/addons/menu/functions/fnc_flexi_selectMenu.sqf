#include "script_component.hpp"

params ["_type"];

(findDisplay 49) closeDisplay 0;

switch (_type) do {
	case 1: {
		["player",[],100, [QUOTE(call FUNC(flexi_InteractSelfClient)),"main"]] call cba_fnc_fleximenu_openMenuByDef;
	};
	case 2: {
		if (GVARMAIN(isAdmin) || (serverCommandAvailable "#logout")) then {
			["player",[],100, [QUOTE(call FUNC(flexi_InteractSelfAdmin)),"main"]] call cba_fnc_fleximenu_openMenuByDef;
		};
	};
	case 3: {
		if (GVARMAIN(isAdmin) || (serverCommandAvailable "#logout")) then {
			['keyDown', [findDisplay 49,59], ''] execVM 'a3\ui_f\scripts\GUI\RscDisplayInterrupt.sqf';
		};
	};

	default {
	};
};
