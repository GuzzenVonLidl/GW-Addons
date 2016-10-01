#include "script_component.hpp"

ADDON = false;

GVAR(attachmentList) = [
	["GW_X3000", "acc_pointer_IR"],
	["GVL_X2000_point", "GVL_X2000_wide"]
];

#include "XEH_PREP.sqf"

ADDON = true;

/*

GW_enhancements_attachmentList = [
	["GW_X3000_point", "acc_pointer_IR"],
	["GVL_X2000_point", "GVL_X2000_wide"]
];

[] call GW_enhancements_fnc_switchAttachment
*/
