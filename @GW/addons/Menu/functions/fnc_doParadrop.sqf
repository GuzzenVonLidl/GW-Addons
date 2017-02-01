#include "script_component.hpp"

params ["_unit"];
cutText ["", "BLACK FADED",999];
private _vehicle = (vehicle _unit);
private _height = round((getPosASL _unit) select 2);
private _velocity = [((velocity _vehicle) select 0),((velocity _vehicle) select 1), (((velocity _vehicle) select 2) -10)];
private _backpack = (unitBackpack _unit);
private _pos = (_vehicle getRelPos [(sizeOF(typeOf _vehicle)/2) + 1, 180]);
_pos set [2, (getPos _vehicle) select 2];
_unit action ["Eject", _vehicle];
moveOut _unit;
_unit setPosATL _pos;
_unit setVelocity _velocity;

_unit setVariable [QGVAR(parachuteClass), (typeOf _backpack)];
_unit setVariable [QGVAR(parachuteMagazines), (getMagazineCargo _backpack)];
_unit setVariable [QGVAR(parachuteWeapons), (getWeaponCargo _backpack)];
_unit setVariable [QGVAR(parachuteItems), (getItemCargo _backpack)];
removeBackPack _unit;

[{
	cutText ["", "BLACK IN", 5];
}, [], 0.5] call CBA_fnc_waitAndExecute;

if (GVAR(ParadropHalo)) then {
	_unit addBackpack "B_Parachute";
} else {
	[{(((getPosATL player) select 2) <= GVAR(ParadropStaticHeight))}, {
		params ["_unit"];
		private _pos = (getPos _unit);
		private _chute = createVehicle ["NonSteerable_Parachute_F", _pos, [], 0, "NONE"];
		_chute setDir (getDir _unit);
		_chute setPos _pos;
		_unit moveInDriver _chute;
	}, [_unit]] call CBA_fnc_waitUntilAndExecute;
};

[{(isTouchingGround player) || (((getPos player) select 2) < 1) && (alive player)}, {
	params ["_unit"];
	private _vehicle = (vehicle _unit);
	private _backpackClass = (_unit getVariable [QGVAR(parachuteClass), ""]);
	private _magazines = (_unit getVariable [QGVAR(parachuteMagazines), []]);
	private _weapons = (_unit getVariable [QGVAR(parachuteWeapons), []]);
	private _items = (_unit getVariable [QGVAR(parachuteItems), []]);

	removeBackPack _unit;
	if !(_backpackClass isEqualTo "") then {
		_unit addBackpack _backpackClass;
		clearAllItemsFromBackpack _unit;
		for "_i" from 0 to (count (_magazines select 0) - 1) do {
			(unitBackpack _unit) addMagazineCargoGlobal [((_magazines select 0) select _i),((_magazines select 1) select _i)];
		};
		for "_i" from 0 to (count (_weapons select 0) - 1) do {
			(unitBackpack _unit) addWeaponCargoGlobal [((_weapons select 0) select _i),((_weapons select 1) select _i)];
		};
		for "_i" from 0 to (count (_items select 0) - 1) do {
			(unitBackpack _unit) addItemCargoGlobal [((_items select 0) select _i),((_items select 1) select _i)];
		};
		_unit setVariable [QGVAR(parachuteClass), nil];
		_unit setVariable [QGVAR(parachuteMagazines), nil];
		_unit setVariable [QGVAR(parachuteWeapons), nil];
		_unit setVariable [QGVAR(parachuteItems), nil];
	};
}, [_unit]] call CBA_fnc_waitUntilAndExecute;
