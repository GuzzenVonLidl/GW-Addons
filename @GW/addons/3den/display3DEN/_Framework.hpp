
class MENU(Framework) {
	text = "Framework";
	items[] = {
		MENU_SUB(Framework,setEditorDefaults),
		MENU_SUB(Framework,Reset),
//		MENU_SUB(Framework,setName),	//	BI Broke it
		MENU_SUB(Framework,Help)
	};
};

class MENU_SUB(Framework,setEditorDefaults) {
	text = "Set Editor Default";
	action = QUOTE(call EFUNC(Common,setEditor));
};

class MENU_SUB(Framework,Reset) {
	text = "Reset Settings Menu";
	action = QUOTE(call EFUNC(Common,setFramework));
};

class MENU_SUB(Framework,setName) {
	text = "Auto Configure Name";
	action = QUOTE(call EFUNC(Common,setName));
};

// Help

class MENU_SUB(Framework,Help) {
	text = "Help";
	action = "[4] call GW_3DEN_fnc_showMessage;";
};
