#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonLidl";
		name = "GW - Main Component";
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CBA_common", "A3_UI_F"};
		versionDesc = "GW Mod Collection";
		VERSION_CONFIG;
		authors[] = {"GuzzenVonLidl"};
	};
};

class CfgAddons {
	class PreloadAddons {
		class ADDON {
			list[] = {ADDON};
		};
	};
};
rptFileLimit = 1;
#include "CfgDifficultyPresets.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMissions.hpp"

class CfgMods {
	class Mod_Base;
	class GW: Mod_Base {
		action="https://github.com/GuzzenVonLidl/GW-Addons";
		actionName="Website";
		dir="@GW";
		hideName=1;
		hidePicture=1;
		name="GuzzenWorks";
		overview="GW-Addons is a collection of addons containing enhancements for Infantry, Mission Editing and more";
//		picture="\x\gw\addons\main\logos\logo_ca.paa";
		tooltip="GW-Addons";
		tooltipOwned="GW-Addons";
	};
	class A3: Mod_Base {
		name = "A3";
	};
	class DLCBundle: Mod_Base {
		name = "DLC1";
	};
	class Curator: Mod_Base {
		name = "Zeus";
	};
	class Kart: Mod_Base {
		name = "Karts";
	};
	class Heli: Mod_Base {
		name = "Heli";
	};
	class Mark: Mod_Base {
		name = "Mark";
	};
	class Expansion: Mod_Base {
		name = "Apex";
	};
	class DLCBundle2: Mod_Base {
		name = "DLC2";
	};
	class Jets: Mod_Base {
		name = "Jets";
	};
	class Argo: Mod_Base {
		name = "Argo";
	};
};

class CfgDLCNotifications {
	class Default {
		picture = "";
		logo = "";
		logoOver = "";
		tooltip = "";
		tooltipOwned = "";
		action = "";
		fieldManualTopicAndHint[] = {"",""};
		dlcColor[] = {"0","0","0",0};
		overview = "";
		name = "0";
		author = "0";
		overviewPicture = "0";
		overviewText = "";
		contentBrowserPicture = "";
		popupMsgPicture = "";
		popupMsgText = "";
		vehPrevMsgText = "";
		vehPrevNotifText = "";
		infoPages[] = {"",""};
		overviewFootnote = "";
	};
};
