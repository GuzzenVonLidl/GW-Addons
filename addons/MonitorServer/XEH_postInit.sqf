#include "script_component.hpp"

[{
	if (isServer) then {
/*
		if !(isNil QGVAR(PFH)) then {
			[GVAR(PFH)] call CBA_fnc_removePerFrameHandler;
			GVAR(PFH) = nil;
		};
*/
		GVAR(PFH) = [{
			if !((count GVAR(adminUpdateList)) isEqualTo 0) then {
				[] call FUNC(addUpdate);
			};
		}, 5, []] call CBA_fnc_addPerFrameHandler;
	};

	GVAR(PFH_Send) = [{
		if (GVAR(isEnabled)) then {
			private _machine = 0;

			if (isServer) then {
				_machine = 1;
			};

			if (CBA_isHeadlessClient) then {
				_machine = 2;
				[QGVAR(sendInfoHC), [player, (round diag_fps)]] call CBA_fnc_serverEvent;
			};

			[QGVAR(sendInfo), [_machine, (round diag_fps)]] call CBA_fnc_serverEvent;
		};
	}, 4, []] call CBA_fnc_addPerFrameHandler;

	if (CBA_isHeadlessClient) then {
		[QGVAR(addHC), player] call CBA_fnc_serverEvent;
	};
}, [], 3] call CBA_fnc_waitAndExecute;
