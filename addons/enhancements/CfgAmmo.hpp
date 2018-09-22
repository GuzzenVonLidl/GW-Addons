
class CfgAmmo {
	class RocketCore;
	class RocketBase;
	class R_PG32V_F: RocketBase {
		aiAmmoUsageFlags = "64 + 128 + 256 + 512";
		airLock = 0;
		allowAgainstInfantry = 1;
		cost = 100;
		soundFly[] = {"A3\Sounds_F\weapons\Rockets\rocket_fly_1",6,1.5,400};
		whistleDist = 25;
	};
	class R_TBG32V_F: R_PG32V_F{
		aiAmmoUsageFlags = "64 + 128 + 256 + 512";
		airLock = 0;
		allowAgainstInfantry = 1;
		cost = 100;
	};
	class R_PG7_F: R_PG32V_F{
		aiAmmoUsageFlags = "64 + 128 + 256 + 512";
		airLock = 0;
		allowAgainstInfantry = 1;
		cost = 100;
	};
	class Shellbase;
	class Sh_120mm_HE: ShellBase {
		cost = 100;
	};

	class Sh_120mm_APFSDS: ShellBase {
		cost = 100;
	};

	class Sh_125mm_HE;
	class Sh_125mm_HEAT: Sh_125mm_HE {
		cost = 100;
	};
};
