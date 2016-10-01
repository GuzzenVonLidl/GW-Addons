
class CfgCloudlets {
	class Default;
	class SmokeShellWhite: Default {
		animationSpeedCoef = 0.75;
		blockAIVisibility = 1;
		interval = 0.07;
		lifeTime = 30;
		lifeTimeVar = 3;
		moveVelocity[] = {0.5,0.5,0.5};
		MoveVelocityVar[] = {1.2,0.35,1.2};
		rubbing = 0.05;
		size[] = {0.8,6,18};					// Default 0.1,2,6
//		size[] = {0.2,6,10};					// Old
		sizeCoef = 2;
		sizeVar = 1;
//		volume = 1;
		volume = 5;
//		weight = 1.275;
		weight = 6.4;
	};

	class SmokeShellWhiteSmall;
	class GW_SmokeShellWhiteSmall: SmokeShellWhiteSmall {
		angleVar = 0.1;
		blockAIVisibility = 1;
		colorCoef[] = {"colorR","colorG","colorB",3};
		interval = 0.13;
		lifeTime = 22;
		lifeTimeVar = 2;
		moveVelocity[] = {0,0.1,0};
		MoveVelocityVar[] = {1.2,0.35,1.2};
		rubbing = 0.05;
		size[] = {0.2,6,10};
		sizeCoef = 2;
		sizeVar = 0.5;
		volume = 5;
		weight = 6.4;
	};
};
