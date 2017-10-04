#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = "GW - Enhancements Component";
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {
			"150Rnd_762x51_Box_Tracer_Red",
			"150Rnd_762x51_Box_Tracer_Yellow",
			"150Rnd_762x54_Box_Tracer_Red",
			"150Rnd_762x54_Box_Tracer_Yellow",
			"GW_X3000",
			"GVL_X2000_point",
			"GVL_X2000_wide"
		};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"GW_main", "CBA_common", "A3_UI_F"};
		version = VERSION;
		authors[] = {"GuzzenVonlidl"};
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
#include "CfgVehicles.hpp"

class CfgSounds {
	class GW_enhancements_Attachment {
		name = "Toggle_Attachment";
		sound[] = {QPATHTOF(data\switch_mod_04.wss),1,1,25};
		titles[] = {};
	};
};

class CfgAISkill {
	aimingAccuracy[] = {0, 0.1, 1, 1};
	aimingShake[]    = {0, 0.1, 1, 1};
	aimingSpeed[]    = {0, 0.1, 1, 1};
	commanding[]     = {0, 0.1, 1, 1};
	courage[]        = {0, 0.1, 1, 1};
	endurance[]      = {0, 0.1, 1, 1};
	general[]        = {0, 0.1, 1, 1};
	reloadSpeed[]    = {0, 0.1, 1, 1};
	spotDistance[]   = {0, 0.1, 1, 0.7};
	spotTime[]       = {0, 0.1, 1, 0.8};
};

/*

class CfgAISkill {	// ACE 3
	aimingAccuracy[] = {0,0, 1,0.8};  // {0,0,1,1};   v1.26 defaults
	aimingShake[]    = {0,0, 1,0.6};  // {0,0,1,1};
	aimingSpeed[]    = {0,0, 1,0.7};  // {0,0.5,1,1};
	commanding[]     = {0,0, 1,0.8};  // {0,0,1,1};
	courage[]        = {0,0, 1,0.7};  // {0,0,1,1};
	endurance[]      = {0,0, 1,0.7};  // {0,0,1,1};
	general[]        = {0,0, 1,0.9};  // {0,0,1,1};
	//reloadSpeed[]  = {0,0, 1,0.8};  // {0,0,1,1};// apparently breaks rapid firing in single fire mode for players
	spotDistance[]   = {0,0, 1,0.9};  // {0,0.2,1,0.4};
	spotTime[]       = {0,0, 1,0.7};  // {0,0,1,0.7};
};

class CfgAISkill {	// Default
	aimingAccuracy[] = {0, 0, 1, 1};
	aimingShake[]	 = {0, 0, 1, 1};
	aimingSpeed[]	 = {0, 0.5, 1, 1};
	commanding[]	 = {0, 0, 1, 1};
	courage[] 		 = {0, 0, 1, 1};
	endurance[]		 = {0, 0, 1, 1};
	general[]		 = {0, 0, 1, 1};
	reloadSpeed[]	 = {0, 0, 1, 1};
	spotDistance[]	 = {0, 0.2, 1, 0.4};
	spotTime[] 		 = {0, 0, 1, 0.7};
};
*/

