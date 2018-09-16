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

rptFileLimit = 2;
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
		picture = "\x\gw\addons\3den\data\Logo_GOL_1.paa";
		tooltip="GW-Addons";
		tooltipOwned="GW-Addons";
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
