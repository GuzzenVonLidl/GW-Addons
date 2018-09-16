#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = "GW - Admin Component";
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"GW_main", "CBA_common", "A3_UI_F"};
		version = VERSION;
		authors[] = {"GuzzenVonlidl"};
	};
};

class CfgAddons {
	class PreloadAddons {
		class ADDON {
			list[] = {ADDON};
		};
	};
};

#include "CfgEventHandlers.hpp"

cba_settings_whitelist[] += {"_SP_PLAYER_", GUZZENVONLIDL, ARROW, OKSMAN, R4IDER, RAPTOR, FILTHY, JASON, PARKER};
//	enableDebugConsole[] = {GUZZENVONLIDL, ARROW, OKSMAN, R4IDER, RAPTOR, FILTHY, JASON, PARKER};


class Extended_DisplayLoad_EventHandlers {
	class RscDisplayCurator {
		CuratorOpend = "player playMoveNow (animationState player)";
	};
};
/*

class Extended_DisplayUnload_EventHandlers {
	class RscDisplayCurator {
		CuratorClosed = "";
	};
	class RscDisplayArsenal {
		Arsenal = "";
	};
	class RscDisplayEGSpectator {
		Spectator = "";
	};
};
*/
