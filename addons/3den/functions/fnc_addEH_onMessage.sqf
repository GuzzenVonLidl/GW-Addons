#include "script_component.hpp"

params ["_switch"];

switch (_switch) do {
	case 0: {	//	Mission saved
		if (isClass(missionConfigFile >> "GW_FRAMEWORK") && is3DEN && !("GW_MissionPreferences" get3DENMissionAttribute "GW_isConfigured")) then {
			[] call EFUNC(Common,setEditor);	// Configures Settings
			[] call EFUNC(Common,setFramework);	// Reset Addons Option Settings
//			[] call EFUNC(Common,setName);		//

			["mission"] call CBA_settings_fnc_clear;
			["server"] call CBA_settings_fnc_clear;
//			["client"] call CBA_settings_fnc_clear;

			"GW_MissionPreferences" set3DENMissionAttribute ["GW_isConfigured", true];
			LOG("fnc_addEH_onMessage: GW_isConfigured");

			[QGVAR(updateNewCopy), []] call CBA_fnc_localEvent;
		};
	};
	case 1: {	//	Mission autosaved
	};
	case 2: {	//	Trying to move a character into full vehicle
	};
	case 3: {	//	Moved character into enemy vehicle
	};
	case 4: {	//	Trying to run mission without any player
	};
	case 5: {	//	Mission exported to SP
	};
	case 6: {	//	Mission exported to MP
		if (call EFUNC(Common,isDevBuild)) then {
			['Warning debug mode is enabled','I understand'] call BIS_fnc_3DENShowMessage;
		};
	};
	case 7: {	//	Attempting to delete a default layer
	};
	default {
		diag_log str _this;
	};
};
