
class GW_toggleTerrain {
	text = "Toggle Terrain Objects *";
	items[] = {"GW_hideClosestObject","GW_showClosestObject"};
};

class GW_hideClosestObject {
	text = "Hide";
	action = "[true] call GW_3DEN_fnc_getObjectsToHide";
};
class GW_showClosestObject {
	text = "Show";
	action = "[false] call GW_3DEN_fnc_getObjectsToHide";
};

class GW_ToggleMapIDs {
	text = "Toggle Map IDs";
	action = "do3DENAction 'ToggleMapIDs';";
};
