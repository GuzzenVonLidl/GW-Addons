/*
	Author: GuzzenVonLidl
	Calculates if its day or night

	Usage:
	[] call GW_Common_Fnc_isNight;

	Arguments:

	Return Value: BOOL

	Public: NO
*/
#include "script_Component.hpp"

private _sunAngle = (call FUNC(getSunAngle));
private _night = false;

If (_sunAngle < 0) then {
	_night = true;
};

_night
