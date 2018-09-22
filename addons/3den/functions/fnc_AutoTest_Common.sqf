#include "script_Component.hpp"

private _output = [];
private _approved = 0;
private _warning = 1;
private _error = 2;

if (call EFUNC(Common,isDevBuild)) then {
	_output pushBack [_warning,"Debug mode is enabled", "", [0]];
};

if ("Scenario" get3DENMissionAttribute "SaveBinarized") then {
	_output pushBack [_warning, "Mission is set to Binarized, please make sure this is the final export", "", [1]];
};

if (("Intel" get3DENMissionAttribute "IntelTime") isEqualTo 12) then {
	_output pushBack [_warning, "Please consider changing the time of day, Currently set to 12:00", "Please also consider changin the weather from default", [2]];
};

if ((west getFriend independent) isEqualTo 1) then {
	_output pushBack [_warning,"Independent is friendly to BLUFOR", "", [1]];
};
if ((east getFriend independent) isEqualTo 1) then {
	_output pushBack [_warning,"Independent is friendly to OPFOR", "", [1]];
};

_allPlayable = ((all3DENEntities select 0) select {((_x get3DENAttribute "ControlMP") select 0) || ((_x get3DENAttribute "ControlSP") select 0)});
_west = (_allPlayable select {(side _x) isEqualTo blufor});
_east = (_allPlayable select {(side _x) isEqualTo opfor});
_indep = (_allPlayable select {(side _x) isEqualTo independent});

if !((count _west) isEqualTo 0) then {
	_marker = ((all3DENEntities select 5) select {!((_x find "respawn_west") isEqualTo -1)});
	if ((count _marker) isEqualTo 0) then {
		_output pushBack [_error,"No Respawn marker found for BLUFOR", "If this is not fixed BLUFOR can not respawn!, Either consider adding the marker or removing any units on this side", [-1]];
	} else {
		if ((count _marker) > 1) then {
			_output pushBack [_warning, "Multiple Respawn markers found for BLUFOR", "If there is more then one, players will randomly spawn at one of them", [-1]];
		} else {
			_unit = (_west select 0);
			_distance = (_unit distance2D (((_marker select 0) get3DENAttribute "position") select 0));
			if (_distance >= 100) then {
				_output pushBack [_warning, format ["BLUFOR Respawn marker is %2m from %1.", ((_unit get3DENAttribute "description") select 0), round(_distance)], "", [3, (_marker select 0)]];
			};
		};
	};
};

if !((count _east) isEqualTo 0) then {
	_marker = ((all3DENEntities select 5) select {!((_x find "respawn_east") isEqualTo -1)});
	if ((count _marker) isEqualTo 0) then {
		_output pushBack [_error,"No Respawn marker found for OPFOR", "If this is not fixed OPFOR can not respawn!, Either consider adding the marker or removing any units on this side", [-1]];
	} else {
		if ((count _marker) > 1) then {
			_output pushBack [_warning, "Multiple Respawn markers found for OPFOR", "If there is more then one, players will randomly spawn at one of them", [-1]];
		} else {
			_unit = (_east select 0);
			_distance = (_unit distance2D (((_marker select 0) get3DENAttribute "position") select 0));
			if (_distance >= 100) then {
				_output pushBack [_warning, format ["OPFOR Respawn marker is %2m from %1.", ((_unit get3DENAttribute "description") select 0), round(_distance)], "", [3, (_marker select 0)]];
			};
		};
	};
};

if !((count _indep) isEqualTo 0) then {
	_marker = ((all3DENEntities select 5) select {!((_x find "respawn_resistance") isEqualTo -1)});
	if ((count _marker) isEqualTo 0) then {
		_output pushBack [_error,"No Respawn marker found for INDEPENDENT", "If this is not fixed INDEPENDENT can not respawn!, Either consider adding the marker or removing any units on this side", [-1]];
	} else {
		if ((count _marker) > 1) then {
			_output pushBack [_warning, "Multiple Respawn markers found for INDEPENDENT", "If there is more then one, players will randomly spawn at one of them", [-1]];
		} else {
			_unit = (_indep select 0);
			_distance = (_unit distance2D (((_marker select 0) get3DENAttribute "position") select 0));
			if (_distance >= 100) then {
				_output pushBack [_warning, format ["INDEPENDENT Respawn marker is %2m from %1.", ((_unit get3DENAttribute "description") select 0), round(_distance)], "", [3, (_marker select 0)]];
			};
		};
	};
};

if (isClass(missionConfigFile >> "GW_Modules" >> "Respawn")) then {
	if !("spectator" in (all3DENEntities select 5)) then {
		_output pushBack [_error,"Spectator marker is missing, Create a new marker and name it 'spectator', place it on land and out of AO", "", [-1]];
	};
};

if (isClass(missionConfigFile >> "GW_Modules" >> "MHQ")) then {
	_mhqCount = ({!((toLower((_x get3DENAttribute "name") select 0) find "mhq") isEqualTo -1)} count (all3DENEntities select 0));
	if (_mhqCount isEqualTo 0) then {
			_output pushBack [_warning,"No MHQ detected, Make sure this is not a mistake", "", [-1]];
	} else {
		_mhqError = false;
		{
			if ((((_x get3DENAttribute "name") select 0) find "mhq") isEqualTo 0) then {
				if !((([configfile >> "CfgVehicles" >> ((_x get3DENAttribute "ItemClass") select 0), true] call BIS_fnc_returnParents) find "Kart_01_Base_F") isEqualTo -1) then {
					_mhqError = true;
					_output pushBack [_error,"MHQ is currently a GO-Kart, Please change this so it wont break immersion", "", [4, _x]];
				};
			};
		} forEach (all3DENEntities select 0);

		_output pushBack [_warning,format ["%1 MHQ Vehicle(s) found, Confirm this is by design", _mhqCount], "", [-1]];
		if (_mhqError) then {
		};
	};
};

_aiCount = (count (allUnits - playableUnits - switchableUnits - [player]));
if (_aiCount > 100) then {
	if (_aiCount > 150) then {
		_output pushBack [_warning,format["You have placed %1 AI. You may wish to consider the performance impact.",_aiCount], "", [-1]];
	} else {
		_output pushBack [_error,format["%1 Units placed in the senario. You may wish to consider the performance impact.",_aiCount], "", [-1]];
	};
};

if !(isNil QEGVAR(Common,Faction)) then {
	switch (EGVAR(Common,Faction)) do {
		case "west": {
			if !((count _west) isEqualTo 0) then {
				_output pushBack [_warning,"AI spawn side set to West, West Players Detected", "", [-1]];
			};
		};
		case "east": {
			if !((count _east) isEqualTo 0) then {
				_output pushBack [_warning,"AI spawn side set to East, East Players Detected", "", [-1]];
			};
		};
		case "independent": {
			if !((count _indep) isEqualTo 0) then {
				_output pushBack [_warning,"AI spawn side set to Independent, Independent Players Detected", "", [-1]];
			};
		};
	};
};

_output
