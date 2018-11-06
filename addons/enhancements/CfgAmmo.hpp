
class CfgAmmo {
	class RocketCore;
	class RocketBase;
	class R_PG32V_F: RocketBase {
		LAUNCHER
	};
	class R_TBG32V_F: R_PG32V_F{
		LAUNCHER_NOSOUND
	};
	class R_PG7_F: R_PG32V_F{
		LAUNCHER_NOSOUND
	};
	class CUP_R_PG7V_AT: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_PG7VL_AT: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_PG7VR_AT: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_OG7_AT: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_PG9_AT: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_OG9_HE: CUP_R_PG9_AT {
		LAUNCHER_NOSOUND
	};
	class CUP_R_SMAW_HEDP: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_SMAW_HEAA: CUP_R_SMAW_HEDP {
		LAUNCHER_NOSOUND
	};
	class CUP_R_M136_AT: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_MEEWS_HEDP: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_MEEWS_HEAT: CUP_R_MEEWS_HEDP {
		LAUNCHER_NOSOUND
	};
	class CUP_R_RPG18_AT: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_SMAW_HEDP_N: RocketBase {
		LAUNCHER_NOSOUND
	};
	class CUP_R_SMAW_HEAA_N: CUP_R_SMAW_HEDP_N {
		LAUNCHER_NOSOUND
	};
	class CUP_R_M72A6_AT: RocketBase {
		LAUNCHER_NOSOUND
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


