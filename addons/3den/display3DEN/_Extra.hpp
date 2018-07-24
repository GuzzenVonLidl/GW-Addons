
class MENU(Framework) {
	text = "Framework";
	items[] = {
		MENU_SUB(Framework,setEditorDefaults),
		MENU_SUB(Framework,Reset)
//		MENU_SUB(Framework,setName),	//	BI Broke it
	};
};

class MENU_SUB(Framework,setEditorDefaults) {
	text = "Set Editor Default...";
	action = QUOTE(call EFUNC(Common,setEditor));
};

class MENU_SUB(Framework,Reset) {
	text = "Clear Stored Settings... (Settings Menu)";
	action = QUOTE(call EFUNC(Common,setFramework));
};

class MENU_SUB(Framework,setName) {
	text = "Auto Configure Name...";
	action = QUOTE(call EFUNC(Common,setName));
};


class MENU(DebugConsole) {
	text = "External Debug Console";
	items[] = {
		MENU_SUB(DebugConsole,Clear),
		MENU_SUB(DebugConsole,Exit)
	};
};

class MENU_SUB(DebugConsole,Clear) {
	action = "'debug_console' callExtension ('C')";
	Text = "Clear Console History...";
};

class MENU_SUB(DebugConsole,Exit) {
	action = "'debug_console' callExtension ('X')";
	Text = "Shutdown Console...";
};

class MENU(ClearChat) {
	action = "clearRadio";
	Text = "Clear ChatLog... (SystemChat)";
};

// Help

class MENU_SUB(Extra,Help) {
	text = "Help...";
	action = "[4] call GW_3DEN_fnc_showMessage;";
};
