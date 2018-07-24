#include "script_component.hpp"

params ["_switch"];

switch (_switch) do {
	case 0: {	//	Mission saved
		if (isClass(missionConfigFile >> "GW_FRAMEWORK") && is3DEN) then {
			if !("GW_MissionPreferences" get3DENMissionAttribute "GW_isConfigured") then {
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
			if (!("GW_MissionPreferences" get3DENMissionAttribute "GW_isConfigured_ACE") && GVARMAIN(mod_ACE3)) then {
				if !(([getText(configFile >> "CfgPatches" >> "ACE_main" >> "version"), 0, 3] call BIS_fnc_trimString) isEqualTo "3.11") then {	// No CBA Settings
					[] call GW_ACE_Settings_fnc_setConfigs;
				};
				"GW_MissionPreferences" set3DENMissionAttribute ["GW_isConfigured_ACE", true];
			};
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
		if ((getNumber (missionConfigFile >> "GW_FRAMEWORK" >> "Core" >> "version")) >= 0.7) then {
			edit3DENMissionAttributes 'GW_MissionPreferences';
			if !(GVAR(ExportErrorCount) isEqualTo 0) then {
				["Errors needs to be fixed before uploading the final version of this mission", 1, 15, true] call BIS_fnc_3DENNotification;
//				GVAR(ExportErrorCount) = 0;
			};
		} else {
			if (call EFUNC(Common,isDevBuild)) then {
				['Warning debug mode is enabled','I understand'] call BIS_fnc_3DENShowMessage;
			} else {
				if (isClass(missionConfigFile >> "GW_Modules" >> "MHQ")) then {
					_error = false;
					{
						if ((((_x get3DENAttribute "name") select 0) find "mhq") isEqualTo 0) then {
							if !((([configfile >> "CfgVehicles" >> ((_x get3DENAttribute "ItemClass") select 0), true] call BIS_fnc_returnParents) find "Kart_01_Base_F") isEqualTo -1) then {
								_error = true;
							};
						};
					} forEach (all3DENEntities select 0);

					if (_error) then {
						_title = "MHQ Warning";
						_text = "MHQ is currently a GO-Kart, Please change this so it wont break immersion";
						if !(profileNameSteam find ".Chris" isEqualTo -1) then {
							_text = "MHQ is currently a GO-Kart,                    Chris you lazy bastard fix this right now!      While your at it, Change the time of day and weather";
						};
						[_text,_title] call BIS_fnc_3DENShowMessage;
					};
					_error
				};
				if (isClass(missionConfigFile >> "GW_Modules" >> "Respawn")) then {
					if !("spectator" in (all3DENEntities select 5)) then {
						["Warning Spectator marker is missing, Create a new marker and name it 'spectator', place it on land and out of AO",'I understand'] call BIS_fnc_3DENShowMessage;
					};
				};
			};
		};
	};
	case 7: {	//	Attempting to delete a default layer
	};
	default {
		diag_log str _this;
	};
};
