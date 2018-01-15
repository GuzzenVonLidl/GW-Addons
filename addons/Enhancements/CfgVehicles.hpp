
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
};
