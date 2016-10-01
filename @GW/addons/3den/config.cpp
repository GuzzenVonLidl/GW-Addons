#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = CSTRING(component);
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

#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgGroups.hpp"
#include "display3DEN.hpp"


/*
class AttributeCategories {
	class Inventory {
		displayName = $STR_3DEN_Object_AttributeCategory_Storage;
		collapsed = 1;
		class Attributes {
			class AmmoBox {
				property = "ammoBox";
				value = 0;
				control = "AmmoBox";
				displayName = $STR_3DEN_Object_AttributeCategory_Storage;
				tooltip = "";
				expression = "[_this,_value] call bis_fnc_initAmmoBox;";
				defaultValue = "_this call bis_fnc_initAmmoBox;";
				condition = "objectHasInventoryCargo";
				wikiType = "[[String]]";
			};
		};
	};
};
*/
