#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = "GW - UI Component";
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"GW_main", "CBA_common", "A3_UI_F"};
		version = VERSION;
		authors[] = {"GuzzenVonlidl"};
	};
};

#include "CfgActions.hpp"
#include "CfgDiary.hpp"
#include "CfgInGameUI.hpp"
#include "CfgUnitInsignia.hpp"
#include "RscMisc.hpp"

class CfgLensFlare {
	flareSizeEye[] = {0.1};
	flareSizeEyeSun[] = {0.1};
};

class CfgCoreData {
	eyeFlareSun = "A3\data_f\eyeflareSun_ca.paa";			// Default
};

class CfgIRLaserSettings {
	laserMaxRange = 100;
	maxNumberOfRays = 24;
	maxViewDistance = 1000;
};

class CfgVehicles {
	class Plane;
	class Plane_Base_F: Plane {
		featureType = 2;
	};
	class Helicopter;
	class Helicopter_Base_F: Helicopter {
		featureType = 2;
	};
};

class hd_dot;
class hd_dot_noShadow;
class CfgMarkers {
	class hd_dot_dupe : hd_dot {
		name = "HD_DOT_2";
		icon = "\A3\ui_f\data\map\markers\handdrawn\dot_CA.paa";
	};
	class hd_dot_noShadow_dupe : hd_dot_noShadow {};
};

class CfgMovesBasic {
	class Default {
		idle = "";
	};
};

class CfgInventoryGlobalVariable {
	maxSoldierLoad = 1500;
};
