#include "script_component.hpp"

[{
	if (hasInterface) then {
		if ((getPlayerUID player) in GVARMAIN(adminList)) then {
			[QGVARMAIN(AddAdmin), player] call CBA_fnc_localEvent;
			if ((getPlayerUID player) in GVARMAIN(superAdminList)) then {
				GVARMAIN(isSuperAdmin) = true;
			};
		};
	};

	if (isServer) then {
		GVARMAIN(activeAdmins_PFH) = [{
			_list = (GVARMAIN(activeAdmins) + [getAssignedCuratorUnit GW_ZeuzModuleAdminLogged]);
			if (diag_fps < 25) then {
				[QGVARMAIN(sendMessage), format ["Warning: Server low fps %1", diag_fps], _list] call CBA_fnc_targetEvent;
			};
			if (((count allUnits) - (count allPlayers)) > 150) then {
				[QGVARMAIN(sendMessage), format ["Warning: High unit count %1", ((count allUnits) - (count allPlayers))], _list] call CBA_fnc_targetEvent;
			};
			if ((count allGroups) > 125) then {
				[QGVARMAIN(sendMessage), format ["Warning: High group count %1", (count allGroups)], _list] call CBA_fnc_targetEvent;
			};
			if ((count allDead) > 50) then {
				[QGVARMAIN(sendMessage), format ["Warning: High dead count %1", (count allDead)], _list] call CBA_fnc_targetEvent;
			};
		}, 30, []] call CBA_fnc_addPerFrameHandler;
	};
}, [], 1] call CBA_fnc_waitAndExecute;

[QGVARMAIN(sendMessage), {
	params ["_message"];
	systemChat _message;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(AddAdmin), {
	params ["_admin"];
	GVARMAIN(isAdmin) = true;
	missionNamespace setVariable [QGVARMAIN(isAdmin), true];
	[QGVARMAIN(AddAdminServer), _admin] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(AddAdminServer), {
	params ["_admin"];
	GVARMAIN(adminList) pushBackUnique _admin;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(RemoveAdmin), {
	params ["_admin"];
	GVARMAIN(isAdmin) = false;
	[QGVARMAIN(RemoveAdminServer), _admin] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(RemoveAdminServer), {
	params ["_admin"];
	if (_admin in GVARMAIN(adminList)) then {
		GVARMAIN(adminList) deleteAt (GVARMAIN(adminList) find _admin);
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(AddActiveAdmin), {
	params ["_admin"];
	GVARMAIN(isActiveAdmin) = true;
	[QGVARMAIN(AddActiveAdminServer), _admin] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(AddActiveAdminServer), {
	params ["_admin"];
	GVARMAIN(activeAdmins) pushBackUnique _admin;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(RemoveActiveAdmin), {
	params ["_admin"];
	GVARMAIN(isActiveAdmin) = false;
	[QGVARMAIN(RemoveActiveAdminServer), _admin] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(RemoveActiveAdminServer), {
	params ["_admin"];
	if (_admin in GVARMAIN(activeAdmins)) then {
		GVARMAIN(activeAdmins) deleteAt (GVARMAIN(activeAdmins) find _admin);
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
		[_x] call EGVAR(Common,addToCurators);
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
	[_box, [_type, toLower(str([_unit] call GW_Common_Fnc_getSide)), true]] call GW_Gear_Fnc_Handler;
}] call CBA_fnc_addEventHandler;

[QGVAR(helpMsg), {
	params ["_msg", "_unit"];
	systemChat format ["Help: %1 (%2) - %3", (name _unit), _unit, _msg];
}] call CBA_fnc_addEventHandler;

[QGVAR(sendMsg), {
	params ["_msg", "_unit"];
	systemChat format ["Admin: %1 - %3", (name _unit), _msg];
}] call CBA_fnc_addEventHandler;

if (GVARMAIN(mod_ACE)) then {
	[QGVAR(treatmentAdvanced_CPRLocal), {
		_this call (treatmentAdvanced_CPRLocal);
	}] call CBA_fnc_addEventHandler;

	[QGVAR(fullHeal), {
		params ["_unit"];
		[_unit, _unit] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
	}] call CBA_fnc_addEventHandler;
};

#include "ChatCommands.sqf"
