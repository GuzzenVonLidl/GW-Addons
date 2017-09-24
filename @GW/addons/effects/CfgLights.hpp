
class CfgLights {
	class Chemlight_Green {
		ambient[] = {0,0,0,0};
		brightness = 1;
		color[] = {0.2,1,0,1};
		diffuse[] = {0.02,0.1,0};
		drawLight = 0;
		intensity = 4000;
		position[] = {0,0,0};

		__ATTENUATION
	};
	class ChemLight_Blue: ChemLight_Green {
		color[] = {0,0.6,1,1};
		diffuse[] = {0,0.6,1};

		__ATTENUATION
	};

	class ChemLight_Red: ChemLight_Green {
		color[] = {1,0.1,0.1,1};
		diffuse[] = {1,0.1,0.1};

		__ATTENUATION
	};

	class ChemLight_Yellow: ChemLight_Green {
		color[] = {1,1,0.1,1};
		diffuse[] = {1,1,0.1};

		__ATTENUATION
	};
};
