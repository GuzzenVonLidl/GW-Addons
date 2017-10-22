#include "script_Component.hpp"

params ["_find", "_modes"];
_index = (_modes find (toUpper _find));
_arr1 = [];
_arr2 = [];

if (_index isEqualTo -1) then {
	{
		_arr1 pushBack (_x select 0);
		_arr2 pushBack (_x select 1);
	} forEach (_modes select {(_x isEqualType [])});
	_index = (_arr1 find _find);

	if !(_index isEqualTo -1) then {
		[(_arr1 select _index), (_arr2 select _index), _index]
	} else {
		[-1, 0, 0]
	};
} else {
	[_index, 0, 0]
};
