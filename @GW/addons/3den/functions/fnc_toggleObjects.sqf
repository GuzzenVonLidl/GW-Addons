/*

	[] call GW_3DEN_fnc_toggleObjects

*/
#include "script_component.hpp"

params ["_case"];

if (is3DEN) then {
	#define	TOGGLEOBJECT(Var1,Var2) (format ["(nearestObject %1) hideObjectGlobal %2;", Var1, Var2])
	#define	TOGGLEOBJECTS(Var1,Var2,Var3) (format ["{_x hideObjectGlobal %3;} forEach (nearestObjects [%1, [], %2, true]);", Var1, Var2, Var3])

	private _location = ((uiNamespace getVariable "bis_fnc_3DENEntityMenu_data") select 0);
	private _hideRadius = ("Preferences" get3DENMissionAttribute "GW_HideObjectRadius");
	private _showRadius = ("Preferences" get3DENMissionAttribute "GW_ShowObjectRadius");

	private _return = "";
	private _searchArea = [];

	GVAR(objectsToHide) = [];
	GVAR(objectsToShow) = [];

	if (_case) then {
		if (_hideRadius isEqualTo 0) then {
			_searchArea pushBack (nearestObject _location);
		} else {
			_searchArea = (nearestObjects [_location, [], _hideRadius]);
		};
	} else {
		if (_showRadius isEqualTo 0) then {
			_searchArea pushBack (nearestObject _location);
		} else {
			_searchArea = (nearestObjects [_location, [], _showRadius]);
		};
	};

	if (({!(_x in (all3DENEntities select 0))} count _searchArea) isEqualTo 0) then {
		systemChat "No objects found, try extending the radius";
	} else {
		if (_case) then {
			if (_hideRadius isEqualTo 0) then {
				_return = TOGGLEOBJECT(_location, _case);
			} else {
				_return = TOGGLEOBJECTS(_location, _hideRadius, _case);
			};
			systemChat format ["Total objects hidden: %1", (count _searchArea)];
		} else {
			if (_showRadius isEqualTo 0) then {
				_return = TOGGLEOBJECT((nearestObject _location), _case);
			} else {
				_return = TOGGLEOBJECTS(_location, _showRadius, _case);
			};
			systemChat format ["Total objects shown: %1", (count _searchArea)];
		};
		copyToClipboard _return;
		[] call compile _return;
	};
};
