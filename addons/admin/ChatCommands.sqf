
["help", {
	[QGVAR(helpMsg), [(_this select 0), player], GVARMAIN(activeAdmins)] call CBA_fnc_targetEvent;
}, "all"] call CBA_fnc_registerChatCommand;

["send", {
	((_this select 0) splitString ":") params ["_name","_text"];
	_unit = (_name call GW_Common_fnc_findMatch);
	["GW_Admin_sendMsg", [_text, player], _unit] call CBA_fnc_targetEvent;
}, "all"] call CBA_fnc_registerChatCommand;

["TP", {
	if (GVARMAIN(isAdmin)) then {
		params ["_name"];
		private _unit = _name call EFUNC(Common,findMatch);
		_unit setPos (getPos player);
	};
}, "all"] call CBA_fnc_registerChatCommand;

["kill", {
	if (GVARMAIN(isAdmin)) then {
		params ["_name"];
		private _unit = _name call EFUNC(Common,findMatch);
		_unit setDamage 1;
	};
}, "all"] call CBA_fnc_registerChatCommand;

if (GVARMAIN(mod_ACE)) then {
	["heal", {
		if (GVARMAIN(isAdmin)) then {
			params ["_name"];
			private _unit = _name call EFUNC(Common,findMatch);
			[QGVAR(fullHeal), _unit, GVARMAIN(activeAdmins)] call CBA_fnc_targetEvent;
			_unit setDamage 0;
		};
	}, "all"] call CBA_fnc_registerChatCommand;
};
