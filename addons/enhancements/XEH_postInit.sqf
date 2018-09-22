#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

if (hasInterface) then {
	[{
		["GW","GW_switchAttachment", "Toggle Flashlight", {_this spawn FUNC(switchAttachment)}, {}, [DIK_L, [true, false, false]]] call CBA_fnc_addKeybind;
	}, []] call CBA_fnc_execNextFrame;
};
