#include "script_component.hpp"

if (!GVARMAIN(mod_ACE3)) exitWith {false};

#include "XEH_PREP.sqf"
#include "initSettings.sqf"

ACE_MaxWeightDrag = 100000;
ACE_MaxWeightCarry = 10000;

/*
["CBA_beforeSettingsInitialized", {
	QGVAR(updateMedical) call CBA_fnc_localEvent;
	QGVAR(updateRevive) call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
*/

["AllVehicles", "init", {
	params [
		"_veh"
	];

	if (_veh isKindOf "CAManBase") exitWith {false};
	_vehType = (configFile >> 'CfgVehicles' >> (typeOf _veh));
	if !(getNumber(_vehType >> "ACE_Cargo_hasCargo") isEqualTo 1) exitWith {false};
//	if !((_veh getVariable ["ACE_Cargo_space", 0]) isEqualTo getNumber(_vehType >> "ACE_Cargo_space")) exitWith {false};

	_size = 0;
	{
		_size = _size + ([_x] call ACE_Cargo_fnc_getSizeItem);
	} forEach (_veh getVariable ["ACE_Cargo_loaded", []]);

	if !((([_veh] call ACE_Cargo_fnc_getCargoSpaceLeft) + _size) isEqualTo getNumber(_vehType >> "ACE_Cargo_space")) exitWith {false};

	private _space = 0;

	if (_veh isKindOf "Boat_F") then {_space = 4;};

	if (_veh isKindOf "Land") then {
		if (_veh isKindOf "Car_F") then {_space = 6;};
		if (_veh isKindOf "Truck_F") then {_space = 24;};
		if (_veh isKindOf "Wheeled_APC_F") then {_space = 8;};
		if (_veh isKindOf "Tank_F") then {_space = 2;};
	};

	if (_veh isKindOf "Air") then {
		(boundingBoxReal _veh) params ["_p1","_p2"];
		_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
		if (_veh isKindOf "Helicopter") then {
			_space = 2;
			if (_maxHeight >= 4.5) then {
				_space = 12;
			};
			if (_maxHeight > 6.5) then {
				_space = 40;
			};
		};

		if (_veh isKindOf "Plane") then {
			if (_maxHeight >= 7) then {	// Hopfully its a cargo plane
				_space = 50;
			};

		};
	};

	[_veh, _space] call ace_cargo_fnc_setSpace;
}, true, [], true] call CBA_fnc_addClassEventHandler;

["CBA_settingsInitializedDelayed", {
	private _configList = "";
	if (GVARMAIN(mod_ACE3_Med_New)) then {
		_configList = (preprocessFile "x\gw\addons\ACE_Settings\Settings\medical_new.sqf");
	} else {
//		_configList = (preprocessFile "x\gw\addons\ACE_Settings\Settings\medical_Legacy_basic.sqf");
		if (EGVAR(settings_ACE,medical_level) isEqualTo 2) then {
			_configList = (preprocessFile "x\gw\addons\ACE_Settings\Settings\medical_Legacy_adv.sqf");
		};
	};

	if !(_configList isEqualTo "") then {
		{
			_x params ["_setting", "_value", "_priority"];
			[_setting, _value, _priority, "server"] call CBA_settings_fnc_set;
			["CBA_settings_refreshSetting", _setting] call CBA_fnc_localEvent;
		} forEach ([_configList, false] call CBA_settings_fnc_parse);
	};
}] call CBA_fnc_addEventHandler;

["ace_unconscious", {
	params [["_unit", objNull],["_state", false]];
	if (GVAR(unconscious) isEqualTo 0) exitWith {false};
	if ((GVAR(unconscious) isEqualTo 2) && !(isPlayer _unit)) exitWith {false};
	if ((isNull (objectParent _unit)) && (!([_unit] call ace_medical_fnc_isBeingCarried) && !([_unit] call ace_medical_fnc_isBeingDragged))) then {
		_unit setUnconscious _state;
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(missionStarted), {
	"CIV_IDAP_F" call ace_dogtags_fnc_disableFactionDogtags;
}] call CBA_fnc_addEventHandler;

/*
	if (GVARMAIN(mod_ACE3_Med_New)) then {
	} else {
		_str = "";
		if (EGVAR(settings_ACE,revive) isEqualTo 0) then {
			_str = "
				force ace_medical_enableRevive = 0;
				force ace_medical_amountOfReviveLives = -1;
			";
		} else {
			_str = format ["
				force ace_medical_enableRevive = 1;
				force ace_medical_amountOfReviveLives = %1;
			",  ([-1,1] select (EGVAR(settings_ACE,revive) isEqualTo 2))];
		};
		[_str] call GW_Common_Fnc_loadSettingsFile;

		["CBA_settings_refreshSetting", "ace_medical_enableRevive"] call CBA_fnc_localEvent;
		["CBA_settings_refreshSetting", "ace_medical_amountOfReviveLives"] call CBA_fnc_localEvent;
	};
*/