
["CAManBase", "init", {
	[QGVAR(UnitCaching_addObject), (_this select 0)] call CBA_fnc_LocalEvent;
	params ["_unit"];
	if !(_unit isKindOf "HeadlessClient_F") then {
		GVAR(UnitCaching_Objects) pushBackUnique _unit;
	};
}, true, [], true] call CBA_fnc_addClassEventHandler;

["CAManBase", "KILLED", {
	params ["_unit"];
	GVAR(UnitCaching_Objects) deleteAt (GVAR(UnitCaching_Objects) find _unit);
	_unit enableSimulation true;
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QGVAR(UnitCaching_enablePFH), {
	if ((hasInterface && !isServer) || !isMultiplayer) then {
		params ["_toggle"];
		if (_toggle) then {
			if (isNil QGVAR(UnitCaching_PFH)) then {
				GVAR(UnitCaching_PFH) = [{
					[] call FUNC(UnitCaching_Handler);
				}, 5, []] call CBA_fnc_addPerFrameHandler;
			};
		} else {
			if !(isNil QGVAR(UnitCaching_PFH)) then {
				[GVAR(UnitCaching_PFH)] call CBA_fnc_removePerFrameHandler;
				GVAR(UnitCaching_PFH) = nil;
			};
		};
		GVAR(UnitCaching_Enabled) = _toggle;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(UnitCaching_requestUpdate), {
	params ["_object"];
	_object setPos (getPos _object);
}] call CBA_fnc_addEventHandler;
