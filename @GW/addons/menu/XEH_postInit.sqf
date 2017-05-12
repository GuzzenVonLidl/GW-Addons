#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["CAManBase", "init", {
	[QGVAR(UnitCaching_addObject), (_this select 0)] call CBA_fnc_LocalEvent;
}, true, [], true] call CBA_fnc_addClassEventHandler;

["CAManBase", "KILLED", {
	[QGVAR(UnitCaching_removeObject), (_this select 0)] call CBA_fnc_LocalEvent;
	(_this select 0) enableSimulation true;
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QGVAR(settings), {
	params ["_type"];
	if (hasInterface) then {
		if !(isNil {(profileNamespace getVariable "GOL_Client_Settings")}) then {
			profileNamespace setVariable ["GOL_Client_Settings", nil];
		};
		if !(isNil {(profileNamespace getVariable QGVAR(clientSettings))}) then {
			profileNamespace setVariable [QGVAR(clientSettings), nil];
		};
		if !(isNil {(profileNamespace getVariable QGVAR(clientSettingsV2))}) then {
			profileNamespace setVariable [QGVAR(clientSettings), nil];
		};
		switch (toLower(_type)) do {
			case "save": {
				if (GVAR(STHud_Enabled)) then {
					profileNamespace setVariable [QGVAR(clientSettingsV3), [[viewDistance, getTerrainGrid], [STHUD_UIMode, !GVAR(Toggle_STHud_Compass)]]];
				} else {
					profileNamespace setVariable [QGVAR(clientSettingsV3), [[viewDistance, getTerrainGrid], []]];
				};
//				saveProfileNamespace;
			};

			case "load": {
				private _profile = (profileNamespace getVariable QGVAR(clientSettingsV3));
				private _profilePerf = (_profile select 0);
				private _profileUI = (_profile select 1);
				setViewDistance (_profilePerf select 0);
				setTerrainGrid (_profilePerf select 1);
				if (GVAR(STHud_Enabled) && !(_profileUI isEqualTo [])) then {
					STHUD_UIMode = (_profileUI select 0);
					[(_profileUI select 1)] call FUNC(STHud_Toggle_Compass);
				};
			};
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(DynamicViewDistance_enablePFH), {
	if ((hasInterface && !isServer) || !isMultiplayer) then {
		params ["_toggle"];
		if (_toggle) then {
			if (isNil QGVAR(DynamicViewDistance_PFH)) then {
				GVAR(DynamicViewDistance_PFH) = [{
					[] call FUNC(DynamicViewDistance_Handler);
				}, 0.1, []] call CBA_fnc_addPerFrameHandler;
			};
		} else {
			if !(isNil QGVAR(DynamicViewDistance_PFH)) then {
				[GVAR(DynamicViewDistance_PFH)] call CBA_fnc_removePerFrameHandler;
				GVAR(DynamicViewDistance_PFH) = nil;
			};
		};
		GVAR(DynamicViewDistance_Enabled) = _toggle;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_addObject), {
	if !(_this isKindOf "HeadlessClient_F") then {
		GVAR(UnitCaching_Objects) pushBackUnique _this;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_removeObject), {
	GVAR(UnitCaching_Objects) deleteAt (GVAR(UnitCaching_Objects) find _this);
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_requestUpdate), {
	params ["_object"];
	_object setPos (getPos _object);
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_toggleObject), {
	params ["_object","_toggle"];
	if (_toggle) then {
		GVAR(UnitCaching_currentDisabled) pushBack _object;
	} else {
		GVAR(UnitCaching_currentDisabled) deleteAt (GVAR(UnitCaching_currentDisabled) find _object);
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_enablePFH), {
	if ((hasInterface && !isServer) || !isMultiplayer) then {
		params ["_toggle"];
		if (_toggle) then {
			if (isNil QGVAR(UnitCaching_PFH)) then {
				GVAR(UnitCaching_PFH) = [{
					[] call FUNC(UnitCaching_Handler);
				}, 5, []] call CBA_fnc_addPerFrameHandler;
			};
		} else {
			if !(isNil QGVAR(UnitCaching_PFH)) then {
				[GVAR(UnitCaching_PFH)] call CBA_fnc_removePerFrameHandler;
				GVAR(UnitCaching_PFH) = nil;
			};
		};
		GVAR(UnitCaching_Enabled) = _toggle;
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
/*
	_LogicCenter = createCenter sideLogic;
	_moduleGroup = createGroup _LogicCenter;
	_ZeuzModule = _moduleGroup createUnit ["ModuleCurator_F",[0,0,0],[],0,"NONE"];
	_ZeuzModule setVariable ["Owner", "w1b1", true];
	_ZeuzModule setVariable ["Name", "Zeuz_Beny", true];
*/
	params ["_unit"];

	private _LogicCenter = createCenter sideLogic;
	private _moduleGroup = createGroup _LogicCenter;
	private _ZeuzModule = _moduleGroup createUnit ["ModuleCurator_F",[0,0,0],[],0,"NONE"];
	_ZeuzModule setVariable ["Addons", 3, true];
	_ZeuzModule setVariable ["birdType", "", true];
	_ZeuzModule setVariable ["Forced", 0, true];
	_ZeuzModule setVariable ["Name", format ["_%1", _unit], true];
	_ZeuzModule setVariable ["showNotification", false, true];
	_ZeuzModule setCuratorWaypointCost 0;
	{
		_ZeuzModule setCuratorCoef [_x,0];
	} forEach ["place","edit","delete","destroy","group","synchronize"];
	_unit assignCurator _ZeuzModule;
}] call CBA_fnc_addEventHandler;

[QGVAR(removeZeus), {
	params ["_unit"];
	private _zeus = (getAssignedCuratorLogic _unit);
	unassignCurator _zeus;
	deleteVehicle _zeus;
}] call CBA_fnc_addEventHandler;

[{
	if (hasInterface) then {
		//	[DIK code, [Shift, Ctrl, Alt]]
		["GW","flexi_InteractSelfClient", "Client Menu", {[1] call FUNC(flexi_selectMenu);}, {}, [DIK_RWIN,[false,false,false]]] call CBA_fnc_addKeybind;
		["GW","flexi_InteractSelfAdmin", "Admin Menu", {[2] call FUNC(flexi_selectMenu);}, {}, [DIK_INSERT,[true,false,true]]] call CBA_fnc_addKeybind;

		if (isClass (configFile >> "CfgPatches" >> "STUI_Core")) then {
			GVAR(STHud_Compass_Stored) = STHud_Compass;
		};
		if (isNil {profileNamespace getVariable QGVAR(clientSettingsV3)}) then {
			[QGVAR(settings), "save"] call CBA_fnc_localEvent;
		} else {
			[QGVAR(settings), "load"] call CBA_fnc_localEvent;
		};
	};
}, [], 3] call CBA_fnc_waitAndExecute;
