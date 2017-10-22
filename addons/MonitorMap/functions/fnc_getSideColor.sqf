#include "script_component.hpp"

params ["_unit"];

private _color = "ColorOrange";

switch (side _unit) do {
	case west: {
		_color = "ColorBlue";
	};
	case east: {
		_color = "ColorRed";
	};
	case independent: {
		_color = "ColorGreen";
	};
};

_color
