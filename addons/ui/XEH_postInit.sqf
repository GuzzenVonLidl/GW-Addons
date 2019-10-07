#include "script_Component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

if !(hasInterface) exitWith {false};

[QGVARMAIN(playerReady), {
	["GW","show_nametags_key", "Show NameTags", {
		if (GVAR(nameTags) isEqualTo 2) then {
			GVAR(showNameTags) = true;
		} else {
			GVAR(showNameTags) = false;
		};
		false
	}, {
		GVAR(showNameTags) = false;
		false
	}, [DIK_TAB, [false, false, false]], false] call CBA_fnc_addKeybind;

	if (GVARMAIN(mod_ACE3) && (GVAR(nameTags) > 0)) then {
		["ace_nametags_showPlayerNames", 0, true, "client", true] call CBA_settings_fnc_set;
		ace_nametags_showPlayerNames = 0;
	};

	addMissionEventHandler ["EntityRespawned",{
		params ["_entity", "_corpse"];

		if (GVAR(allowSpectator)) then {
			if ([player] call FUNC(canOpenSpectator)) then {
				GVAR(spectate) = true;
				[{!([player] call FUNC(canOpenSpectator))}, {
					GVAR(spectate) = false;
				}, []] call CBA_fnc_waitUntilAndExecute;
			};
		};
	}];
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(pauseMenuOpened), {
	params ["_display"];
	if (["IsSpectating"] call BIS_fnc_EGSpectator) then {
		_ctrlAbort = _display displayctrl 104;
		_ctrlAbort ctrlshow false;
		_ctrlAbortNew = _display ctrlcreate ["RscButtonMenuCancel",2];
		_ctrlAbortNew ctrlsetposition ctrlposition _ctrlAbort;
		_ctrlAbortNew ctrlcommit 0;
		_ctrlAbortNew ctrlsettext "Close (Spectator Mode)";
		_ctrlAbortNew ctrladdeventhandler ["buttonclick", {
			(findDisplay 49) closeDisplay 0;
			['Terminate'] call BIS_fnc_EGSpectator;
		}];
	} else {
		if (GVAR(allowSpectator) && GVAR(spectate)) then {
			private _size = 0.3;
			private _width = (_size + 0.5) * safezoneW;
			private _height = _size * safezoneH * (getResolution#4);

			private _button = _display ctrlCreate ["RscButtonMenu", -1];
			_button ctrlSetPosition [
				(1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)),
				(9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY),
				(15 * (((safezoneW / safezoneH) min 1.2) / 40)),
				(1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))
			];
			_button ctrlCommit 0;
			_button ctrlSetBackgroundColor [0.3,0.3,0.3,1];
			_button ctrlSetText "Open Spectator Mode";
			_button buttonSetAction "(findDisplay 49) closeDisplay 0; [{ ['Initialize', [player]] call BIS_fnc_EGSpectator; }, [], 0.1] call CBA_fnc_waitAndExecute;";
			_button ctrlShow true;
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(pauseMenuClosed), {
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(SpectatorOpened), {
	["OnSwitchFocusClicked", [true]] call (uiNamespace getVariable ["RscDisplayEGSpectator_script", {}]);
	["SetCameraMode", ["follow"]] call BIS_fnc_EGSpectatorCamera;
	BIS_EGSpectator_allowFreeCamera = false;
/*
	if (EGVAR(Menu,STHud_EnabledOld)) then {
		0 call fn_sthud_usermenu_changeMode;
	};
	if (EGVAR(Menu,STHud_Enabled)) then {
		STHUD_UIMode = 0;
	};
*/
	if (isMultiplayer) then {
		BIS_EGSpectator_allowAiSwitch = false;
		BIS_EGSpectator_allow3PPCamera = true;
	};
}] call CBA_fnc_addEventHandler;
