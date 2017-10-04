/*

	[] call GW_3DEN_fnc_iNil

	_return = true;
	{
		if (GW_3den_ToolsItem in _x) then {
			_return = false;
		};
	} count all3DENEntities;

	_return
*/
#include "script_component.hpp"

params ["_entity"];

([_entity] call FUNC(getTool)) isEqualTo []
