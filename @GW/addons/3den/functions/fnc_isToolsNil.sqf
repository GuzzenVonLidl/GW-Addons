/*

	[] call GW_3DEN_fnc_isToolsNil

	_return = true;
	{
		if (GW_3den_ToolsItem in _x) then {
			_return = false;
		};
	} count all3DENEntities;

	_return
*/
#include "script_component.hpp"

(call GW_3DEN_fnc_getTool) isEqualTo []
