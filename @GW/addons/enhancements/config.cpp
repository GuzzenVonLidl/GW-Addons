#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = CSTRING(component);
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {
			"150Rnd_762x51_Box_Tracer_Red",
			"GW_X3000",
			"GVL_X2000_point",
			"GVL_X2000_wide",
			"GW_CoreItem_Static"
		};
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

class asdg_SlotInfo;
class asdg_FrontSideRail: asdg_SlotInfo {
	class compatibleItems {
		GW_X3000 = 1;
		GVL_X2000_wide = 1;
		GVL_X2000_point = 1;
	};
};

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"

class CfgSounds {
	class GW_enhancements_Attachment {
		name = "Toggle_Attachment";
		sound[] = {QPATHTOF(data\switch_mod_04.wss),1,1,25};
		titles[] = {};
	};
};

/*
class CfgVehicles {	// custom radio backpack
  	class ReammoBox;
  	class Bag_Base;
	class TFAR_Bag_Base;
	class tf_anprc155;
	class tf_anprc155_black: tf_anprc155 {
		author = "GuzzenVonlidl";
		displayName = "AN/PRC 155 Black";
		descriptionShort = "AN/PRC 155 Black";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {QPATHTOF(DATA\clf_nicecomm2_co_new.paa)};
	};
};
*/
