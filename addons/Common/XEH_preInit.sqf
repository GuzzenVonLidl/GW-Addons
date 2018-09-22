#include "script_component.hpp"

#include "XEH_PREP.sqf"

// Get addon/mod/dlc availability from the A3 config file and store them in easy to use variables
GVARMAIN(DLC_Bundle) 	= isClass (configFile >> "CfgMods" >> "DLCBundle");
GVARMAIN(DLC_MarksMan) 	= isClass (configFile >> "CfgMods" >> "Mark");
GVARMAIN(DLC_Heli) 		= isClass (configFile >> "CfgMods" >> "Heli");

GVARMAIN(mod_ACE3) 			= isClass (configFile >> "CfgPatches" >> "ACE_Common");
GVARMAIN(mod_ACE3_Medical)	= isClass (configFile >> "CfgPatches" >> "ACE_Medical");
GVARMAIN(mod_ACRE) 			= isClass (configFile >> "CfgPatches" >> "ACRE_Main");
GVARMAIN(mod_AIA)	 		= isClass (configFile >> "CfgPatches" >> "AiA_Core");
GVARMAIN(mod_GW)			= isClass (configFile >> "CfgPatches" >> "GW_Main");
GVARMAIN(mod_CUP_TERRAINS)	= isClass (configFile >> "CfgPatches" >> "CUP_BaseConfig_F");
GVARMAIN(mod_CUP_WEAPONS)	= isClass (configFile >> "CfgPatches" >> "CUP_BaseConfig_F");
GVARMAIN(mod_CUP_VEHICLES)	= isClass (configFile >> "CfgPatches" >> "CUP_BaseConfig_F");
GVARMAIN(mod_CBA) 			= isClass (configFile >> "CfgPatches" >> "CBA_Main");
GVARMAIN(mod_CTAB) 			= isClass (configFile >> "CfgPatches" >> "cTab");
GVARMAIN(mod_RHS)	 		= isClass (configFile >> "CfgPatches" >> "rhsusf_main");
GVARMAIN(mod_TFAR) 			= isClass (configFile >> "CfgPatches" >> "Task_Force_Radio");
GVARMAIN(mod_TFAR_CORE) 	= isClass (configFile >> "CfgPatches" >> "TFAR_Core");

GVAR(HintInt) = 0;

if (isClass(missionConfigFile >> "GW_FRAMEWORK")) then {
	[] spawn {
		sleep 1;
		_list = [];
		{
			_list pushBackUnique ((CBA_settings_default getVariable _x) select 4)
		} forEach CBA_settings_allSettings;
		_list sort true;
		_index = (_list find "GW_Common");
	//	_index = (_list find "GW_Gear");
		if !((_list find "STR_ace_vehiclelock_DisplayName") isEqualTo -1) then {
			_index = _index + 1;
		};
		uiNamespace setVariable ["cba_settings_addonIndex", _index];
	};
};
