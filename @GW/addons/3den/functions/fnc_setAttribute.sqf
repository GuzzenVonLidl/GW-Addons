/*

	[] call GW_3DEN_fnc_setAttribute

*/
#include "script_component.hpp"

params ["_case","_value"];
{
	switch (_case) do {
		case 1: {
			_x set3DENAttribute ["enableSimulation", _value];
		};
		case 2: {
			_x set3DENAttribute ["allowDamage", _value];
		};
		case 3: {
			_x set3DENAttribute ["hideObject", _value];
		};
	};
} forEach (get3DENSelected "object");
