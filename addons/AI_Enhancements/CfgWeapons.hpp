
class RifleCore;
class Rifle: RifleCore {
	aiDispersionCoefX = 4;
	aiDispersionCoefY = 8;
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

//	Mode_SemiAuto
//	Mode_Burst
//	Mode_FullAuto
class arifle_Katiba_Base_F: Rifle_Base_F {
	modes[] = {"Single", "FullAuto"};
	class Single: Mode_SemiAuto {
		RIFLE_FIREMODE_SINGLE;
	};
	class FullAuto: Mode_FullAuto {
		RIFLE_FIREMODE_FULLAUTO;
	};
};
class arifle_Katiba_C_F: arifle_Katiba_Base_F {
	modes[] = {"Single", "FullAuto"};
	class Single: Single {
		CARBINE_FIREMODE_SINGLE;
	};
	class FullAuto: FullAuto {
		CARBINE_FIREMODE_FULLAUTO;
	};
};
class LMG_Zafir_F: Rifle_Long_Base_F {
	modes[] = {"FullAuto", "Single", "FullAuto_LMG"};
	class Single: Mode_SemiAuto {
		LMG_FIREMODE_SINGLE;
	};
	class FullAuto: Mode_FullAuto {
		LMG_FIREMODE_FULLAUTO_Medium;
	};
	class FullAuto_LMG: FullAuto {
		LMG_FIREMODE_FULLAUTO_LONG;
	};
};
