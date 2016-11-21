/*

	[] call GW_3DEN_fnc_setAttribute

*/
#include "script_component.hpp"

params ["_case","_value"];
private "_type";

{
	switch (_case) do {
		case 1: {
			_x set3DENAttribute ["enableSimulation", _value];
			_type = "enableSimulation";
		};
		case 2: {
			_x set3DENAttribute ["allowDamage", _value];
			_type = "allowDamage";
		};
		case 3: {
			_x set3DENAttribute ["hideObject", _value];
			_type = "hideObject";
		};
		case 4: {
			_x set3DENAttribute ["objectIsSimple", _value];
			_type = "objectIsSimple";
		};
		case 5: {
			_x set3DENAttribute ["UnitPos", _value];
			_type = "UnitPos";
		};
	};
} forEach (get3DENSelected "object");

if !((count (get3DENSelected "object")) isEqualTo 0) then {
	if (_type isEqualTo "UnitPos") then {
		private "_stance";
		switch (_value) do {
			case 0: {
				_stance = "Up";
			};
			case 1: {
				_stance = "Middle";
			};
			case 2: {
				_stance = "Down";
			};
			case 3: {
				_stance = "Auto";
			};
		};
		_value = _stance;
	};
	systemChat format ["Command: %1 changed to %2", _type, _value];
};
