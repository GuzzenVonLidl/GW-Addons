
class CfgActions {
	class None;
	class Rearm: None {
		show = 0;
	};
	class LoadMagazine;
	class LoadEmptyMagazine : LoadMagazine {
		showWindow = 0;
		textDefault = "";
	};
	class OpenBag: None {
		shortcut = "Gear";
	};

	// to pistol
	class HandGunOn: None {
		show = 0;
	};
	// to rifle
	class HandGunOff: None {
		show = 0;
	};

	// to launcher, (also used for binoculars?)
	class SwitchWeapon: None {
		show = 0;
	};
	class SwitchMagazine: SwitchWeapon {
		show = 1;
	};
	// no idea, probably unused
	class HideWeapon: SwitchWeapon {
		show = 0;
	};
};
