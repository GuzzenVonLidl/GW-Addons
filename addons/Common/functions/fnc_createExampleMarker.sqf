#include "script_Component.hpp"

params ["_pos"];
_pos params ["_x","_y"];
_m = createMarker [format["mPos%1%2",floor(_x),floor(_y)],_pos];
_m setmarkerColor (_this select 1);
_m setMarkerShape "Icon";
_m setMarkerType "mil_dot";
