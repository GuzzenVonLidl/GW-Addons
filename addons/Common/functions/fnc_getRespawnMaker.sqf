/*	================================================================
	AUTHOR: GuzzenVonLidl

	Description:
		Gets the correct respawn marker for the side the player is on

	Usage:
		[_unit] call GOL_Fnc_GetSide;

	Parameters:
		#0:	OBJECT - Gets side of player

	Returning Value:
		Respawn marker name
	#define NO_SIDE -1
	#define EAST 0
	#define WEST 1
	#define RESISTANCE 2
	#define CIVILIAN 3
	#define NEUTRAL 4
	#define ENEMY 5
	#define FRIENDLY 6
	#define LOGIC 7
// ================================================================ */
//[0] call BIS_fnc_sideName;
//[0] call BIS_fnc_sideType;

params ["_unit"];
private _side = (getNumber(configfile >> "CfgVehicles" >> typeOf player >> "side"));
if ((_side < 0) || (_side > 2)) then {
	"respawn_civilian"
} else {
	["respawn_east","respawn_west","respawn_resistance"] select _side
};
