/*
	Author: GuzzenVonLidl
	Synchronise unit, vehicles & objects with all curators in mission
	Puts a delay of 1 frame for better performance

	Usage:
	[] call GW_Common_Fnc_canUseAddonVersion;

	Arguments:
	0: Unit <OBJECT>

	Return Value: NO

	Public: NO
*/
#include "script_Component.hpp"

((getNumber (missionConfigFile >> "GW_Modules" >> "Common" >> "version")) >= 1.6)
