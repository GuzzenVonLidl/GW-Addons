/*
	Author: GuzzenVonLidl
	Copy units, vehicles and waypoints

	Usage:
	[] call GW_3den_fnc_CopyGroup;

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
#define DEBUG_MODE_FULL
#include "script_component.hpp"
#define	GETATTRIBUTE(Var) ((_x get3DENAttribute Var) select 0)

private _units = [];
private _groupWaypoint = [];
private _vehicles = [];

{
	if (_x isKindOf "AllVehicles") then {
		private _special = [];
		if !(GETATTRIBUTE("init") isEqualTo "") then {
			_special pushBack ["init", GETATTRIBUTE("init")];
		};
		if !(GETATTRIBUTE("enableSimulation")) then {
			_special pushBack ["simulation", GETATTRIBUTE("enableSimulation")];
		};
		if !(GETATTRIBUTE("allowDamage")) then {
			_special pushBack ["damage", GETATTRIBUTE("allowDamage")];
		};
		if !(GETATTRIBUTE("lock") isEqualTo 1) then {
			_special pushBack ["lock", GETATTRIBUTE("lock")];
		};
		if (GETATTRIBUTE("dynamicSimulation")) then {
			_special pushBack ["dynamic", GETATTRIBUTE("dynamicSimulation")];
		};
		if (GETATTRIBUTE("addToDynSimGrid")) then {
			_special pushBack ["addToDyn", GETATTRIBUTE("addToDynSimGrid")];
		};

		if (_x isKindOf "CAManBase") then {
			_units pushBack [GETATTRIBUTE("position"),GETATTRIBUTE("rotation") select 2, _special];
		} else {
			private _crewList = [];
			private _crew = (fullCrew _x);
			if (count _crew > 0) then {
				{
					if (_x select 4) then {	// Force FFV to cargo instead of turret
						_crewList pushBack ["cargo", (_x select 2), (_x select 3)];
					} else {
						_crewList pushBack [(_x select 1), (_x select 2), (_x select 3)];
					};
				} forEach _crew;
			};
			_vehicles pushBack [GETATTRIBUTE("itemClass"),GETATTRIBUTE("position"),GETATTRIBUTE("rotation") select 2, _crewList, _special];
		};
	};
} forEach get3DENSelected "object";

{
	private ["_speed","_formation"];
	private _waypointSettings = [];
	TRACE_1("New Waypoint", _x);

	_waypointSettings pushBack GETATTRIBUTE("position");
	_waypointSettings pushBack GETATTRIBUTE("itemClass");
	_waypointSettings pushBack GETATTRIBUTE("behaviour");
	_waypointSettings pushBack GETATTRIBUTE("combatMode");
	_waypointSettings pushBack GETATTRIBUTE("completionRadius");

	switch GETATTRIBUTE("formation") do {
		case 0: {
			_formation = "NO CHANGE";
		};
		case 1: {
			_formation = "WEDGE";
		};
		case 2: {
			_formation = "VEE";
		};
		case 3: {
			_formation = "LINE";
		};
		case 4: {
			_formation = "COLUMN";
		};
		case 5: {
			_formation = "FILE";
		};
		case 6: {
			_formation = "STAG COLUMN";
		};
		case 7: {
			_formation = "ECH LEFT";
		};
		case 8: {
			_formation = "ECH RIGHT";
		};
		case 9: {
			_formation = "DIAMOND";
		};
	};
	_waypointSettings pushBack _formation;

	switch GETATTRIBUTE("speedMode") do {
		case 0: {
			_speed = "UNCHANGED";
		};
		case 1: {
			_speed = "LIMITED";
		};
		case 2: {
			_speed = "NORMAL";
		};
		case 3: {
			_speed = "FULL";
		};
	};
	_waypointSettings pushBack _speed;
	_groupWaypoint pushBack _waypointSettings;
} forEach get3DENSelected "waypoint";

copyToClipboard format ["%1 call GW_Common_fnc_spawnGroup;", [_units, _vehicles, _groupWaypoint]];
systemChat format ["%1 units, %2 vehicles, %3 waypoints copied", (count _units), (count _vehicles), (count _groupWaypoint)];

TRACE_1("Units", _units);
TRACE_1("Waypoints", _groupWaypoint);
TRACE_1("Objects", _vehicles);
