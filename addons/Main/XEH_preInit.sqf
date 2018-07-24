#include "script_component.hpp"

ADDON = false;

GVARMAIN(isAdmin) = false;
GVARMAIN(isSuperAdmin) = false;
GVARMAIN(isActiveAdmin) = false;
GVARMAIN(activeAdmins) = [];
GVARMAIN(adminList) = ["_SP_PLAYER_", GUZZENVONLIDL, ARROW, OKSMAN, R4IDER, RAPTOR, FILTHY, JASON, PARKER];
GVARMAIN(superAdminList) = ["_SP_PLAYER_", GUZZENVONLIDL, ARROW];

GVARMAIN(canUseDevConsole) = false;

ADDON = true;
