#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.sqf"

GVARMAIN(isAdmin) = false;
GVARMAIN(isSuperAdmin) = false;
GVARMAIN(isActiveAdmin) = false;
GVARMAIN(activeAdmins) = [];
GVARMAIN(adminList) = ["_SP_PLAYER_", GUZZENVONLIDL, OKSMAN, R4IDER, BARON, RAPTOR, BENY, ARROW, GORALIGHT, FILTHY];
GVARMAIN(superAdminList) = ["_SP_PLAYER_", GUZZENVONLIDL];

[QGVARMAIN(AddToAdminList), {
	params ["_admin"];
	GVARMAIN(adminList) pushBackUnique _admin;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(RemoveFromAdminList), {
	params ["_admin"];
	if (_admin in GVARMAIN(adminList)) then {
		GVARMAIN(adminList) deleteAt (GVARMAIN(adminList) find _admin);
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(AddAdmin), {
	params ["_admin"];
	GVARMAIN(activeAdmins) pushBackUnique _admin;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(RemoveAdmin), {
	params ["_admin"];
	if (_admin in GVARMAIN(activeAdmins)) then {
		GVARMAIN(activeAdmins) deleteAt (GVARMAIN(activeAdmins) find _admin);
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(sendMessage), {
	params ["_message"];
	systemChat _message;
}] call CBA_fnc_addEventHandler;

ADDON = true;
