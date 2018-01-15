#include "script_component.hpp"

if (hasInterface) then {
	[QUOTE(PREFIX),QGVAR(Eject), "Eject", {
		if (!(isNull (objectParent player))) then {
			_vehicle = (vehicle player);
			if ((driver _vehicle) isEqualTo player) then {
				_vehicle engineOn false;
			};
			player action ["Eject", _vehicle];
			moveOut player;
		};
	}, {}, [-1,[false,false,false]]] call CBA_fnc_addKeybind;
};

if (isServer && (call FUNC(canUseAddonVersion))) then {
	[{
		["AllVehicles", "init", {
			[{
				_this call FUNC(addToCurators);
			}, _this] call CBA_Fnc_execNextFrame;
		}, true, [], true] call CBA_fnc_addClassEventHandler;
	}, [], 1] call CBA_fnc_waitAndExecute;
};
