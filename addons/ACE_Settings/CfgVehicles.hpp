
#define	DISTANCE(var)	class ACE_Actions { \
            class ACE_MainActions { \
                distance = var; \
            }; \
        };

class CfgVehicles {
	class ThingX;
    class ReammoBox_F: ThingX {
		DISTANCE(10)
	};
	class Scrapyard_base_F;
	class Land_PaperBox_closed_F: Scrapyard_base_F {
		DISTANCE(10)
	};

	class Cargo_base_F: ThingX {
		DISTANCE(10)
	};

	class Land_CargoBox_V1_F: ThingX {
		DISTANCE(10)
	};
	class Box_IED_Exp_F: ReammoBox_F {
		DISTANCE(10)
	};
};
