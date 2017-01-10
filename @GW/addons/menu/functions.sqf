
ParadropType = false;
GoL_ParadropType = {
	if (ParadropType) then {
		ParadropType = false;
		publicVariable "ParadropType";
		hint "Static Line";
	} else {
		ParadropType = true;
		publicVariable "ParadropType";
		hint "H.A.L.O";
	};
};

GoL_ParaDrop = {
	private ["_airframe","_unit","_height","_direction","_pos","_paradrop","_pack","_class","_magazines","_weapons","_items"];
	_unit = player;
	_airframe = vehicle _unit;

	if (_unit != _airframe) then {
		_height = ((getPosASL _unit) select 2); _height = round _height;
		if(_height >= 115) then {
			_unit disableCollisionWith _airframe;
			_unit action ["EJECT", _airframe];
			moveOut _unit;
			//_direction = getDir _airframe;
			//_pos = GetPos _airframe;
			//_newpos = [_pos select 0, _pos select 1, (_pos select 2) - 10];
			//_paradrop = _newpos;
			cutText ["", "BLACK FADED",999];
			//_unit setposATL (_paradrop);
			//_unit SetDir (_direction) + 180;
			//_velocity = velocity _airframe;
			_velocity = [((velocity _airframe) select 0),((velocity _airframe) select 1), (((velocity _airframe) select 2) -10)];
			_unit setVelocity _velocity;
			cutText ["", "BLACK IN", 5];

			// SAVE GEAR
			_pack = unitBackpack _unit;
			_class = typeOf _pack;
			_magazines = getMagazineCargo _pack;
			_weapons   = getWeaponCargo _pack;
			_items = getItemCargo _pack;

			sleep 3;
			_unit enableCollisionWith _airframe; // Enable Collision
			// REMOVE BACKPACK AND ADD PARACHUTE
			removeBackPack _unit;

			if (isNil ("ParadropType")) then { ParadropType = false; };
			if (ParadropType) then {
				_unit AddBackPack "B_Parachute";
			} else {
				//while {_height >= 10} do {
					//_height = ((getPosATL _unit) select 2); _height = round _height;
					//if(_height <= 225) exitWith {};
				//};
				while {true} do {
					sleep 0.1;
					if (((getPosATL _unit) select 2) <= 225) exitWith {false};
				};
				_chute = createVehicle ["NonSteerable_Parachute_F", (getPos _unit), [], 0, "NONE"];
				_direction = getDir _unit; _chute SetDir _direction; _chute setPos (getPos _unit);
				_unit moveInDriver _chute;
			};

			// ADD BACKPACK & RESTORE GEAR
			waitUntil {sleep 0.1; isTouchingGround _unit || (getPos _unit select 2) < 1 && alive _unit};
			sleep 2; removeBackPack _unit;
			_unit addBackpack _class; clearAllItemsFromBackpack _unit;
			for "_i" from 0 to (count (_magazines select 0) - 1) do {
				(unitBackpack _unit) addMagazineCargoGlobal [(_magazines select 0) select _i,(_magazines select 1) select _i]; //return the magazines
			};
			for "_i" from 0 to (count (_weapons select 0) - 1) do {
				(unitBackpack _unit) addWeaponCargoGlobal [(_weapons select 0) select _i,(_weapons select 1) select _i]; //return the weapons
			};
			for "_i" from 0 to (count (_items select 0) - 1) do {
				(unitBackpack _unit) addItemCargoGlobal [(_items select 0) select _i,(_items select 1) select _i]; //return the items
			};

			if (isClass (configFile >> "CfgPatches" >> "Task_Force_Radio")) then {
				sleep 5;
				_inradios = (str _class) in ['"tf_anarc164"','"tf_anarc210"','"tf_anprc155"','"tf_anprc155_coyote"','"tf_mr3000"','"tf_mr3000_bwmod"','"tf_mr3000_multicam"','"tf_mr3000_rhs"','"tf_mr6000l"','"tf_rt1523g"','"tf_rt1523g_big"','"tf_rt1523g_big_bwmod"','"tf_rt1523g_big_rhs"','"tf_rt1523g_black"','"tf_rt1523g_bwmod"','"tf_rt1523g_fabric"','"tf_rt1523g_green"','"tf_rt1523g_rhs"','"tf_rt1523g_sage"'];
				if(_inradios) then {
					[(call TFAR_fnc_activeLrRadio), 1, "10"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 2, "20"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 3, "30"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 4, "40"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 5, "50"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 6, "50.1"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 7, "50.2"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 8, "50.3"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 6] call TFAR_fnc_setLrChannel;
					[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 5] call TFAR_fnc_setLrVolume;
				};
			};
		} else {
			titleText ["You can't do that right now!", "PLAIN DOWN"];
		};
	};
};
