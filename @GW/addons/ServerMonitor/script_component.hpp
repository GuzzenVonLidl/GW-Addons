#define COMPONENT ServerMonitor
#include "\x\gw\addons\main\script_mod.hpp"

//#define DEBUG_ENABLED_ServerMonitor

#ifdef DEBUG_ENABLED_ServerMonitor
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ServerMonitor
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ServerMonitor
#endif

#include "\x\gw\addons\main\script_macros.hpp"
