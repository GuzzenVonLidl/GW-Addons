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
class GW_MainMenu_Client: RscButtonMenu {
	action=QUOTE(1 call FUNC(flexi_selectMenu));
	text="Player Menu";
	tooltip="Personal Settings";
	x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
	y = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
	w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};

class GW_MainMenu_Admin: GW_MainMenu_Client {
	action=QUOTE(2 call FUNC(flexi_selectMenu));
	text="Admin Menu";
	tooltip="Admin Menu";
	y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
};

class RscDisplayInterrupt: RscStandardDisplay {
	class controls {
		class GW_MainMenu_Client: GW_MainMenu_Client {};
		class GW_MainMenu_Admin: GW_MainMenu_Admin {};

		delete BloodLustSettingsButton;

	};
};
class RscDisplayMPInterrupt: RscDisplayInterrupt {
	class controls {
		class GW_MainMenu_Client: GW_MainMenu_Client {};
		class GW_MainMenu_Admin: GW_MainMenu_Admin {};
		delete BloodLustSettingsButton;

	};
};
class RscDisplayInterruptEditor3D: RscDisplayInterrupt {

	class controls {
		class GW_MainMenu_Client: GW_MainMenu_Client {};
		class GW_MainMenu_Admin: GW_MainMenu_Admin {};
	};

};
class RscDisplayInterruptEditorPreview: RscDisplayInterrupt {
	class controls {
		class GW_MainMenu_Client: GW_MainMenu_Client {};
		class GW_MainMenu_Admin: GW_MainMenu_Admin {};
	};
};
