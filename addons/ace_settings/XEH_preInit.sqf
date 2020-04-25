#include "script_component.hpp"

if (!GVARMAIN(mod_ACE3)) exitWith {false};

#include "XEH_PREP.sqf"
#include "initSettings.sqf"

ACE_MaxWeightDrag = 100000;
ACE_MaxWeightCarry = 10000;

/*
["CBA_settingsInitializedDelayed", {
	if (([QEGVAR(settings_ACE,medical_level), "mission"] call CBA_settings_fnc_get) != [QEGVAR(settings_ACE,medical_level), "server"] call CBA_settings_fnc_get) then {
		private _configList = "";
		if (GVARMAIN(mod_ACE3_Med_New)) then {
			_configList = (preprocessFile "x\gw\addons\ACE_Settings\Settings\medical.sqf");
		} else {
			if (EGVAR(settings_ACE,medical_level) isEqualTo 2) then {
				_configList = (preprocessFile "x\gw\addons\ACE_Settings\Settings\medical_Legacy_adv.sqf");
			} else {
				_configList = (preprocessFile "x\gw\addons\ACE_Settings\Settings\medical_Legacy.sqf");
			};
		};

		if !(_configList isEqualTo "") then {
			{
				_x params ["_setting", "_value", "_priority"];
				[_setting, _value, _priority, "server"] call CBA_settings_fnc_set;
				["CBA_settings_refreshSetting", _setting] call CBA_fnc_localEvent;
			} forEach ([_configList, false] call CBA_settings_fnc_parse);
		};
	};
}] call CBA_fnc_addEventHandler;
*/

["ace_settingChanged", {
	params ["_name","_value"];
	if (_name isEqualTo "ace_medical_painEffectType") then {
		if (ace_medical_painEffectType == 0) then {
			ace_medical_painCoefficient = (["ace_medical_painCoefficient", "priority"] call CBA_settings_fnc_get);
		} else {
			ace_medical_painCoefficient = (["ace_medical_painCoefficient", "priority"] call CBA_settings_fnc_get) * 0.7;
		};
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

	if (hasInterface) then {
		_action = ["QuickRepair","Quick Repair","",{
			[_target] call GW_Common_Fnc_quickRepair;
		},{
			_list = [];
			{
				if ((_x find "light") isEqualTo -1) then {
					_list pushBack _x;
				};
			} forEach ((getAllHitPointsDamage _target) select 0);

			(({(_target getHitPointDamage _x) >= 0.8} count (_list) > 0) && GW_Common_allowQuickRepair)
		}] call ace_interact_menu_fnc_createAction;

		{
			[_x, 0, ["ACE_MainActions"],_action, true] call ace_interact_menu_fnc_addActionToClass;
		} forEach ["Car","Quadbike_01_base_F","Kart_01_Base_F","Tank","Motorcycle","Helicopter","Plane","VTOL_01_base_F","VTOL_02_base_F","Ship_F"];


		if ((isClass(missionConfigFile >> "GW_FRAMEWORK")) && (getNumber(missionConfigFile >> "GW_FRAMEWORK" >> "Core" >> "Version") < 0.8)) then {
			// Quick and dirty hotfix for older missions to be updated
			[{
				player setVariable ["ACE_GForceCoef", 0.5];

				ace_nightvision_aimDownSightsBlur = 0;
				ace_nightvision_disableNVGsWithSights = false;
				ace_nightvision_effectScaling = 0.3;
				ace_nightvision_fogScaling = 0.1;
				ace_nightvision_noiseScaling = 0.1;
			}, [], 0.5] call CBA_fnc_waitAndExecute;
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(serverReady), {
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
}] call CBA_fnc_addEventHandler;
