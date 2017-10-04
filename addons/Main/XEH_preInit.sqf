#include "script_component.hpp"

ADDON = false;

GVARMAIN(isAdmin) = false;
GVARMAIN(isSuperAdmin) = false;
GVARMAIN(isActiveAdmin) = false;
GVARMAIN(activeAdmins) = [];
GVARMAIN(adminList) = ["_SP_PLAYER_", GUZZENVONLIDL, OKSMAN, R4IDER, RAPTOR, FILTHY, JASON, ARROW];
GVARMAIN(superAdminList) = ["_SP_PLAYER_", GUZZENVONLIDL, ARROW];

ADDON = true;
