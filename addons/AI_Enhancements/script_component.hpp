#define COMPONENT AI_Enhancements
#include "\x\gw\addons\main\script_mod.hpp"

//#define DEBUG_ENABLED_AI_Enhancements

#ifdef DEBUG_ENABLED_AI_Enhancements
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_AI_Enhancements
    #define DEBUG_SETTINGS DEBUG_SETTINGS_AI_Enhancements
#endif

#include "\x\gw\addons\main\script_macros.hpp"

#define	SETMAXRANGETABLE(VAR1,VAR2,VAR3) \
	maxRange = VAR1; \
	maxRangeProbab = 0.9; \
	midRange = VAR2; \
	midRangeProbab = 0.5; \
	minRange = VAR3; \
	minRangeProbab = 0.1

#define	SETMIDRANGETABLE(VAR1,VAR2,VAR3) \
	maxRange = VAR1; \
	maxRangeProbab = 0.1; \
	midRange = VAR2; \
	midRangeProbab = 0.9; \
	minRange = VAR3; \
	minRangeProbab = 0.1

#define	SETMINRANGETABLE(VAR1,VAR2,VAR3) \
	maxRange = VAR1; \
	maxRangeProbab = 0.05; \
	midRange = VAR2; \
	midRangeProbab = 0.5; \
	minRange = VAR3; \
	minRangeProbab = 0.9

#define	SETDISPERSION(VAR1,VAR2) \
	aiDispersionCoefX = VAR1; \
	aiDispersionCoefY = VAR2

#define	SETRATEOFFIRE(VAR1,VAR2,VAR3) \
	aiRateOfFire = VAR1; \
	aiRateOfFireDispersion = VAR2; \
	aiRateOfFireDistance = VAR3


//	SETDISPERSION(4,8);
//	SETRATEOFFIRE(1,2,500);
//	SETMAXRANGETABLE(1000,500,3);
//	SETMINRANGETABLE(100,40,0);

#define	RIFLE_FIREMODE_SINGLE \
	SETDISPERSION(3,6); \
	SETRATEOFFIRE(1,2,500); \
	SETMAXRANGETABLE(1000,500,3)

#define	RIFLE_FIREMODE_FULLAUTO \
	SETDISPERSION(4,8); \
	SETRATEOFFIRE(0.1,2,50); \
	SETMAXRANGETABLE(100,40,10)

#define	CARBINE_FIREMODE_SINGLE \
	SETDISPERSION(3,6); \
	SETRATEOFFIRE(1,2,300); \
	SETMAXRANGETABLE(500,150,30)

#define	CARBINE_FIREMODE_FULLAUTO \
	SETDISPERSION(4,8); \
	SETRATEOFFIRE(0.1,2,50); \
	SETMAXRANGETABLE(100,40,10)

#define	LMG_FIREMODE_SINGLE \
	SETDISPERSION(3,6); \
	SETRATEOFFIRE(1,2,500); \
	SETMAXRANGETABLE(500,250,50)

#define	LMG_FIREMODE_FULLAUTO_Medium \
	SETDISPERSION(4,8); \
	SETRATEOFFIRE(0.1,2,300); \
	SETMAXRANGETABLE(300,150,0)

#define	LMG_FIREMODE_FULLAUTO_LONG \
	SETDISPERSION(4,8); \
	SETRATEOFFIRE(0.1,2,900); \
	SETMAXRANGETABLE(1000,500,100); \
	burst = 10




#define RIFLE_DISPERSION \
    aiDispersionCoefX = 15; \
    aiDispersionCoefY = 16;

#define MGUN_DISPERSION \
    aiDispersionCoefX = 20; \
    aiDispersionCoefY = 21;

#define NADE_DISPERSION \
    aiDispersionCoefX = 25; \
    aiDispersionCoefY = 26;