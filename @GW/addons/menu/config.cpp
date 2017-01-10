#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = "GW - Menu Component";
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
#include "CfgGUI.hpp"
