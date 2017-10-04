/*

	[] call GW_3DEN_fnc_getTool

*/
#include "script_component.hpp"

params [["_entity", "GW_3den_ToolsItem"]];

((all3DENEntities select 0) + (all3DENEntities select 2) + (all3DENEntities select 3)) select {
	if (((_x get3DENAttribute "name") select 0) isEqualTo _entity) exitWith {
		_x
	};
};
