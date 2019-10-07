#include "script_component.hpp"

if (FILE_EXISTS("Scripts\NEKY_ServiceStation\ServiceStation.sqf")) exitWith {
	LOG("NEKY ServiceStation found in mission, Stopping addon version");
	false
};

LOG("NEKY ServiceStation not found, using addon version instead");

#include "XEH_PREP.sqf"

NEKY_ServiceStationActive = [];
