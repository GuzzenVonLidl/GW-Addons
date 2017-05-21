/*
	AUTHOR: GuzzenVonLidl, Taken from BI
	Gets the location of where the right click happend and then filters it to ground level

	Usage:
	[] call GW_3DEN_fnc_doAction

	Parameters: None

	Return Value: <Array>
	Location of where the right click happend

	Public: NO
*/
#include "script_component.hpp"

params ["_case","_value"];
private "_type";


switch (_case) do {
	case 0: { // Get relative location of obj 2 from obj 1
		_type = ((get3DENSelected "object") select 0) worldToModel (position ((get3DENSelected "object") select 1));
	};
	case 1: { // Unit Count
		_type = "derp";
	};
};

systemChat str _type;
copyToClipboard str _type;
