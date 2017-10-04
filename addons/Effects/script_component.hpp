#define COMPONENT effects
#include "\x\gw\addons\main\script_mod.hpp"

//#define DEBUG_ENABLED_3DEN

#ifdef DEBUG_ENABLED_3DEN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_3DEN
    #define DEBUG_SETTINGS DEBUG_SETTINGS_3DEN
#endif

#include "\x\gw\addons\main\script_macros.hpp"

#define __ATTENUATION \
    class Attenuation { \
		constant = 0; \
		linear = 0; \
		quadratic = 200; \
		hardLimitStart = 5; \
		hardLimitEnd = 15; \
};

#define SMOKE_COLOR_RED    {0.95, 0.04, 0.04, 0.8}
#define SMOKE_COLOR_GREEN  {0.03, 0.16, 0.10, 0.8}
#define SMOKE_COLOR_YELLOW {0.90, 0.60, 0.00, 0.8}
#define SMOKE_COLOR_PURPLE {0.46, 0.06, 0.30, 0.8}
#define SMOKE_COLOR_BLUE   {0.04, 0.20, 1.00, 0.8}
#define SMOKE_COLOR_ORANGE {0.90, 0.20, 0.01, 0.8}
