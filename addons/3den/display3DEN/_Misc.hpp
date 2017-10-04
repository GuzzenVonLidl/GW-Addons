
class MENU_SUB(Misc,ToggleMapIDs) {
	text = "Toggle Map IDs";
	action = QUOTE(0 call FUNC(doActionMisc));
};

class MENU_SUB(Misc,relativeObjects) {
	text = "Copy relative location of obj 2 from obj 1";
	action = QUOTE(4 call FUNC(doActionMisc));
};

class MENU_SUB(Misc,exportMissingAuthors) {
	action = QUOTE(2 call FUNC(doActionMisc));
	Text = "Missing Authors";
};

class MENU_SUB(Misc,exportWeapons) {
	action = QUOTE(3 call FUNC(doActionMisc));
	Text = "Export Weapons and Magazines";
};

// Help

class MENU_SUB(Misc,Help) {
	text = "Help";
	action = "[3] call GW_3DEN_fnc_showMessage;";
};
