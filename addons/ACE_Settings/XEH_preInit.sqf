#include "script_component.hpp"

#include "XEH_PREP.sqf"

[QGVAR(treatmentAdvanced_CPRLocal), {
	_this call (treatmentAdvanced_CPRLocal);
}] call CBA_fnc_addEventHandler;

[QGVAR(fullHeal), {
	params ["_unit"];
	_unit setVariable ["ACE_medical_pain", 0, true];
	_unit setVariable ["ACE_medical_morphine", 0, true];
	_unit setVariable ["ACE_medical_bloodVolume", 100, true];
	_unit setVariable ["ACE_medical_tourniquets", [0,0,0,0,0,0], true];
	_unit setVariable ["ACE_medical_openWounds", [], true];
	_unit setVariable ["ACE_medical_bandagedWounds", [], true];
	_unit setVariable ["ACE_medical_internalWounds", [], true];
	_unit setVariable ["ACE_medical_lastUniqueWoundID", 1, true];
	_unit setVariable ["ACE_medical_heartRate", 80];
	_unit setVariable ["ACE_medical_heartRateAdjustments", []];
	_unit setVariable ["ACE_medical_bloodPressure", [80, 120]];
	_unit setVariable ["ACE_medical_peripheralResistance", 100];
	_unit setVariable ["ACE_medical_fractures", [], true];
	_unit setVariable ["ACE_medical_triageLevel", 0, true];
	_unit setVariable ["ACE_medical_triageCard", [], true];
	_unit setVariable ["ACE_medical_salineIVVolume", 0, true];
	_unit setVariable ["ACE_medical_plasmaIVVolume", 0, true];
	_unit setVariable ["ACE_medical_bloodIVVolume", 0, true];
	_unit setVariable ["ACE_medical_bodyPartStatus", [0,0,0,0,0,0], true];
	_unit setVariable ["ACE_medical_airwayStatus", 100];
	_unit setVariable ["ACE_medical_airwayOccluded", false];
	_unit setVariable ["ACE_medical_airwayCollapsed", false];
	_unit setVariable ["ACE_medical_addedToUnitLoop", false, true];
	_unit setVariable ["ACE_medical_inCardiacArrest", false, true];
	_unit setVariable ["ACE_isUnconscious", false, true];
	_unit setVariable ["ACE_medical_hasLostBlood", 0, true];
	_unit setVariable ["ACE_medical_isBleeding", false, true];
	_unit setVariable ["ACE_medical_hasPain", false, true];
	_unit setVariable ["ACE_medical_painSuppress", 0, true];
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
