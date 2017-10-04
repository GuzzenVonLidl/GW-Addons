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
class RscControlsGroup;
class RscHTML;
class RscStructuredText;
class RscText;
class Separator1;

#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgGroups.hpp"
#include "display3DEN.hpp"
