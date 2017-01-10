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

class CfgAddons {
	class PreloadAddons {
		class ADDON {
			list[] = {ADDON};
		};
	};
};

#include "CfgDiary.hpp"
#include "CfgInGameUI.hpp"
#include "RscMisc.hpp"

class CfgLensFlare {
	flareSizeEye[] = {0.06};
	flareSizeEyeSun[] = {0.06};
};

class CfgCoreData {
	eyeFlareSun = "A3\data_f\masktextureflare01_co.paa";
};

class CfgIRLaserSettings {
	laserMaxRange = 100;
	maxNumberOfRays = 48;
	maxViewDistance = 1000;
};

class CfgVehicles { //  VehiclesVisibleAtDistance_Visuals_C_PvPscene
	class All;
	class AllVehicles: All {
		featureSize = 1000;
	};
};
// <--

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
	maxSoldierLoad = 10000;
};

class CfgUnitInsignia {
	class GOL {
		displayName = "GOL Clan";
		author = "GOL Clan";
		texture = QPATHTOF(data\Insignia_logo_ca.paa);
		textureVehicle = "";
	};
};

class CfgActions {
    class None;
    class Rearm: None {
        show = 0;
    };
    class LoadMagazine;
    class LoadEmptyMagazine : LoadMagazine {
        showWindow = 0;
        textDefault = "";
    };
	class OpenBag: None {
		shortcut = "Gear";
	};
};
