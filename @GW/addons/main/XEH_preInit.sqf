#include "script_component.hpp"

ADDON = false;

GVARMAIN(isAdmin) = false;
GVARMAIN(isSuperAdmin) = false;
GVARMAIN(isActiveAdmin) = false;
GVARMAIN(activeAdmins) = [];
GVARMAIN(adminList) = ["_SP_PLAYER_", GUZZENVONLIDL, OKSMAN, R4IDER, RAPTOR, FILTHY, ARROW];
GVARMAIN(superAdminList) = ["_SP_PLAYER_", GUZZENVONLIDL];

ADDON = true;
