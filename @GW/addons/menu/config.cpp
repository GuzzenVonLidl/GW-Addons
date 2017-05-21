#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = "GW - Menu Component";
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"GW_main", "CBA_common", "A3_UI_F", "A3_Functions_F"};
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
#include "CfgGUI.hpp"


class CfgFunctions {
    class A3 {
        class Debug {
            class isDebugConsoleAllowed {
                file = QPATHTOF(functions\DOUBLES(fnc,isDebugConsoleAllowed).sqf);
                recompile = 1;
            };
        };
    };
};
