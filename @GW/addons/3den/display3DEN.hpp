
class display3DEN {
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				items[] += {"GW_Menu"};
				class GW_Menu {
					text = "GW Tools";
					items[] = {"GW_Copy","Separator","GW_doActions","GW_setMisc","Separator","GW_Links","HelpTutorials"};
				};

				class GW_Copy {
					text = "Copy Selected";
					items[] = {"GW_Group","GW_OnlyMen","GW_AllObjects","Separator","GW_Export"};
				};

				class GW_doActions {
					text = "Actions";
					items[] = {"GW_genericObjects","GW_setObjects","GW_setGroup"};
				};

				class GW_setMisc {
					text = "Misc Actions";
					items[] = {"GW_toggleTerrain","GW_ToggleMapIDs"};
				};

				class GW_Links {
					text = "Links";
					items[] = {"GW_MissionRequirements","GW_Github","GOL_Wiki"};
				};

				#include "display3DEN\_copy.hpp"
				#include "display3DEN\_doActions.hpp"
				#include "display3DEN\_doMiscActions.hpp"
				#include "display3DEN\_Links.hpp"
			};
		};
	};
};
