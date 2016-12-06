#include "script_component.hpp"

if ((["GW_Modules", "Common", "version"] call BIS_fnc_getCfgData) < 1.1) then {
	_this call FUNC(copyOld);
} else {
	_this call FUNC(copy);
};
