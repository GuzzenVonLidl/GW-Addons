
class Extended_PreInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_FILE(XEH_preInit));
	};
};

class Extended_PostInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_FILE(XEH_postInit));
	};
};

class Extended_DisplayLoad_EventHandlers {
	class RscDisplayCurator {
		CuratorOpend = "_anim = switch (stance player) do {case 'STAND': {'amovpercmstpsraswrfldnon'};case 'CROUCH': {'amovpknlmstpsraswrfldnon'};case 'PRONE': {'amovppnemstpsraswrfldnon'};}; player playMoveNow _anim;";
	};
};

/*
class Extended_DisplayUnload_EventHandlers {
	class RscDisplayCurator {
		CuratorClosed = "";
	};
	class RscDisplayArsenal {
		Arsenal = "";
	};
	class RscDisplayEGSpectator {
		Spectator = "";
	};
};
*/
