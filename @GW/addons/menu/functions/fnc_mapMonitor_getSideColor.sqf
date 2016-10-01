//	REFRENCE: \x\gw\addons\menu\functions\fnc_mapMonitor_handler
#include "script_component.hpp"

switch (_this select 0) do {
		case WEST: {"ColorBlue"};
		case EAST: {"ColorRed"};
		case RESISTANCE: {"ColorGreen"};
		default {"ColorOrange"};
};