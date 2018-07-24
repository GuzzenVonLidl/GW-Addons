#include "\x\cba\addons\main\script_macros_common.hpp"
//	#include "\x\cba\addons\xeh\script_xeh.hpp"

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) TRIPLES(ADDON,fnc,fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define	ISADMIN	(GVARMAIN(isAdmin) || (serverCommandAvailable "#logout"))

#define	GUZZENVONLIDL	"76561197993196728"
#define	ARROW "76561197971568283"
#define	OKSMAN	"76561198013929549"
#define	R4IDER	"76561197985030555"
#define	RAPTOR	"76561198076457189"
#define	FILTHY "76561198014971848"
#define	JASON "76561198020957858"
#define	PARKER "76561198003452927"

#define REMOTEONLYSERVER(A) remoteExecCall [A, 2]
#define MAPLOADED getClientStateNumber >= 9 || !isMultiplayer
#define MISSIONLOADED getClientStateNumber >= 10 || !isMultiplayer

#define	DEVCONSOLE(VAR1)	"debug_console" callExtension (VAR1)

#define conBeep DEVCONSOLE("A")
#define conClear DEVCONSOLE("C")
#define conClose DEVCONSOLE("X")

// *************************************	// Do not edit below
// Internal
#define	FALSE -1
#define	TRUE -2
#define PRIVATE 0
#define PUBLIC 2

#define NO_SIDE -1
#define EAST 0			// (Russian)
#define WEST 1			// (NATO)
#define RESISTANCE 2	// Guerilla
#define CIVILIAN 3
#define NEUTRAL 4
#define ENEMY 5
#define FRIENDLY 6
#define LOGIC 7
