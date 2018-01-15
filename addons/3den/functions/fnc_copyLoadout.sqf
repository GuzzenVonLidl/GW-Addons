/*
	Author: GuzzenVonLidl
	Copy units, vehicles and waypoints

	Usage:
	[] call GW_3den_fnc_copyLoadout;

	Arguments: NO

	Return Value: YES <ARRAY>
	#0:	ARRAY - Units 		[pos,dir]
	#1:	ARRAY - Vehicles	[class,pos,dir]
	#2:	ARRAY - Waypoints	[pos,type,behaviour,combatMode,completionRadius,formation,speedMode]

	Public: NO

	https://community.bistudio.com/wiki/get3DENSelected
	https://community.bistudio.com/wiki/Eden_Editor:_Setting_Attributes#Trigger

	Type							itemClass
	Description						description
	Order							order
	Identified						name
	Position						position
	Placement Radius				placementRadius
	Completion Radius				completionRadius
	Combat Mode						combatMode
	Behavior						behaviour
	Formation						formation
	SpeedMode						speedMode
	Condition						condition
	On Activation					onActivation
	Script							script
	Map Visibility					show2D
	Scene Visibility				show3D
	Timer Values					timeout
	Effect Condition				effectCondition
	Sound							sound
	Voice							voice
	Environment						soundEnvironment
	Music							music
	UI Overlay						title
*/
#include "script_component.hpp"
#define	GETATTRIBUTE(Var) ((_x get3DENAttribute Var) select 0)

private _units = [];

{

} forEach (get3DENSelected "object");

//	_array pushBack str(getUnitLoadout _x);
_br = toString [13,10];
_string = "";
{
	_string = _string + str(getUnitLoadout _x);
	_string = _string + _br;
} forEach (get3DENSelected "object");
copyToClipboard _string;
_string;



_goggles = "";
_helmet = "";
_uniform = "";
_vest = "";
_backpack = "";

_br = toString [13,10];
_string = "";
{
	_goggles = goggles _x;
	_helmet = headgear _x;
	_uniform = uniform _x;
	_vest = vest _x;
	_backpack = backpack _x;

	_string = _string + str[_goggles,_helmet,_uniform,_vest,_backpack];
	_string = _string + _br;
} forEach (get3DENSelected "object");
copyToClipboard _string;
_string;

if ("Preferences" get3DENMissionAttribute "GW_CopyToClipboard") then {
	copyToClipboard _return;
};

if ("Preferences" get3DENMissionAttribute "GW_PrintToConsoleLog") then {
	"debug_console" callExtension (_return + "#1111");
};

if ("Preferences" get3DENMissionAttribute "GW_PrintToConsoleFile") then {
	"debug_console" callExtension (_return + "~0001");
};

//	[[],QFUNC(copyLoadout)] call FUNC(uiSaveFunction);
