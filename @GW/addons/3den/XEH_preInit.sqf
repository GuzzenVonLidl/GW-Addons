#include "script_component.hpp"

#include "XEH_PREP.sqf"

if (is3DEN) then {
	setViewDistance 5000;
	setObjectViewDistance [4500, 100];
};

GVAR(objectsToHide) = [];
GVAR(objectsToShow) = [];
