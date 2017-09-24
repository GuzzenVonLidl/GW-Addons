
class RscControlsGroup;
class RscText;
class RscObject;
class RscCompass : RscObject {
	scale = 1;
};

class RscPicture;
class RscVignette {
	colorText[] = {0, 0, 0, 0};
};

/*
class RscCompass: RscObject {
	model = "\A3\ui_f\objects\compass.p3d";
	direction[] = {0,0.5,0.5};
	up[] = {0,1,0};
	scale = "0.47 * 0.875 * (SafeZoneW Min SafeZoneH)";
	positionBack[] = {0,-0.02,0.075};
};

// Ammo Count
class RscInGameUI {
	class RscUnitInfo {
		class WeaponInfoControlsGroupLeft : RscControlsGroup {
			class controls {
				class CA_AmmoCount : RscText {
					sizeEx = 0;
				};
				class CA_MagCount : RscText {
					sizeEx = 0;
				};
				class CA_GrenadeCount : RscText {
					sizeEx = 0;
				};
			};
		};
	};
};
*/
// Desync
class RscPendingInvitation {
	textureConnectionQualityPoor = "\A3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa";
	textureConnectionQualityBad = "\A3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa";
	textureDesyncLow = "\A3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa";
	textureDesyncHigh = "\A3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa";
	color[] = {1,1,1,1};
	x = 0.939;
	y = 0.852;
	w = 0.054;
	h = 0.072;
	timeout = 10;
	blinkingPeriod = 2;
};
class RscPendingInvitationInGame {
	textureConnectionQualityPoor = "\A3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa";
	textureConnectionQualityBad = "\A3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa";
	textureDesyncLow = "\A3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa";
	textureDesyncHigh = "\A3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa";
	color[] = {1,1,1,1};
	x = 0.939;
	y = 0.852;
	w = 0.054;
	h = 0.072;
	timeout = 10;
	blinkingPeriod = 2;
};

// New map look
class RscMapControl {
	maxSatelliteAlpha = 0.6;

	sizeExLevel = 0.022;

	colorBackground[] = {0.99, 0.99 0.99, 1};
	colorCountlines[] = {0.65, 0.33, 0.2, 0.5};
	colorMainCountlines[] = {0.6, 0.3, 0.2, 0.99};
	colorLevels[] = {0.2, 0.2, 0.1, 0.9};
	colorTracks[] = {1.0, 0.0, 0.0, 0.5};
	colorTracksFill[] = {0.8, 0.7, 0.6, 0.7};
	colorRoads[] = {0.0, 0.0, 0.0, 0.7};
	colorRoadsFill[] = {1, 1, 0, 0.8};
	colorMainRoads[] = {0.0, 0.0, 0.0, 0.7};
	colorMainRoadsFill[] = {1, 0.6, 0.4, 0.7};

	ptsPerSquareSea = 8;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor =5;
	ptsPerSquareForEdge = 5;
	ptsPerSquareRoad = 3;
	ptsPerSquareObj = 8;
};
