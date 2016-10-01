#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = CSTRING(component);
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CBA_common", "A3_UI_F"};
		versionDesc = "GW Mod Collection";
		VERSION_CONFIG;
		authors[] = {"GuzzenVonlidl"};
	};
};

class CfgAddons {
	class PreloadAddons {
		class ADDON {
			list[] = {ADDON};
		};
	};
};

#include "CfgMissions.hpp"

class CfgDLCNotifications {
	class Default {
		picture = "";
		logo = "";
		logoOver = "";
		tooltip = "";
		tooltipOwned = "";
		action = "";
		fieldManualTopicAndHint[] = {"",""};
		dlcColor[] = {"0","0","0",0};
		overview = "";
		name = "0";
		author = "0";
		overviewPicture = "0";
		overviewText = "";
		contentBrowserPicture = "";
		popupMsgPicture = "";
		popupMsgText = "";
		vehPrevMsgText = "";
		vehPrevNotifText = "";
		infoPages[] = {"",""};
		overviewFootnote = "";
	};
};

class CfgDifficultyPresets {
	defaultPreset = "Regular";
	class Regular {
		description = "Custom difficulty defined by GOL Clan.";
		displayName = "GOL Setting";
		levelAI = "AILevelHigh";
		optionDescription = "Custom difficulty defined by GOL Clan.";
		optionPicture = "\A3\Ui_f\data\Logos\arma3_white_ca.paa";
		class Options {
			autoReport=0;
			cameraShake=1;
			commands=0;
			deathMessages=0;
			detectedMines=0;
			enemyTags=0;
			friendlyTags=0;
			groupIndicators=0;
			mapContent=0;
			multipleSaves=0;
			reducedDamage=0;
			scoreTable=0;
			staminaBar=0;
			stanceIndicator=1;
			thirdPersonView=0;
			visionAid=0;
			vonID=1;
			waypoints=0;
			weaponCrosshair=0;
			weaponInfo=1;
		};
	};

	class Regular_old {
		description = "Just finished training, no real combat experience.";
		displayName = "Regular";
		levelAI = "AILevelMedium";
		optionDescription = "Just finished training, no real combat experience.";
		optionPicture = "\A3\Ui_f\data\Logos\arma3_white_ca.paa";
		class Options {
			autoReport = 1;
			cameraShake = 1;
			commands = 1;
			deathMessages = 1;
			detectedMines = 1;
			enemyTags = 0;
			friendlyTags = 1;
			groupIndicators = 1;
			mapContent = 1;
			multipleSaves = 1;
			reducedDamage = 0;
			scoreTable = 1;
			squadRadar = 1;
			staminaBar = 1;
			stanceIndicator = 2;
			thirdPersonView = 1;
			visionAid = 0;
			vonID = 1;
			waypoints = 2;
			weaponCrosshair = 1;
			weaponInfo = 2;
		};
	};
};

/*
	https://community.bistudio.com/wiki/Arma_3_Difficulty_Menu
	https://community.bistudio.com/wiki/difficulty


class CfgDifficultyPresets {
	defaultPreset = "Veteran";
	class Custom2 {
		description = "Custom difficulty set by the player.";
//		levelAI = "AILevelMedium";
		levelAI = "AILevelHigh";
		class Options {
			autoReport=0;
			cameraShake=1;
			commands=0;
			deathMessages=0;
			detectedMines=0;
			enemyTags=0;
			friendlyTags=0;
			groupIndicators=0;
			mapContent=0;
			multipleSaves=0;
			reducedDamage=0;
			scoreTable=0;
			staminaBar=0;
			stanceIndicator=1;
			thirdPersonView=0;
			visionAid=0;
			vonID=1;
			waypoints=0;
			weaponCrosshair=0;
			weaponInfo=1;
		};
		displayName = "Custom 2";
		optionDescription = "Custom difficulty set by the player.";
		optionPicture = "\A3\Ui_f\data\Logos\arma3_white_ca.paa";
	};
};


class CfgDifficultyPresets {
	defaultPreset = "GOL_Difficulty";
	class GOL_Difficulty {
		displayName = "GOL Difficulty";
		optionDescription = "Standard GOL Server Settings";
		optionPicture = "\A3\Ui_f\data\Logos\arma3_white_ca.paa";
		class Options {
			autoReport=0;
			cameraShake=1;
			commands=0;
			deathMessages=0;
			detectedMines=0;
			enemyTags=0;
			friendlyTags=0;
			groupIndicators=0;
			mapContent=0;
			multipleSaves=0;
			reducedDamage=0;
			scoreTable=0;
			staminaBar=0;
			stanceIndicator=1;
			thirdPersonView=0;
			visionAid=0;
			vonID=1;
			waypoints=0;
			weaponCrosshair=0;
			weaponInfo=1;
		};
	};
};

class DifficultyPresets {
	class GOL_Difficulty {
		class Options {
			autoReport=0;
			cameraShake=1;
			commands=0;
			deathMessages=0;
			detectedMines=0;
			enemyTags=0;
			friendlyTags=0;
			groupIndicators=0;
			mapContent=0;
			multipleSaves=0;
			reducedDamage=0;
			scoreTable=0;
			staminaBar=0;
			stanceIndicator=1;
			thirdPersonView=0;
			visionAid=0;
			vonID=1;
			waypoints=0;
			weaponCrosshair=0;
			weaponInfo=1;
		};
		aiLevelPreset=3;
	};
	class GOL_AILevel {
		skillAI=0.80;
		precisionAI=0.80;
	};
};
