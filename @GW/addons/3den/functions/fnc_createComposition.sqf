/*

	[] spawn GW_3DEN_fnc_createComposition;

*/
#include "script_component.hpp"

switch (_this select 0) do {
	case 2: {
		["Composition is just pre placed objects. It is easily used but also created, make sure the objects you want to have in it is selected and have the player close because he is used as a ""center"" of all objects","About Composition"] call BIS_fnc_3DENShowMessage;

	};

	default {
		if (isNull player) exitWith { ["No player unit found!","Warning!"] call BIS_fnc_3DENShowMessage; };

		private ["_strArr","_CopyObjects","_count"];
		private ["_start","_end","_final"];
		_strArr = [];
		_CopyObjects = [];
		_count = -1;
		_strArr = _strArr + toArray(format ["class EXAMPLE { %1	name = ""EXAMPLE""; %1	side = 8; %1	icon = ""\a3\Ui_f\data\Map\VehicleIcons\iconVehicle_ca.paa"";%1", toString [10]]);

		{
			if !(_x isKindOf "CAManBase") then {
				_count = _count + 1;
				_pos = player worldToModel (position _x);
				_strArr = _strArr + toArray(format ["	class Object%1 { side = 8; rank = """";  vehicle = ""%2""; dir = %3; position[] = {%4,%5,%6}; };%7", _forEachIndex, typeOf _x, round(getDir _x), (_pos select 0), (_pos select 1), (_pos select 2), toString [10]]);
			};
		} forEach get3DENSelected "object";
		_strArr = _strArr + toArray(format ["}; %1", toString [10]]);

		systemChat format ["%1 Objects Copied", (_count)];
		copyToClipboard (format ["%1", (toString(_strArr))]);
	};
};
