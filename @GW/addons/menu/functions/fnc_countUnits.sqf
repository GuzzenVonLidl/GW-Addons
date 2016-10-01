// ================================================================
// *	AUTHOR: GuzzenVonLidl
// *
// *	Description:
// *		Counts all units on either the entire server or only on headless client
// *		And there after displaying the information on screen for easy debugging
// *
// *	Usage:
// *		["HC"] call GVL_Fnc_countUnits;
// *
// *	Parameters:
// *	0 - STRING:		Counts all units on the server
// *		"HC":		Displays information only on headless client
// *
// *	Returning Value:
// *		Total amount Units in the mission alive
// *
// ================================================================

//
//	["respawn_West", 2, 10] call GVL_FNC_AI_Inf_Defend;
//	if (headlessController) Then { ["respawn_West", 2, 10] call GVL_FNC_AI_Inf_Defend; };

// ================================================================

	_this spawn {

		private ["_typeofFpsCounter","_players","_blufor","_opfor","_resistance","_civilian","_dead"];

		_fpsCounter = {

			private ["_players","_blufor","_opfor","_resistance","_civilian","_dead"];

			_players = {isPlayer _x} count allUnits;
			_blufor = {side _x == west && alive _x && !isPlayer _x} count allUnits;
			_opfor = {side _x == east && alive _x && !isPlayer _x} count allUnits;
			_resistance = {side _x == resistance && alive _x && !isPlayer _x} count allUnits;
			_civilian = {side _x == CIVILIAN && alive _x && !isPlayer _x} count allUnits;
			_dead = count allDead;
			_server = "Server";

			hintSilent format ["
				Total Units on %7\n
				Players: %1\n
				West Units: %2\n
				East Units: %3\n
				Resistance Units: %4\n
				Civilian Units: %5\n
				Total Dead Units: %6\n
			",_players, _blufor, _opfor, _resistance, _civilian, _dead, _server];

		};

	// ================================================================

		_fpsCounterHC = {

			// =========================================

			private ["_blufor","_opfor","_resistance","_civilian","_array"];

			// =========================================
			[-2, {

				if (!hasInterface && !isServer) Then {

					private ["_blufor","_opfor","_resistance","_civilian"];

					_blufor = {side _x == west && alive _x && !isPlayer _x && local _x} count allUnits;
					_opfor = {side _x == east && alive _x && !isPlayer _x && local _x} count allUnits;
					_resistance = {side _x == resistance && alive _x && !isPlayer _x && local _x} count allUnits;
					_civilian = {side _x == CIVILIAN && alive _x && !isPlayer _x && local _x} count allUnits;

					GVL_Admin_Unit_Count_Array = [_blufor,_opfor,_resistance,_civilian, (name player)];
					GVL_globalExecute = true;
					publicVariable "GVL_Admin_Unit_Count_Array";
					publicVariable "GVL_globalExecute";
					// ===================================

				};

			}] call CBA_fnc_globalExecute;

			// =========================================

			waitUntil {GVL_globalExecute};

			_blufor = (GVL_Admin_Unit_Count_Array select 0);
			_opfor = (GVL_Admin_Unit_Count_Array select 1);
			_resistance = (GVL_Admin_Unit_Count_Array select 2);
			_civilian = (GVL_Admin_Unit_Count_Array select 3);
			_HCName = (GVL_Admin_Unit_Count_Array select 4);

			hintSilent format ["
				Executed on %1\n
				West Units: %2\n
				East Units: %3\n
				Resistance Units: %4\n
				Civilian Units: %5\n
			", _HCName, _blufor, _opfor, _resistance, _civilian];

		};

	// ================================================================

		GVL_globalExecute = false;
		GVL_Admin_Unit_Count_Array = [];
		_typeofFpsCounter = [_this, 0] call BIS_fnc_param;

		switch (_typeofFpsCounter) do {

		    case "HC": {
		    	[] call _fpsCounterHC;
		    };

		    default {
		    	[] call _fpsCounter;
		    };

		};

	// ================================================================

	};
