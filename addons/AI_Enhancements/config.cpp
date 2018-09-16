#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "GuzzenVonlidl";
		name = "GW - AI_Enhancements Component";
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {};
		addonRootClass = "A3_Weapons_F";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_Weapons_F", "A3_Weapons_F_Beta", "A3_Weapons_F_Exp", "A3_Weapons_F_Mark", "A3_Weapons_F_Machineguns_Zafir","A3_Weapons_F_Mark_Machineguns_Zafir","A3_Weapons_F_Rifles_Khaybar"};
		version = VERSION;
		authors[] = {"GuzzenVonlidl"};
	};
};

class CfgAISkill {
	aimingAccuracy[] = {0, 0.1, 1, 1};
	aimingShake[]    = {0, 0.1, 1, 1};
	aimingSpeed[]    = {0, 0.1, 1, 1};
	commanding[]     = {0, 0.1, 1, 1};
	courage[]        = {0, 0.1, 1, 1};
	endurance[]      = {0, 0.1, 1, 1};
	general[]        = {0, 0.1, 1, 1};
	reloadSpeed[]    = {0, 0.1, 1, 1};
	spotDistance[]   = {0, 0.1, 1, 1};
	spotTime[]       = {0, 0.1, 1, 1};
};

class close;
class fullauto_medium;
class manual;
class medium;
class short;
class single;

class Mode_SemiAuto {
	aiDispersionCoefX = 1.5;
	aiDispersionCoefY = 2;
	aiRateOfFire = 1;
	aiRateOfFireDispersion = 1;
	aiRateOfFireDistance = 500;
	maxRange = 1000;
	maxRangeProbab = 0.5;
	midRange = 500;
	midRangeProbab = 0.9;
	minRange = 30;
	minRangeProbab = 0.2;
};
class Mode_Burst: Mode_SemiAuto {
	aiDispersionCoefY=2.5;
	aiDispersionCoefX=2.0;
	maxRange = 150;
	maxRangeProbab = 0.2;
	midRange = 60;
	midRangeProbab = 0.6;
	minRange = 10;
	minRangeProbab = 0.3;
};
class Mode_FullAuto: Mode_SemiAuto {
	aiDispersionCoefY=3.0;
	aiDispersionCoefX=2.5;
	maxRange = 100;
	maxRangeProbab = 0.1;
	midRange = 40;
	midRangeProbab = 0.6;
	minRange = 0;
	minRangeProbab = 0.9;
};
class Mode_FullAuto_LMG: Mode_FullAuto {
	aiDispersionCoefY=3.0;
	aiDispersionCoefX=2.5;
	maxRange = 100;
	maxRangeProbab = 0.1;
	midRange = 40;
	midRangeProbab = 0.6;
	minRange = 0;
	minRangeProbab = 0.9;

	showToPlayer = 0;
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

/*
class CfgAISkill {	// ACE 3
	aimingAccuracy[] = {0,0, 1,0.8};  // {0,0,1,1};   v1.26 defaults
	aimingShake[]    = {0,0, 1,0.6};  // {0,0,1,1};
	aimingSpeed[]    = {0,0, 1,0.7};  // {0,0.5,1,1};
	commanding[]     = {0,0, 1,0.8};  // {0,0,1,1};
	courage[]        = {0,0, 1,0.7};  // {0,0,1,1};
	endurance[]      = {0,0, 1,0.7};  // {0,0,1,1};
	general[]        = {0,0, 1,0.9};  // {0,0,1,1};
	//reloadSpeed[]  = {0,0, 1,0.8};  // {0,0,1,1};// apparently breaks rapid firing in single fire mode for players
	spotDistance[]   = {0,0, 1,0.9};  // {0,0.2,1,0.4};
	spotTime[]       = {0,0, 1,0.7};  // {0,0,1,0.7};
};

class CfgAISkill {	// Default
	aimingAccuracy[] = {0, 0, 1, 1};
	aimingShake[]	 = {0, 0, 1, 1};
	aimingSpeed[]	 = {0, 0.5, 1, 1};
	commanding[]	 = {0, 0, 1, 1};
	courage[] 		 = {0, 0, 1, 1};
	endurance[]		 = {0, 0, 1, 1};
	general[]		 = {0, 0, 1, 1};
	reloadSpeed[]	 = {0, 0, 1, 1};
	spotDistance[]	 = {0, 0.2, 1, 0.4};
	spotTime[] 		 = {0, 0, 1, 0.7};
};
*/
