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

#include "CfgAmmo.hpp"
#include "CfgCloudlets.hpp"
//#include "CfgLights.hpp"

class cfgWeapons {
	class Default {
		fireLightDuration = 1;
		fireLightIntensity = 0.5;
	};
	class Rifle;
	class Rifle_Base_F: Rifle {
		fireLightDuration = 0.015;
		fireLightIntensity = 0.3;
		fireLightDiffuse[] = {2,1.5,0};
	};
};
