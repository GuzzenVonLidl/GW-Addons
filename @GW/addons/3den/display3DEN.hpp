
class display3DEN {
	class ContextMenu: ctrlMenu {
		class Items {
			class Edit {
				items[] += {"GW_GarrisonBuildings","GW_generateWaypoints","GW_hideClosestObject","GW_showClosestObject"};
			};
			class GW_GarrisonBuildings {
				action = "call GW_3den_fnc_garrisonNearest";
				Text = "Garrison Selected units";
				conditionShow = "selectedObject";
			};
			class GW_generateWaypoints {
				action = "call GW_3den_fnc_generateWaypoints";
				Text = "Generate waypoints around group";
				conditionShow = "hoverObjectBrain";
			};
			class GW_hideClosestObject {
				text = "Hide Closest Object";
				action = "[true] call GW_3DEN_fnc_toggleObjects";
			};
			class GW_showClosestObject {
				text = "Show Closest Object";
				action = "[false] call GW_3DEN_fnc_toggleObjects";
			};
		};
	};

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
					items[] = {"GW_Group","GW_OnlyMen","GW_AllObjects","Separator","GW_Composition","Separator","GW_Copy_Help"};
				};
					class GW_Group {
						text = "Group with waypoints";
						action = "[] call GW_3den_fnc_CopyGroup;";
					};
					class GW_OnlyMen {
						text = "as Static Units";
						action = "[1] call GW_3den_fnc_useCorrectVersion;";
					};
					class GW_AllObjects {
						text = "Objects";
						action = "[2] call GW_3den_fnc_useCorrectVersion;";
					};
					class GW_Composition {
						text = "Compositions";
						items[] = {"GW_Export","GW_Composition_Help"};
					};
						class GW_Export {
							text = "Export to Configs";
							action = "[1] call GW_3DEN_fnc_createComposition;";
						};
						class GW_Composition_Help {
							text = "Help";
							action = "[2] call GW_3DEN_fnc_createComposition;";
						};
					class GW_Copy_Help {
						text = "Help";
						action = "[3] call GW_3den_fnc_useCorrectVersion;";
					};


				class GW_setAttributes {
					text = "setAttributes";
					items[] = {"GW_unitStance","GW_enableSimulation","GW_allowDamage","GW_hideObject","GW_simpleObject"};
				};
					class GW_unitStance {
						items[] = {"GW_unitStance_up","GW_unitStance_middle","GW_unitStance_down","GW_unitStance_auto"};
						text = "Unit Stance";
					};
						class GW_unitStance_up {
							text = "Up";
							action = "[5, 0] call GW_3DEN_fnc_setAttribute;";
							shortcuts[] = {INPUT_CTRL_OFFSET + DIK_1};
						};
						class GW_unitStance_middle {
							text = "Middle";
							action = "[5, 1] call GW_3DEN_fnc_setAttribute;";
							shortcuts[] = {INPUT_CTRL_OFFSET + DIK_2};
						};
						class GW_unitStance_down {
							text = "Down";
							action = "[5, 2] call GW_3DEN_fnc_setAttribute;";
							shortcuts[] = {INPUT_CTRL_OFFSET + DIK_3};
						};
						class GW_unitStance_auto {
							text = "Auto";
							action = "[5, 3] call GW_3DEN_fnc_setAttribute;";
							shortcuts[] = {INPUT_CTRL_OFFSET + DIK_4};
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
						items[] = {"GW_hideObject_true","GW_hideObject_false"};
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
					class GW_simpleObject {
						items[] = {"GW_simpleObject_true","GW_simpleObject_false"};
						text = "createSimpleObject";
					};
						class GW_simpleObject_true {
							text = "true";
							action = "[4, true] call GW_3DEN_fnc_setAttribute;";
						};
						class GW_simpleObject_false {
							text = "false";
							action = "[4, false] call GW_3DEN_fnc_setAttribute;";
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
						weblink = "https://github.com/GuzzenVonLidl/GW-Framework/wiki";
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
