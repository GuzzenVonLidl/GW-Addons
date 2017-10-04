//	["Ammo Box - Squad",{ ["small_box","Box_NATO_Ammo_F", player] remoteExecCall [QFUNC(spawnBox), 2] }],

params ["_type","_class","_unit"];

_box = createVehicle [_class, [0,0,0], [], 0, "NONE"];
_box setPos (_unit getRelPos [3, 0]);
[_box, [_type, toLower(str(side _unit)), true]] call GW_Gear_Fnc_Handler;
