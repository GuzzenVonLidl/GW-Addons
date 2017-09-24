/*
	Author: GuzzenVonLidl
	Calculates if its day or night

	Usage:
	[] call GW_Common_Fnc_isNightSoon;

	Arguments:
	#1:	BOOL - True Return only if its night time, False Returns if its dawn, dusk or night

	Return Value: BOOL

	Public: NO
*/
#include "script_Component.hpp"

([] call BIS_fnc_sunriseSunsetTime) params ["_sunRise","_sunSet"];
private _sunAngle = (call FUNC(getSunAngle));
private _sunLimit = 10;
private _night = false;

If (((_sunAngle < _sunRise) && (dayTime < 12)) || ((_sunAngle < (_sunSet + _sunLimit)) && dayTime > 12)) then {
	_night = true;
};

_night
