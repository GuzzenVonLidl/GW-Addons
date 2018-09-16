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
#include "CfgVehicles.hpp"

class ACE_Medical_Actions {
	class Basic {
		class Bandage;
		class CPR: Bandage {
			callbackSuccess = QUOTE(FUNC(treatmentAdvanced_CPR));
		};
	};
	class Advanced {
		class fieldDressing;
		class CPR: fieldDressing {
			callbackSuccess = QUOTE(FUNC(treatmentAdvanced_CPR));
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
