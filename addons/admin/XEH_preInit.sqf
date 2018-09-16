#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

#include "XEH_PREP.sqf"

GVARMAIN(isAdmin) = false;
GVARMAIN(isSuperAdmin) = false;
GVARMAIN(isActiveAdmin) = false;
GVARMAIN(activeAdmins) = [];
GVARMAIN(adminList) = ["_SP_PLAYER_", GUZZENVONLIDL, ARROW, OKSMAN, R4IDER, RAPTOR, FILTHY, JASON, PARKER];
GVARMAIN(superAdminList) = ["_SP_PLAYER_", GUZZENVONLIDL, ARROW];

GVARMAIN(canUseDevConsole) = false;

if (isNil QEGVAR(Gear,GearboxActive)) then {
	EGVAR(Gear,GearboxActive) = true;
};

if (hasInterface) then {
	[QUOTE(PREFIX),"flexi_InteractSelfAdmin", "Admin Menu", {
		if (ISADMIN) then {
			["player",[],100, [QUOTE(call FUNC(flexi_InteractSelf)),"main"]] call cba_fnc_fleximenu_openMenuByDef;
		};
	}, {}, [DIK_INSERT,[true,false,true]]] call CBA_fnc_addKeybind;
};

