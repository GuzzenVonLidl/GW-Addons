/*
	class RscPicture;
	class RscFrame;
	class RscText;
	class RscListbox;
	class RscControlsGroup;
	class RscCombo;
	class RscButton;
	class RscStructuredText;
*/

class RscButtonMenu;
class RscStandardDisplay;
class GW_MainMenu_Admin: RscButtonMenu {
	action="(findDisplay 49) closeDisplay 0; ['player', [], 100, ['(call GW_Admin_fnc_flexi_InteractSelf)','main']] call cba_fnc_fleximenu_openMenuByDef";
	text="Admin Menu";
	tooltip="Admin Menu";
	x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
	y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
	w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};

class RscDisplayInterrupt: RscStandardDisplay {
	class controls {
		class GW_MainMenu_Admin: GW_MainMenu_Admin {};

		delete BloodLustSettingsButton;

	};
};
class RscDisplayMPInterrupt: RscDisplayInterrupt {
	class controls {
		class GW_MainMenu_Admin: GW_MainMenu_Admin {};
		delete BloodLustSettingsButton;

	};
};
class RscDisplayInterruptEditor3D: RscDisplayInterrupt {

	class controls {
		class GW_MainMenu_Admin: GW_MainMenu_Admin {};
	};

};
class RscDisplayInterruptEditorPreview: RscDisplayInterrupt {
	class controls {
		class GW_MainMenu_Admin: GW_MainMenu_Admin {};
	};
};
