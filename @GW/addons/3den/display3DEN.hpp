
class ctrlMenuStrip;
class display3DEN {
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				items[] += {"GW_Menu"};
				class GW_Menu {
					text = "GW Tools";
					items[] = {"GW_Copy","Separator","GW_setAttributes","Separator","GW_Links"};
				};



				class GW_Copy {
					text = "Copy Selected";
					items[] = {"GW_Group","GW_OnlyMen","GW_AllObjects","GW_OnlyObjects","Separator","GW_Composition"};
				};
					class GW_Group {
						text = "Group with waypoints";
						action = "[] call GW_3den_fnc_CopyGroup;";
					};
					class GW_OnlyMen {
						text = "as Static Units";
						action = "[1] call GW_3DEN_fnc_Copy;";
					};
					class GW_AllObjects {
						text = "Objects";
						action = "[2] call GW_3DEN_fnc_Copy;";
					};
					class GW_OnlyObjects {
						text = "Vehicles";
						action = "[3] call GW_3DEN_fnc_Copy;";
					};
					class GW_Composition {
						text = "Compositions";
						items[] = {"GW_Export","GW_Help"};
					};
						class GW_Export {
							text = "Export to Configs";
							action = "[1] call GW_3DEN_fnc_createComposition;";
						};
						class GW_Help {
							text = "Help";
							action = "[2] call GW_3DEN_fnc_createComposition;";
						};



				class GW_setAttributes {
					text = "setAttributes";
					items[] = {"GW_enableSimulation","GW_allowDamage","GW_hideObject"};
				};
					class GW_enableSimulation {
						items[] = {"GW_enableSimulation_true","GW_enableSimulation_false"};
						text = "enableSimulation";
					};
						class GW_enableSimulation_true {
							text = "true";
							action = "[1, true] call GW_3DEN_fnc_setAttribute;";
						};
						class GW_enableSimulation_false {
							text = "false";
							action = "[1, false] call GW_3DEN_fnc_setAttribute;";
						};
					class GW_allowDamage {
						items[] = {"GW_allowDamage_true","GW_allowDamage_false"};
						text = "allowDamage";
					};
						class GW_allowDamage_true {
							text = "true";
							action = "[2, true] call GW_3DEN_fnc_setAttribute;";
						};
						class GW_allowDamage_false {
							text = "false";
							action = "[2, false] call GW_3DEN_fnc_setAttribute;";
						};
					class GW_hideObject {
						items[] = {"GW_allowDamage_true","GW_allowDamage_false"};
						text = "hideObject";
					};
						class GW_hideObject_true {
							text = "true";
							action = "[3, true] call GW_3DEN_fnc_setAttribute;";
						};
						class GW_hideObject_false {
							text = "false";
							action = "[3, false] call GW_3DEN_fnc_setAttribute;";
						};



				class GW_Links {
					text = "Links";
					items[] = {"GW_MissionRequirements","GW_Github","GOL_Wiki"};
				};
					class GW_MissionRequirements {
						text = "Mission Requrirements";
						weblink = "http://www.gol-clan.co.uk/forum/topic/1338-mission-requirements/";
						picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
					};
					class GW_Github {
						text = "Github GW";
						weblink = "https://github.com/GOLCLAN/GOL-Template.VR/wiki";
						picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
					};
					class GOL_Wiki {
						text = "Mission making tips";
						weblink = "http://www.gol-clan.co.uk/wiki/index.php?title=Main_Page";
						picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
					};
			};
		};
	};
};
