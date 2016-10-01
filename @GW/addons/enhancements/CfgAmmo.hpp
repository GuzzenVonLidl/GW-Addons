
class CfgAmmo {
	class RocketCore;
	class RocketBase;
	class R_PG32V_F: RocketBase {
		airLock = 1;
		allowAgainstInfantry = 1;
		soundFly[] = {"A3\Sounds_F\weapons\Rockets\rocket_fly_1",6,1.5,400};
		whistleDist = 25;
	};
	class R_TBG32V_F: R_PG32V_F{

	};
	class R_PG7_F: R_PG32V_F{
		airLock = 0;
		allowAgainstInfantry = 1;
	};
};
