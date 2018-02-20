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
		requiredAddons[] = {"GW_main","CBA_common","A3_Data_F","A3_Misc_F","A3_Plants_F_Bush","A3_Roads_F","A3_Rocks_F","A3_Signs_F","A3_Soft_F","A3_Structures_F","A3_Structures_F_Households","A3_Structures_F_Ind","A3_Structures_F_Mil","A3_Structures_F_Wrecks","A3_UI_F"};
		version = VERSION;
		authors[] = {"GuzzenVonlidl"};
	};
};

class ctrlButtonPictureKeepAspect;
class ctrlButtonToolbar;
class ctrlCheckbox;
class ctrlCheckboxToolbar;
class ctrlCombo;
class ctrlControlsGroupNoScrollbars;
class ctrlDefault;
class ctrlEdit;
class ctrlMenu;
class ctrlMenuStrip;
class ctrlStatic;
class ctrlStaticPicture;
class ctrlToolbox;
class ctrlToolboxPicture;
class ctrlXSliderH;
class RscButtonMenu;
class RscControlsGroup;
class RscHTML;
class RscStructuredText;
class RscText;
class Separator1;

class CfgEditorSubcategories {
	class EdSubcat_GW_Bushes {
		displayName = "Bushes";
	};
	class EdSubcat_GW_clutter {
		displayName = "Clutter";
	};
	class EdSubcat_GW_Plants {
		displayName = "Plants";
	};
	class EdSubcat_GW_Trees {
		displayName="Trees";
	};
	class EdSubcat_GW_Trees_tanoa {
		displayName="Trees Tanoa";
	};
};

#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgGroups.hpp"
#include "CfgVehicles.hpp"
#include "display3DEN.hpp"

class RscDisplayArsenal {
	class controls {
		class GW_Export : RscButtonMenu {
			x ="0.425 * safezoneW + safezoneX";
			y = "0.93 * safezoneH + safezoneY";
			w = "0.125 * safezoneW";
			h ="0.02 * safezoneH";
			text = "Export GW Loadout";
			action = "[] call GW_3den_fnc_copyLoadout";
		};
	};
};
