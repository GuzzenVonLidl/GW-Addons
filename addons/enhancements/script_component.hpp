#define COMPONENT enhancements
#include "\x\gw\addons\main\script_mod.hpp"

//#define DEBUG_ENABLED_enhancements

#ifdef DEBUG_ENABLED_enhancements
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_enhancements
    #define DEBUG_SETTINGS DEBUG_SETTINGS_enhancements
#endif

#include "\x\gw\addons\main\script_macros.hpp"


#define MAXLOAD140 \
    maximumLoad = 140;

#define MAXLOAD280 \
    maximumLoad = 280;

#define MAXLOAD320 \
    maximumLoad = 320;



#define LAUNCHER \
	aiAmmoUsageFlags = "64 + 128 + 256 + 512"; \
	airLock = 0; \
	allowAgainstInfantry = 1; \
	cost = 100; \
	soundFly[] = {"A3\Sounds_F\weapons\Rockets\rocket_fly_1",6,0.85,500}; \
	whistleDist = 32;

#define LAUNCHER_NOSOUND \
	aiAmmoUsageFlags = "64 + 128 + 256 + 512"; \
	airLock = 0; \
	allowAgainstInfantry = 1; \
	cost = 100;
