#include "script_component.hpp"

params ["_type"];

(findDisplay 49) closeDisplay 0;

switch (_type) do {
	case 1: {
		["player",[],100, [QUOTE(call FUNC(flexi_InteractSelfClient)),"main"]] call cba_fnc_fleximenu_openMenuByDef;
	};
	case 2: {
		if (ISADMIN) then {
			["player",[],100, [QUOTE(call FUNC(flexi_InteractSelfAdmin)),"main"]] call cba_fnc_fleximenu_openMenuByDef;
		};
	};
};
