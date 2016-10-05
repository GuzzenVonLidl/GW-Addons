#include "\x\cba\addons\main\script_macros_common.hpp"
//	#include "\x\cba\addons\xeh\script_xeh.hpp"

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define	GUZZENVONLIDL	"76561197993196728"
#define	R4IDER	"76561197985030555"
#define	BARON	"76561197970696678"
#define	RAPTOR	"76561198076457189"
#define	FILTHY "76561198014971848"


//#define	CHRIS	"76561197973520734"
