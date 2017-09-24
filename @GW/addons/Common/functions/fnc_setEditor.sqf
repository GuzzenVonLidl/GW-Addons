/*
	Author: GuzzenVonLidl

	Usage:
	[] call GW_Common_Fnc_setEditor;

	Arguments: NO

	Return Value: NO

	Public: NO

*/
#include "script_Component.hpp"

_allPlayers = {((_x get3DENAttribute "ControlMP") select 0) || ((_x get3DENAttribute "ControlSP") select 0)} count ((all3DENEntities select 0) + (all3DENEntities select 3));

set3DENMissionAttributes [
	["Multiplayer", "MinPlayers", 1],
	["Multiplayer", "MaxPlayers", _allPlayers],
	["Multiplayer", "DisabledAI", true],
	["Multiplayer", "JoinUnassigned", true],
	["Multiplayer", "Respawn", 3],
	["Multiplayer", "RespawnDelay", 30],
	["Multiplayer", "RespawnDialog", false],
	["Multiplayer", "EnableTeamSwitch", false],
	["Multiplayer", "AIKills", false],
	["GarbageCollection", "DynSimEnabled", false]
];

LOG("Settings Configured");
