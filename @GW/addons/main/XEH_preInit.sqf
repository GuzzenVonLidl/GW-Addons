#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.sqf"

GVARMAIN(isAdmin) = false;
GVARMAIN(isSuperAdmin) = false;
GVARMAIN(isActiveAdmin) = false;
GVARMAIN(activeAdmins) = [];
GVARMAIN(adminList) = ["_SP_PLAYER_", GUZZENVONLIDL, OKSMAN, R4IDER, BARON, RAPTOR, BENY, ARROW, GORALIGHT, FILTHY];
GVARMAIN(superAdminList) = ["_SP_PLAYER_", GUZZENVONLIDL];

ADDON = true;
