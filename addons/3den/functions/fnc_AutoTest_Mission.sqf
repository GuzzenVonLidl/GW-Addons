#include "script_Component.hpp"
#define	SETTING(Var1)	getText(missionConfigFile >> "GW_FRAMEWORK" >> "Naming" >> Var1)

private _output = [];
private _approved = 0;
private _warning = 1;
private _error = 2;

if (toUpper(SETTING("GameMode")) isEqualTo "GW") then {
	_output pushBack [_error, "GameMode Invalid", "If this is not fixed it will be harder to find it, Make sure you edit this in the description.ext", [5]];
} else {
	_output pushBack [_approved,"GameMode"];
};

if !((toLower(getText(missionConfigFile >> "briefingName")) find "framework") isEqualTo -1) then {
	_output pushBack [_error,"Mission has no name or is named framework", "Without a name you cant select the mission! Make sure you edit this in the description.ext", [5]];
} else {
	_output pushBack [_approved,"Name Okay"];
};

if (((SETTING("Picture")) isEqualTo "") || ((SETTING("Picture")) isEqualTo "\x\gw\addons\3den\data\Logo_GOL_1.paa")) then {
	_output pushBack [_warning,"No Picture Found or default loaded", "Make sure you edit this in the description.ext", [5]];
} else {
	_output pushBack [_approved,"Usage Of Picture"];
};

if (((SETTING("Author")) isEqualTo "") || (toLower(SETTING("Author")) isEqualTo "guzzenvonlidl")) then {
	_output pushBack [_error,"Author not configured", "Make sure you edit this in the description.ext", [5]];
} else {
	_output pushBack [_approved,"Author Configured"];
};

if ((count (getArray(missionConfigFile >> "GW_FRAMEWORK" >> "Naming" >> "AuthorUID") - ["_SP_PLAYER_"])) isEqualTo 0) then {
	_output pushBack [_warning,"No Admins Configured", "Info about this on GW-Framework Wiki", [5]];
} else {
	_output pushBack [_approved,format ["Admins Configured: %1", (count (getArray(missionConfigFile >> "GW_FRAMEWORK" >> "Naming" >> "AuthorUID") - ["_SP_PLAYER_"]))]];
};

_output
