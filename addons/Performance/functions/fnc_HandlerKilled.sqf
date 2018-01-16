/*
	Author: GuzzenVonLidl
	When a unit dies it deletes all magazines & items for the unit
	So that players cant loot

	Is only active if set to true at time of calling function
		GW_Performance_Unitenabled = true;

	Usage:
	[this] call GW_Performance_Fnc_HandlerKilled;

	Arguments:
	0: Unit <OBJECT>

	Return Value: NO

	Public: NO
*/
#include "script_component.hpp"

params ["_unit"];
if (!(GVAR(UnitEnabled)) || (isPlayer _unit)) exitWith {false};

{
	_unit removeItem _x;
} forEach (itemsWithMagazines _unit);

{
	_unit unlinkItem _x;
} forEach (assignedItems _unit);

_unit
