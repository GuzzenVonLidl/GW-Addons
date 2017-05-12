
class GW_Group {
	text = "Group with waypoints";
	action = "[true] call GW_3DEN_fnc_getCorrectVersion;";
	shortcuts[] = {INPUT_SHIFT_OFFSET + DIK_1};
};

class GW_OnlyMen {
	text = "Static Units";
	action = "[false, 1] call GW_3DEN_fnc_getCorrectVersion;";
	shortcuts[] = {INPUT_SHIFT_OFFSET + DIK_2};
};

class GW_AllObjects {
	text = "Objects";
	action = "[false, 2] call GW_3DEN_fnc_getCorrectVersion;";
	shortcuts[] = {INPUT_SHIFT_OFFSET + DIK_3};
};

class GW_Export {
	text = "Export Composition to Configs";
	action = "[] call GW_3DEN_fnc_createComposition;";
};
