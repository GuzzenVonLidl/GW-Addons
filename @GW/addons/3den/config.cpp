#include "script_component.hpp"
#include "\a3\3DEN\UI\resincl.inc"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = "GW - 3DEN Component";
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

class CfgFunctions {
	class GW_3DEN {
		class 3DEN {
			class init {	// Required, CBA only launches on startup & previewEnd
				preStart = 1;
				preInit = 1;
				postInit = 0;
				file = "\x\gw\addons\3den\functions\fnc_Init.sqf";
			};
		};
	};
};

class ctrlDefault;
class ctrlCombo;
class ctrlStatic;
class ctrlEdit;
class ctrlXSliderH;
class ctrlCheckbox;
class ctrlToolbox;
class ctrlToolboxPicture;
class ctrlStaticPicture;
class ctrlMenuStrip;
class ctrlMenu;
class ctrlControlsGroupNoScrollbars;
class ctrlButtonPictureKeepAspect;
class RscStructuredText;
class RscHTML;
class RscControlsGroup;

#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgGroups.hpp"
#include "display3DEN.hpp"
