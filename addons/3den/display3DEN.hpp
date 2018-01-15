#define MENU(var1) DOUBLES(ADDON,var1)
#define MENU_SUB(var1,var2) TRIPLES(ADDON,var1,var2)
#define MENU_SUB_SUB(var1,var2) TRIPLES(ADDON,var1,var2)

class display3DEN {
	class ContextMenu: ctrlMenuStrip {
		class Items {
			class Log {
				items[] += {"LogVectors"};
			};

			class LogVectors {
				action = "[] call GW_3DEN_fnc_logVector;";
				conditionShow = "selectedObject";
				data = "LogVectors";
				text = "Log Vector Up and Dir to Clipboard";
				value = 0;
			};
		};
	};

	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				items[] += {"GW_Menu"};
				class GW_Menu {
					text = "GW Tools";
					items[] = {
						MENU(Copy),
						"Separator",
						MENU(doActions),
						MENU(set3DENAttributes),
						MENU(Misc),
						"Separator",
						MENU(OpenSettingsMenu),
						MENU(OpenMissionSettingsMenu),
//						MENU(Actions),
						"Separator",
						MENU(Extra)
					};
				};

				class MENU(Copy) {
					text = "Copy Selected";
					items[] = {
						MENU_SUB(Copy,Group),
						MENU_SUB(Copy,OnlyMen),
						MENU_SUB(Copy,AllObjects),
//						MENU_SUB(Copy,Loadout),
						"Separator",
						MENU_SUB(Copy,Export)
					};
				};

				class GW_PlacementTools {
					text = "Placement Tools";
					items[] = {""};
				};

				class MENU(doActions) {
					text = "Actions";
					items[] = {
						MENU_SUB(doActions,toggleTerrain),
						MENU_SUB(doActions,GarrisonBuildings),
						MENU_SUB(doActions,createWaypoints),
						"Separator",
						MENU_SUB(doActions,pattern_Line),
						MENU_SUB(doActions,pattern_Circular),
						MENU_SUB(doActions,pattern_offset),
						"Separator",
						MENU_SUB(doActions,extra),
						"Separator",
						MENU_SUB(doActions,Help)
					};
				};

				class MENU(set3DENAttributes) {
					text = "set3DENAttributes";
					items[] = {
						MENU_SUB(set3DENAttributes,unitStance),
						MENU_SUB(set3DENAttributes,simpleObject),
						MENU_SUB(set3DENAttributes,enableSimulation),
						MENU_SUB(set3DENAttributes,dynamicSim),
						MENU_SUB(set3DENAttributes,allowDamage),
						"Separator",
						MENU_SUB(set3DENAttributes,Help)
					};
				};

				class MENU(Misc) {
					text = "Misc";
					items[] = {
						MENU_SUB(Misc,relativeObjects),
						MENU_SUB(Misc,ToggleMapIDs),
						MENU_SUB(Misc,exportMissingAuthors),
						MENU_SUB(Misc,exportWeapons),
						"Separator",
						MENU_SUB(Misc,Help)
					};
				};

				class MENU(OpenSettingsMenu) {
					text = "Open Settings Menu";
					action = "edit3DENMissionAttributes 'Preferences';";
					shortcuts[] = {INPUT_CTRL_OFFSET + DIK_K};
				};

				class MENU(OpenMissionSettingsMenu) {
					text = "Open Settings Menu (Mission)";
					action = "edit3DENMissionAttributes 'GW_MissionPreferences';";
					shortcuts[] = {INPUT_SHIFT_OFFSET + DIK_K};
				};

				class MENU(Actions) {
					text = "Repeat Action";
					action = QUOTE(call FUNC(uiCallFunction));
					shortcuts[] = {INPUT_SHIFT_OFFSET + DIK_5};
				};

				class MENU(Extra) {
					text = "Extra";
					items[] = {
						MENU(Framework),
						MENU(DebugConsole),
						"LogFolder",
						"HelpTutorials",
						"GW_Addon_Github",
						"GW_Github",
						"GW_MissionRequirements",
						"GOL_Wiki"
					};
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
					Text = "Clear Console History";
				};

				class MENU_SUB(DebugConsole,Exit) {
					action = "'debug_console' callExtension ('X')";
					Text = "Shutdown Console";
				};

				#include "display3DEN\_copy.hpp"
				#include "display3DEN\_doActions.hpp"
				#include "display3DEN\_Extra.hpp"
				#include "display3DEN\_Framework.hpp"
				#include "display3DEN\_Misc.hpp"
				#include "display3DEN\_setAttributes.hpp"

			};
		};

		class StatusBar: ctrlControlsGroupNoScrollbars {
			class Controls {
				class ValueX;
				class TextX;
				class GW_session_Text: TextX {
					text = "\a3\Ui_f\data\GUI\RscCommon\RscDebugConsole\performance_ca.paa";
					colorBackground[] = {0,0,0,0};
					x = "(5 * (	3 + 16 + 4)) * (pixelW * pixelGrid * 0.50)";
				};
				class GW_session_Value: ValueX {
					tooltip = "Mission Status";
					idc = 10540;
					w = "90 * (pixelW * pixelGrid * 0.50)";
					x = "(5 * (	3 + 16 + 4) + 3) * (pixelW * pixelGrid * 0.50)";
				};
			};
		};

		class Toolbar : ctrlControlsGroupNoScrollbars {
			class Controls {
				class Separator6: Separator1 {
					colorBackground[]={0,0,0,0.5};
					x="34 * (5 * (pixelW * pixelGrid * 0.50))";
					y="1 * (pixelH * pixelGrid * 0.50)";
					w="pixelW";
					h="(5 * (pixelH * pixelGrid * 0.50))";
				};
				class GW_Toolbar_Controls : ctrlControlsGroupNoScrollbars {
					idc=-1;
					x="34.5 * (5 * (pixelW * pixelGrid * 0.50))";
					y="1 * (pixelH * pixelGrid * 0.50)";
					w="5 * (5 * (pixelW * pixelGrid * 0.50))";
					h="(5 * (pixelH * pixelGrid * 0.50))";
					class Controls {
						class Garrison: ctrlButtonToolbar {
							idc=-1;
//							action = QUOTE(call FUNC(uiCallFunction));
							action = "[] call GW_3DEN_fnc_uiCallFunction";
							tooltip="GW Tools: Repeat Last Action Used";
							text = "\a3\3DEN\Data\Attributes\NameSound\special_ca.paa";
//							text = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\widget_rotation_off_ca.paa";
//							onLoad = "['showShortcut','OpenIntelDisplay',_this] call bis_fnc_3DENInterface;";
							x="0 * ( 5 * (pixelW * pixelGrid * 0.50))";
							y=0;
							h="(5 * (pixelH * pixelGrid * 0.50))";
							w="(5 * (pixelW * pixelGrid * 0.50))";
						};
					};
				};
			};
		};
	};
};
