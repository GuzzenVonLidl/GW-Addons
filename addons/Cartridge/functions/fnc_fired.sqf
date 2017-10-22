/*
	AUTHOR: GuzzenVonLidl

	Usage:
	[] call GW_Cartridge_fnc_fired

	Parameters: None

	Return Value: None

	Public: NO
*/
#include "script_Component.hpp"

params ["_unit","_muzzle","_weapon","_type","_ammo"];

if (count GVAR(Array) > 1000) exitWith {
	[] call FUNC(handler);
	false
};

private _cartridge = (getText (configFile >> "CfgAmmo" >> _ammo >> "cartridge"));
private _cartridgeModel = (getText (configFile >> "CfgVehicles" >> _cartridge >> "model"));
private _position = (getPosATL _unit);
_position params ["_posX", "_posY", "_posZ"];
_position = [_posX + (random 2) - 1, _posY + (random 2) - 1, _posZ];

if (_cartridge isEqualTo "") then {
//	_cartridge = "FxCartridge_556";
};

if !(_cartridge isEqualTo "") then {
	_c = createSimpleObject [_cartridge, [0,0,0]];
	_c setDir (random 360);
	_c setPosATL _position;
	_c setVectorUp [0,0,1];
	GVAR(Array) pushBack _c;
	_c setVariable [QGVAR(RemovalTimer), 10];
};
