#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = "GW - Effects Component";
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
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

#include "CfgAmmo.hpp"
#include "CfgCloudlets.hpp"
//#include "CfgLights.hpp"
