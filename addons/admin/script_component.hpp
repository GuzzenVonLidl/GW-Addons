#define COMPONENT admin
#include "\x\gw\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_ADMIN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_admin
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ADMIN
#endif

#include "\x\gw\addons\main\script_macros.hpp"

#define	GUZZENVONLIDL	"76561197993196728"
#define	ARROW "76561197971568283"
#define	OKSMAN	"76561198013929549"
#define	FILTHY "76561198014971848"
#define	PARKER "76561198003452927"
#define PILGRIM "76561198005972885"
#define HOOFED	"76561197997596120"
#define BLU	"76561198086056020"

#define	ADMINLIST GUZZENVONLIDL, ARROW, OKSMAN, FILTHY, PARKER, PILGRIM, HOOFED, BLU

#define	ACTIVE_LIST (GVARMAIN(activeAdmins) + [getAssignedCuratorUnit GW_ZeuzModuleAdminLogged])
