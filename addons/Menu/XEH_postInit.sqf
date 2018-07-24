#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[QGVAR(settings), {
	params ["_type"];
	if (hasInterface) then {
		switch (toLower(_type)) do {
			case "save": {
				// Remove Old Saves -->
					if !(isNil {(profileNamespace getVariable "GOL_Client_Settings")}) then {
						profileNamespace setVariable ["GOL_Client_Settings", nil];
					};
					if !(isNil {(profileNamespace getVariable QGVAR(clientSettings))}) then {
						profileNamespace setVariable [QGVAR(clientSettings), nil];
					};
					if !(isNil {(profileNamespace getVariable QGVAR(clientSettingsV2))}) then {
						profileNamespace setVariable [QGVAR(clientSettings), nil];
					};
				// <--

				if (GVAR(STHud_Enabled)) then {
					profileNamespace setVariable [QGVAR(clientSettingsV3), [[viewDistance, getTerrainGrid, getObjectViewDistance], [STHUD_UIMode, GVAR(Toggle_STHud_Compass)]]];
				} else {
					profileNamespace setVariable [QGVAR(clientSettingsV3), [[viewDistance, getTerrainGrid, getObjectViewDistance], [ST_STHud_ShownUI, ST_STHud_ShowCompass]]];
				};
//				saveProfileNamespace;
			};

			case "load": {
				(profileNamespace getVariable QGVAR(clientSettingsV3)) params ["_profilePerf","_profileUI"];
				_profilePerf params ["_view","_terrain","_objects"];

				if (GVAR(viewDistance_Enabled)) then {
					if (GVAR(viewDistance_Default) isEqualTo 0) then {
						setViewDistance _view;
						if (!isNil "_objects") then {
							setObjectViewDistance _objects;
						};
					} else {
						setViewDistance GVAR(viewDistance_Default);
						setObjectViewDistance GVAR(viewObjectDistance_Default);
					};
				};
				if (GVAR(Grass_Enabled)) then {
					setTerrainGrid _terrain;
				};

				if !(_profileUI isEqualTo []) then {
					_profileUI params ["_uiMode","_enableHud"];
					if (GVAR(STHud_EnabledOld)) then {
						ST_STHud_ShowCompass = _enableHud;
						_uiMode call fn_sthud_usermenu_changeMode;
					};
					if (GVAR(STHud_Enabled)) then {
						STHUD_UIMode = _uiMode;
						[_enableHud] call FUNC(STHud_Toggle_Compass);
					};
				};
			};
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(paradropMode), {
	params ["_enable"];
	if (_enable) then {
		GVAR(ParadropHalo) = true;
		publicVariable QGVAR(ParadropHalo);
	} else {
		GVAR(ParadropHalo) = false;
		publicVariable QGVAR(ParadropHalo);
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(createZeus), {
	params ["_unit"];

	private _LogicCenter = createCenter sideLogic;
	private _moduleGroup = createGroup _LogicCenter;
	private _ZeuzModule = _moduleGroup createUnit ["ModuleCurator_F",[0,0,0],[],0,"NONE"];
	_ZeuzModule setVariable ["Owner", (str _unit), true];
	_ZeuzModule setVariable ["Name", format ["_%1", _unit], true];
	_ZeuzModule setVariable ["Addons", 3, true];
	_ZeuzModule setVariable ["Forced", 0, true];
	_ZeuzModule setVariable ["birdType", "", true];
	_ZeuzModule setVariable ["showNotification", false, true];
	_ZeuzModule setCuratorWaypointCost 0;
	{
		_ZeuzModule setCuratorCoef [_x,0];
	} forEach ["place","edit","delete","destroy","group","synchronize"];
	_unit assignCurator _ZeuzModule;
	{
		[_x] call GW_Common_Fnc_addToCurators;
	} forEach (allUnits + vehicles);
}] call CBA_fnc_addEventHandler;

[QGVAR(removeZeus), {
	params ["_unit"];
	private _zeus = (getAssignedCuratorLogic _unit);
	unassignCurator _zeus;
	deleteVehicle _zeus;
}] call CBA_fnc_addEventHandler;

[QGVAR(spawnBox), {
	params ["_type","_class","_unit"];

	_box = createVehicle [_class, [0,0,0], [], 0, "NONE"];
	_box setPos (_unit getRelPos [3, 0]);
	[_box, [_type, toLower(str(side _unit)), true]] call GW_Gear_Fnc_Handler;
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
	//	[DIK code, [Shift, Ctrl, Alt]]
	[QUOTE(PREFIX),"flexi_InteractSelfClient", "Client Menu", {[1] call FUNC(flexi_selectMenu);}, {}, [DIK_RWIN,[false,false,false]]] call CBA_fnc_addKeybind;
	[QUOTE(PREFIX),"flexi_InteractSelfAdmin", "Admin Menu", {[2] call FUNC(flexi_selectMenu);}, {}, [DIK_INSERT,[true,false,true]]] call CBA_fnc_addKeybind;

	[{
		if (isNil {profileNamespace getVariable QGVAR(clientSettingsV3)}) then {
			[QGVAR(settings), "save"] call CBA_fnc_localEvent;
		} else {
			[QGVAR(settings), "load"] call CBA_fnc_localEvent;
		};
	}, [], 3] call CBA_fnc_waitAndExecute;

//	#include "XEH_extra_UC.sqf"
};
