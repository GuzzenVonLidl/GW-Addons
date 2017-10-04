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

#include "CfgEventHandlers.hpp"

class ACE_Settings {
	class ACE_Medical_Actions {
		class Basic {
			class Bandage;
			class CPR: Bandage {
				condition = "!([(_this select 1)] call ace_common_fnc_isAwake)";
				callbackSuccess = QUOTE(FUNC(treatmentAdvanced_CPR));
				callbackProgress = "!([((_this select 0) select 1)] call ace_common_fnc_isAwake)";
			};
		};
	};
};

class ACE_Repair {
	class Actions {
		class MiscRepair {
			items[] = {};
			itemConsumed = 0;
		};
		class FullRepair {
			itemConsumed = 0;
		};
	};
};
