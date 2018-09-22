
class ViewPilot;
class HeadLimits;

class CfgVehicles {
	class Man;
	class CAManBase: Man {
		audible=0.025;
//		crouchProbabilityCombat = 0.8;
//		crouchProbabilityEngage = 0.9;
//		minFireTime = 10;
//		spotableDarkNightLightsOff = 0.0015;
//		spotableNightLightsOff = 0.0175;

		crouchProbabilityCombat = 100;
		crouchProbabilityHiding = 100;
		formationX = 4;
		formationZ = 4;
		lyingLimitSpeedCombat = 3;
		lyingLimitSpeedHiding = 0.5;
		lyingLimitSpeedStealth = 0.2;
		mapSize = 0.1;
		minFireTime = 4;
		predictTurnPlan = 0.6;
		predictTurnSimul = 0.7;
		steerAheadPlan = 0.1;
		steerAheadSimul = 0.2;
		minGunElev = -89;
		maxGunElev = 89;
		class ViewPilot: ViewPilot {
			maxAngleX = 89;
			maxAngleY = 155;
			minAngleY = -155;
		};
	};
	class SoldierWB: CAManBase {
//		fsmDanger = "x\gw\addons\AI_Enhancements\danger.fsm";
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
//		aiBrainType = "DefaultAnimalBrain";
		aiBrainType = "DefaultCivilianBrain";
		accuracy = 0.2;
		primaryAmmoCoef = 0;
		secondaryAmmoCoef = 0;
		handgunAmmoCoef = 0;
		fsmDanger = "";
		fsmFormation = "";
	};
	class Helicopter {
		brakeDistance = 300;
	};
};
