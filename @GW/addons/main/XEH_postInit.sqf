#include "script_component.hpp"

[{
	if (hasInterface) then {
		if ((getPlayerUID player) in GVARMAIN(adminList)) then {
			GVARMAIN(isAdmin) = true;
			if (GVARMAIN(isActiveAdmin)) then {
				[QGVARMAIN(AddAdmin), player] call CBA_fnc_serverEvent;
			} else {
				[QGVARMAIN(RemoveAdmin), player] call CBA_fnc_serverEvent;
			};
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
		}, 5, []] call CBA_fnc_addPerFrameHandler;
	};
}, [], 1] call CBA_fnc_waitAndExecute;
