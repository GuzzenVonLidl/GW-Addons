class CfgWeapons {
	class Default;
	class RifleCore;

	class Rifle: RifleCore {
	    RIFLE_DISPERSION
	};

	class MGunCore: Default {
	    MGUN_DISPERSION
	};

	class GrenadeLauncher: Default {
	    NADE_DISPERSION
	};

	class Throw: GrenadeLauncher {
	    class ThrowMuzzle: GrenadeLauncher {
	        NADE_DISPERSION
	    };
	};

	class Rifle_Base_F: Rifle {};
	class Rifle_Short_Base_F : Rifle_Base_F {};
	class Rifle_Long_Base_F: Rifle_Base_F {};

	class HandGunBase: Rifle {
		aiRateOfFire = 1;
		aiRateOfFireDispersion = 1;
		aiRateOfFireDistance = 100;
		maxRange = 70;
		maxRangeProbab = 0.01;
		midRange = 30;
		midRangeProbab = 0.05;
		minRange = 0;
		minRangeProbab = 0.1;
	};
};
