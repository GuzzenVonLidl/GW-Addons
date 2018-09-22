#include "script_component.hpp"
/*
	Author: GuzzenVonLidl
	Copy units, vehicles and waypoints

	Usage:
	[] call GW_3den_fnc_copyLoadout;

	Arguments: NO

	Return Value: YES <ARRAY>

	Public: NO
*/
#define	GETATTRIBUTE(Var1) ((_x get3DENAttribute Var1) select 0)
#define	GETMAGAZINE(Var1) (getArray(configfile >> "CfgWeapons" >> Var1 >> "magazines"))


//_return = [];
private _arr = [player];
private _lineBreak = (toString [10]);
private _tab = toString [9];
private _return = toArray(format ["// Weapon / Attach / Compatible Mags %1", _lineBreak]);

_return = _return + toArray(format ["[ %1 %2", _lineBreak, _tab]);

if (is3DEN) then {
	_arr = (get3DENSelected "object");
};

{
	_return = _return + toArray(format ["%1, // Primary %2 %3", ([primaryWeapon _x] + [(primaryWeaponItems _x)] + [GETMAGAZINE(primaryWeapon _x)]), _lineBreak, _tab]);
	_return = _return + toArray(format ["%1, // Secondary %2 %3", ([secondaryWeapon _x] + [(secondaryWeaponItems _x)] + [GETMAGAZINE(secondaryWeapon _x)]), _lineBreak, _tab]);
	_return = _return + toArray(format ["%1, // Handgun %2 %3", ([handgunWeapon _x] + [(handgunItems _x)] + [GETMAGAZINE(handgunWeapon _x)]), _lineBreak, _tab]);
	_return = _return + toArray(format ["%1, // Cloths %2 %3", ([(goggles _x),(headgear _x),(uniform _x),(vest _x),(backpack _x)]), _lineBreak, _tab]);
	_return = _return + toArray(format ["%1, // Items Uniform %2 %3", (uniformItems _x), _lineBreak, _tab]);
	_return = _return + toArray(format ["%1, // Items Vest %2 %3", (vestItems _x), _lineBreak, _tab]);
	_return = _return + toArray(format ["%1 // Items Backpack %2", (backpackItems _x), _lineBreak]);
} forEach _arr;
_return = _return + toArray(format ["]; %1", _lineBreak]);

if (is3DEN) then {
	if ("Preferences" get3DENMissionAttribute "GW_CopyToClipboard") then {
		copyToClipboard (toString(_return));
	};

	if ("Preferences" get3DENMissionAttribute "GW_PrintToConsoleLog") then {
		"debug_console" callExtension (_return + "#1111");
	};

	if ("Preferences" get3DENMissionAttribute "GW_PrintToConsoleFile") then {
		"debug_console" callExtension (_return + "~0001");
	};
} else {
	copyToClipboard (toString(_return));
};
