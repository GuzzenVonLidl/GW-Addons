
class CfgCloudlets {
	class Default;
	class SmokeShellWhite: Default {
		animationSpeedCoef = 0.75;
		blockAIVisibility = 1;
		interval = 0.1;
		lifeTime = 35;
		lifeTimeVar = 3;
		moveVelocity[] = {0.5,0.2,0.5};
		moveVelocityVar[] = {0.5,0.2,0.5};
		rubbing = 0.05;
		size[] = {0.8,6,10};					// Default 0.1,2,6
		sizeCoef = 2;
		sizeVar = 1;
		volume = 1;
		weight = 1.275;
	};

	class SmokeShellWhiteSmall;
	class GW_SmokeShellWhiteSmall: SmokeShellWhiteSmall {
		angleVar = 0.1;
		animationSpeedCoef = 0.75;
		blockAIVisibility = 1;
		colorCoef[] = {"colorR","colorG","colorB",3};
		interval = 0.13;
		lifeTime = 22;
		lifeTimeVar = 2;
		moveVelocity[] = {0.2,0.5,0.1};
		MoveVelocityVar[] = {1.2,0.4,1.2};
		rubbing = 0.05;
//		size[] = {0.2,6,10};
		sizeCoef = 2;
		sizeVar = 0.5;
		volume = 5;
		weight = 6.4;
	};
};
