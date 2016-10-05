
class CfgAmmo {
	class GrenadeHand;
	class SmokeShell: GrenadeHand {
		smokeColor[] = {1,1,1,1};
		timeToLive = 45;
	};
	class SmokeShellRed: SmokeShell {
		smokeColor[] = SMOKE_COLOR_RED;
		timeToLive = 45;
	};
	class SmokeShellGreen: SmokeShell {
		smokeColor[] = SMOKE_COLOR_GREEN;
		timeToLive = 45;
	};
	class SmokeShellYellow: SmokeShell {
		smokeColor[] = SMOKE_COLOR_YELLOW;
		timeToLive = 45;
	};
	class SmokeShellPurple: SmokeShell {
		smokeColor[] = SMOKE_COLOR_PURPLE;
		timeToLive = 45;
	};
	class SmokeShellBlue: SmokeShell {
		smokeColor[] = SMOKE_COLOR_BLUE;
		timeToLive = 45;
	};
	class SmokeShellOrange: SmokeShell {
		smokeColor[] = SMOKE_COLOR_ORANGE;
		timeToLive = 45;
	};

	class G_40mm_Smoke: SmokeShell {
		aiAmmoUsageFlags = "4 + 2 + 1 + 64";
		coefGravity = 0.8;
		cost = 50;
		deflecting = 5;
		explosionTime = 1;
		hit = 0;
		simulation = "shotSmoke";
		smokeColor[] = {1,1,1,1};
		timeToLive = 45;
	};

	class G_40mm_SmokeRed: G_40mm_Smoke {
		smokeColor[] = SMOKE_COLOR_RED;
		timeToLive = 45;
	};
	class G_40mm_SmokeGreen: G_40mm_Smoke {
		smokeColor[] = SMOKE_COLOR_GREEN;
		timeToLive = 45;
	};
	class G_40mm_SmokeYellow: G_40mm_Smoke {
		smokeColor[] = SMOKE_COLOR_YELLOW;
		timeToLive = 45;
	};
	class G_40mm_SmokePurple: G_40mm_Smoke {
		smokeColor[] = SMOKE_COLOR_PURPLE;
		timeToLive = 45;
	};
	class G_40mm_SmokeBlue: G_40mm_Smoke {
		smokeColor[] = SMOKE_COLOR_BLUE;
		timeToLive = 45;
	};
	class G_40mm_SmokeOrange: G_40mm_Smoke {
		smokeColor[] = SMOKE_COLOR_ORANGE;
		timeToLive = 45;
	};

	class FlareCore;
	class FlareBase: FlareCore {
		brightness = 15;
		coefGravity = 0.5;
		flareSize = 10;
		intensity = 500000;
		timeToLive = 35;
		triggerTime = 1;
	};
	class F_20mm_White: FlareBase {
		flareSize = 10;
	};
	class F_40mm_White: FlareBase {
		flareSize = 10;
	};
	class Flare_82mm_AMOS_White: FlareCore {
		timeToLive = 60;
		intensity = 300000;
		flareSize = 15;
	};

	class F_20mm_Green;
	class F_20mm_Red;
	class F_20mm_Yellow;
	class ACE_F_Hand_White: F_20mm_White {
		timeToLive = 60;
	};
	class ACE_F_Hand_Green: F_20mm_Green {
		timeToLive = 60;
	};
	class ACE_F_Hand_Red: F_20mm_Red {
		timeToLive = 60;
	};
	class ACE_F_Hand_Yellow: F_20mm_Yellow {
		timeToLive = 60;
	};
};
