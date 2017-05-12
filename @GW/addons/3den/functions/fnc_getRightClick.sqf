/*
	AUTHOR: GuzzenVonLidl, Taken from BI
	Gets the location of where the right click happend and then filters it to ground level

	Usage:
	[] call GW_3DEN_fnc_getObjetsToHide

	Parameters: None

	Return Value: <Array>
	Location of where the right click happend

	Public: NO
*/
#include "script_component.hpp"

if (is3DEN) then {
	private _input = uinamespace getvariable ["bis_fnc_3DENEntityMenu_data",[]];
	private _pos = _input param [0,[]];

	_pos set [2,0];
	private _entity = _input param [1,nil];
	if !(isnil "_entity") then {
		_pos = switch true do {
			case (_entity isequaltype grpnull): {(leader _entity get3DENAttribute "position") select 0};
			case (_entity isequaltype ""): {_pos = (_entity get3DENAttribute "position") select 0; _pos resize 2; _pos};
			default {(_entity get3DENAttribute "position") select 0};
		};
	};
	_pos
} else {
	[0,0,0]
};
