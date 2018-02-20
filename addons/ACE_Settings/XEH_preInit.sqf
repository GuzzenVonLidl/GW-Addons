#include "script_component.hpp"

#include "XEH_PREP.sqf"

[QGVAR(treatmentAdvanced_CPRLocal), {
	_this call (treatmentAdvanced_CPRLocal);
}] call CBA_fnc_addEventHandler;

[QGVAR(fullHeal), {
	params ["_unit"];
	[_unit, _unit] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
}] call CBA_fnc_addEventHandler;

["kill", {
	if (GVARMAIN(isAdmin)) then {
		params ["_name"];
		private _unit = _name call EFUNC(Common,findMatch);
		_unit setDamage 1;
	};
}, "all"] call CBA_fnc_registerChatCommand;

["healPlayer", {
	if (GVARMAIN(isAdmin)) then {
		params ["_name"];
		private _unit = _name call EFUNC(Common,findMatch);
		[QGVAR(fullHeal), _unit] call CBA_fnc_localEvent;
		_unit setDamage 0;
	};
}, "all"] call CBA_fnc_registerChatCommand;

["healTarget", {
	if (GVARMAIN(isAdmin)) then {
		params ["_name"];
		private _unit = _name call EFUNC(Common,findMatch);
		[QGVAR(fullHeal), _unit, _unit] call CBA_fnc_targetEvent;
	};
}, "all"] call CBA_fnc_registerChatCommand;
