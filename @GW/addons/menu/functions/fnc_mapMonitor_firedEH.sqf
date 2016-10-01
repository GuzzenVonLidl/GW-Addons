//	REFRENCE: \x\gw\addons\menu\functions\fnc_mapMonitor_handler
#include "script_component.hpp"

if (GVAR(mapMonitor_Enabled)) then {
	params ["_unit","","","","","","_projectile"];
	[_unit, _projectile, (getPos _projectile), time] spawn {
		private ["_endTime", "_markers", "_trackProj"];
		params ["_unit","_projectile","_startPos","_startTime"];
		_endTime = (time + GVAR(mapMonitor_bulletMaxFlighttime));
		_markers = [];
		_trackProj = true;
		while {_trackProj} do {
			_trackProj = !((isNull _projectile) || {!(alive _projectile)} || {time > _endTime});
			if (_trackProj) then {
				{deleteMarkerLocal _x} forEach _markers;
				_markers = [_unit, _startPos, (getPos _projectile), _startTime, time] call FUNC(mapMonitor_drawBulletMarker);
				uiSleep (1/GVAR(mapMonitor_bulletMarkerRefreshRate));
			} else {
				uiSleep GVAR(mapMonitor_bulletMarkerLifetime);
				{deleteMarkerLocal _x} forEach _markers;
			};
		};
	};
};
