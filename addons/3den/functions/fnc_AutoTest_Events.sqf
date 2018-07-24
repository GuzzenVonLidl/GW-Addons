#include "script_Component.hpp"

params ["_control", ["_index", -1]];

if ((_index >= (count GVAR(AutoTestEvents))) || ((_control lbText _index) isEqualTo "")) exitWith {
	_control lbSetCurSel -1;
	false
};

(GVAR(AutoTestEvents) select _index) params [["_event", -1], ["_var", ""]];

switch (_event) do {
	case 1: {
		systemChat "Event: Mission Binarize";
		edit3DENMissionAttributes "Scenario";
	};
	case 2: {
		systemChat "Event: Time of day";
		edit3DENMissionAttributes "Intel";
	};
	case 3: {
		systemChat "Event: Move To Marker";
		_marker = (((all3DENEntities select 5) select {!((_x find _var) isEqualTo -1)}) select 0);
		_pos = ((_marker get3DENAttribute "position") select 0);
		move3DENCamera [[(_pos select 0), (_pos select 1), 50], true];
		if ((get3DENActionState "ToggleMap") isEqualTo 0) then {
			do3DENAction "ToggleMap";
		};
	};
	case 4: {
		systemChat "Event: Focus on Object";
		_pos = ((_var get3DENAttribute "position") select 0);
		move3DENCamera [[(_pos select 0), (_pos select 1), 10], true];
	};
	case 5: {
	};
};
