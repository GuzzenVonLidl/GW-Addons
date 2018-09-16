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
#define	ISACTIVEADMIN	(GVARMAIN(isActiveAdmin) || (serverCommandAvailable "#logout"))

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
