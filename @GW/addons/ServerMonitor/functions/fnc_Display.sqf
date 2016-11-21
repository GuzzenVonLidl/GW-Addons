/*
*	Author: GuzzenVonLidl
*	Outputs server info for admins to debug
*
*	Usage:
*	[] spawn GW_ServerMonitor_Fnc_Display;
*	Arguments: NO
*
*	Return Value: NO
*
*	Public: NO
*
*/
#include "script_component.hpp"

private _server = 0;
private _listHC = [];
private _listPlayers = [];

{
	switch (_x select 0) do {
		case 1: {
			_server = (_x select 1);
		};
		case 2: {
			_listHC pushBack (_x select 1);
		};
		default {
			_listPlayers pushBack (_x select 1);
		};
	};
} forEach GVAR(infoFPS);

private _fps = [_server, (_listHC call EFUNC(Common,findAverage)), (_listPlayers call EFUNC(Common,findAverage))];
//GVAR(infoHC) sort false; // <---

if (DEVCONSOLEENABLED) then {
	DEVCONSOLE("#1110");
	LOG(FORMAT_1("Last updated: %1", time));
	LOG(FORMAT_4("AllUnits - Total: %1 | West: %2 | East: %3 | Indep: %4", (count allUnits),({side _x == west} count allUnits),({side _x == east} count allUnits),({side _x == independent} count allUnits)));
	LOG(FORMAT_4("AllGroups - Total: %1 | West: %2 | East: %3 | Indep: %4", (count allGroups),({side _x == west} count allGroups),({side _x == east} count allGroups),({side _x == independent} count allGroups)));
	LOG(FORMAT_5("Players - Total: %1 | West: %2 | East: %3 | Indep: %4 | Headless: %5", (count allPlayers),({side _x == west} count allPlayers),({side _x == east} count allPlayers),({side _x == independent} count allPlayers),({_x isKindOf "HeadlessClient_F"} count allPlayers)));
	LOG(FORMAT_3("FPS - Server: %1 | Headless: %2 | Players: %3", (_fps select 0),(_fps select 1),(_fps select 2)));
	{
		LOG(FORMAT_4("%1 - Groups: %2 | Units: %3 | FPS: %4", (_x select 0),(_x select 1),(_x select 2),(_x select 3)));
	} forEach GVAR(infoHC);
} else {
	private _temp = "";
	_temp = composeText [_temp,(parseText format["<t align='left' color='#FFFFFF'>AllUnits: </t><t align='left' color='#FFD30D'>%1  </t><t align='left' color='#00FFFF'>W: %2  </t><t align='left' color='#FF0000'>E: %3  </t><t align='left' color='#00FF00'>I: %4  </t><t align='left' color='#FF00FF'>C: %5</t>",(count allUnits),({side _x == west} count allUnits),({side _x == east} count allUnits),({side _x == independent} count allUnits),({side _x == civilian} count allUnits)]), lineBreak];
	_temp = composeText [_temp,(parseText format["<t align='left' color='#FFFFFF'>AllGroups: </t><t align='left' color='#FFD30D'>%1  </t><t align='left' color='#00FFFF'>W: %2  </t><t align='left' color='#FF0000'>E: %3  </t><t align='left' color='#00FF00'>I: %4  </t><t align='left' color='#FF00FF'>C: %5</t>",(count allGroups),({side _x == west} count allGroups),({side _x == east} count allGroups),({side _x == independent} count allGroups),({side _x == civilian} count allGroups)]), lineBreak];
	_temp = composeText [_temp,(parseText format["<t align='left' color='#FFFFFF'>Players: </t><t align='left' color='#FFD30D'>%1  </t><t align='left' color='#00FFFF'>W: %2  </t><t align='left' color='#FF0000'>E: %3  </t><t align='left' color='#00FF00'>I: %4  </t><t align='left' color='#FF00FF'>C: %5  </t><t align='left' color='#FFD30D'>HC: %6</t>",(count allPlayers),({side _x == west} count allPlayers),({side _x == east} count allPlayers),({side _x == independent} count allPlayers),({side _x == civilian} count allPlayers),({_x isKindOf "HeadlessClient_F"} count allPlayers)]), lineBreak];
	_temp = composeText [_temp,(parseText format["<t align='left' color='#FFFFFF'>FPS:  <t align='left' color='#FFD30D'>Server: %1  |  Headless: %2  |  Players: %3</t>", (_fps select 0),(_fps select 1),(_fps select 2)]), lineBreak, lineBreak];

	{
		_temp = composeText [_temp,(parseText format["<t align='left' color='#FFFFFF'>Machine:<t align='right' color='#FFD30D'>%1</t>", (_x select 0)]), lineBreak];
		_temp = composeText [_temp,(parseText format["<t align='left' color='#FFFFFF'>Groups:<t align='right' color='#FFD30D'>%1</t>", (_x select 1)]), lineBreak];
		_temp = composeText [_temp,(parseText format["<t align='left' color='#FFFFFF'>Units:<t align='right' color='#FFD30D'>%1</t>", (_x select 2)]), lineBreak];
		_temp = composeText [_temp,(parseText format["<t align='left' color='#FFFFFF'>FPS:<t align='right' color='#FFD30D'>%1</t>", (_x select 3)]), lineBreak, lineBreak];
	} forEach GVAR(infoHC);
	hintSilent _temp;
};
// Reset variables
GVAR(infoFPS) = [];
GVAR(infoHC) = [];
