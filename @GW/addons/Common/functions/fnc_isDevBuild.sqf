/*
	Author: GuzzenVonLidl

	Usage:
	[] call GW_Common_fnc_isDevBuild

	Arguments:

	Return Value: <GROUP>
	is DevBuild active

	Public: Yes

*/
#include "script_Component.hpp"

(getMissionConfigValue ["GW_isDebug", false]) || (getNumber(missionConfigFile >> "GW_FRAMEWORK" >> "Core" >> "devBuild") isEqualTo -2)
