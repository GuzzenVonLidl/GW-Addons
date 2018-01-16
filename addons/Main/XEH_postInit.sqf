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
			if (diag_fps < 25) then {
				[QGVARMAIN(sendMessage), format ["Warning: Server low fps %1", diag_fps], GVARMAIN(activeAdmins)] call CBA_fnc_targetEvent;
			};
			if (((count allUnits) - (count allPlayers)) > 150) then {
				[QGVARMAIN(sendMessage), format ["Warning: High unit count %1", ((count allUnits) - (count allPlayers))], GVARMAIN(activeAdmins)] call CBA_fnc_targetEvent;
			};
			if ((count allGroups) > 125) then {
				[QGVARMAIN(sendMessage), format ["Warning: High group count %1", (count allGroups)], GVARMAIN(activeAdmins)] call CBA_fnc_targetEvent;
			};
			if ((count allDead) > 50) then {
				[QGVARMAIN(sendMessage), format ["Warning: High dead count %1", (count allDead)], GVARMAIN(activeAdmins)] call CBA_fnc_targetEvent;
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
