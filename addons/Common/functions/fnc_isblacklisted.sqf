#include "script_Component.hpp"

params ["_pos","_area"];
private _return = false;

if (_area isEqualTo "ICON") then {
  if (((_pos distance2D _center) isEqualTo 0)) then {
    _return = true;
  };
} else {
  _return = (_pos inArea _area);
};

_return
