#include "script_Component.hpp"
/*
	Author: GuzzenVonLidl

	Usage:
	[] call GW_Common_Fnc_setEditor;

	Arguments: NO

	Return Value: NO

	Public: NO

*/

_allPlayers = {((_x get3DENAttribute "ControlMP") select 0) || ((_x get3DENAttribute "ControlSP") select 0)} count ((all3DENEntities select 0) + (all3DENEntities select 3));

set3DENMissionAttributes [
	["Scenario", "Saving", false],
	["GarbageCollection", "DynSimEnabled", false],
	["Multiplayer", "AIKills", false],
	["Multiplayer", "DisabledAI", true],
	["Multiplayer", "EnableTeamSwitch", false],
	["Multiplayer", "JoinUnassigned", true],
	["Multiplayer", "MaxPlayers", _allPlayers],
	["Multiplayer", "MinPlayers", 1],
	["Multiplayer", "Respawn", 3],
	["Multiplayer", "RespawnDelay", 30],
	["Multiplayer", "RespawnDialog", false]
];

LOG("Settings Configured");
