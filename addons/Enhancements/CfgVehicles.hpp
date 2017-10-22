
class CfgVehicles {
	class Boat_F;
	class Offroad_01_base_F;
	class Rubber_duck_base_F: Boat_F {
		maxSpeed = 60;
	};

	class All;
	class AllVehicles: All {
		class NewTurret {
			startEngine = 0; //1;
		};
	};

	class Man;
	class CAManBase: Man {
		audible=0.025;
		crouchProbabilityCombat = 0.8;
		crouchProbabilityEngage = 0.9;
		minFireTime = 10;
		spotableDarkNightLightsOff = 0.0015;
		spotableNightLightsOff = 0.0175;
	};
	class SoldierWB: CAManBase {
//		fsmDanger = "x\gw\addons\enhancements\danger.fsm";
		primaryAmmoCoef = 0.4;
		secondaryAmmoCoef = 0.2;
		handgunAmmoCoef = 0.01;
	};
	class SoldierEB: CAManBase {
		primaryAmmoCoef = 0.4;
		secondaryAmmoCoef = 0.2;
		handgunAmmoCoef = 0.01;
	};
	class SoldierGB: CAManBase {
		primaryAmmoCoef = 0.4;
		secondaryAmmoCoef = 0.2;
		handgunAmmoCoef = 0.01;
	};
	class Civilian: CAManBase {
		accuracy = 0.2;
		primaryAmmoCoef = 0;
		secondaryAmmoCoef = 0;
		handgunAmmoCoef = 0;
	};
};
