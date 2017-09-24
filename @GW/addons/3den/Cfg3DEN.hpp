
class Cfg3DEN {
	class Mission {
		class Multiplayer {
			class AttributeCategories {
				class Revive {
					collapsed = 1;
				};
			};
		};

		class GW_MissionPreferences {
			displayName = "Mission Settings";
			class AttributeCategories {
				class GW_Options {
					displayName = "General Settings";
					class Attributes {
						class GW_isConfigured {
							displayName = "is Auto Configured";
							tooltip = "Checks if mission is given default values, Uncheck this if you need to reset settings";
							property = "GW_isConfigured";
							value = 1;
							control = "Checkbox";
							defaultValue = "false";
							expression = "true";
						};
						class GW_isDebug {
							displayName = "Enable Debug";
							tooltip = "";
							property = "GW_isDebug";
							value = 1;
							control = "Checkbox";
							defaultValue = "false";
							expression = "true";
						};
					};
				};
			};
		};

		class Preferences {
			class AttributeCategories {
				class Camera {
					collapsed = 1;
				};
				class Internal {
					collapsed = 1;
				};
				class Misc {
					collapsed = 1;
				};
				class Saving {
					collapsed = 1;
					class Attributes {
						class Binarize {
							value = 0;
						};
					};
				};

				class GW_Options {
					displayName = "GW Tools: General Settings";
					class Attributes {
						class GW_ShowMessage {
							displayName = "Show Warning Message";
							tooltip = "Shows warning message when using some of the actions";
							property = "GW_ShowMessage";
							control = "Checkbox";
							defaultValue = "true";
							expression = "true";
						};
						class GW_Show3DMessage {
							displayName = "Display 3D Text";
							tooltip = "Will only show 3d text on specific modules placed thought the menu";
							property = "GW_Show3DMessage";
							control = "Checkbox";
							defaultValue = "true";
							expression = "true";
						};
						class GW_GarrisonRadius {
							displayName = "Garrison Radius";
							tooltip = "Buildings to gather around unit clicked";
							property = "GW_GarrisonRadius";
							control = "EditShort";
							expression = "";
							defaultValue = "25";
							typeName = "NUMBER";
						};
						class GW_PatternOffset {
							displayName = "Pattern Radius";
							tooltip = "Offset for Linear and Circular offset";
							property = "GW_PatternOffset";
							control = "EditShort";
							expression = "";
							defaultValue = "5";
							typeName = "NUMBER";
						};
					};
				};

				class GW_Options_Copy {
					displayName = "GW Tools: Copy Settings";
					class Attributes {
						class GW_DeleteOnCopy {
							displayName = "Delete on copy";
							tooltip = "Delete all selected things successful upon copying";
							property = "GW_DeleteOnCopy";
							control = "Checkbox";
							defaultValue = "false";
							expression = "true";
						};
						class GW_CopyToClipboard {
							displayName = "Copy code to Clipboard";
							tooltip = "(WARNING: Advenced Users Only)";
							property = "GW_CopyToClipboard";
							control = "Checkbox";
							defaultValue = "true";
							expression = "true";
						};
						class GW_PrintToConsoleLog {
							displayName = "Print to Remote Debug Console";
//							displayName = "Prints Copied code to Remote Debug Console";
//							tooltip = "(WARNING: Advenced Users Only)";
							tooltip = "Opens a remote console to display all code copied, Perfect for multi-monitor";
							property = "GW_PrintToConsoleLog";
							control = "Checkbox";
							defaultValue = "false";
							expression = "true";
						};
						class GW_PrintToConsoleFile {
							displayName = "Print to File";
							tooltip = "Prints copied code to arma3/debug_console_#DATE#.txt";
							property = "GW_PrintToConsoleFile";
							control = "Checkbox";
							defaultValue = "false";
							expression = "true";
						};
					};
				};

				class GW_Options_Waypoint {
					displayName = "GW Tools: Generate Waypoint";
					class Attributes {
						class GW_WaypointRadius {
							displayName = "Waypoint Radius";
							tooltip = "Places waypoints in a radius around right clicked";
							property = "GW_WaypointRadius";
							control = "EditShort";
							expression = "";
							defaultValue = "150";
							typeName = "NUMBER";
						};
						class GW_WaypointCount {
							displayName = "Waypoint Count";
							tooltip = "Amount of waypoints to be placed";
							property = "GW_WaypointCount";
							control = "EditShort";
							expression = "";
							defaultValue = "7";
							typeName = "NUMBER";
						};
					};
				};
			};
		};
	};

	class Object {
		class AttributeCategories {
            delete Identity;
			class Inventory {
				collapsed = 1;
				class Attributes {
					class AmmoBox {
					};
				};
			};
			class Control {
				collapsed = 1;
			};
			class State {
				collapsed = 1;
	            class Attributes {

					class AllowDamage {
						property = "allowDamage";
						control = "Checkbox";
						displayName = "$STR_3DEN_Object_Attribute_AllowDamage_displayName";
						tooltip = "$STR_3DEN_Object_Attribute_AllowDamage_tooltip";
						expression = "_this allowdamage _value;";
						defaultValue = "true";
						wikiType = "[[Bool]]";
					};
					class EnableSimulation {
						data = "enableSimulation";
						control = "Checkbox";
						displayName = "$STR_3DEN_Object_Attribute_EnableSimulation_displayName";
						tooltip = "$STR_3DEN_Object_Attribute_EnableSimulation_tooltip";
						wikiType = "[[Bool]]";
					};
					class EnableStamina {
						property = "enableStamina";
						control = "Checkbox";
						displayName = "$STR_3DEN_Object_Attribute_EnableStamina_displayName";
						tooltip = "$STR_3DEN_Object_Attribute_EnableStamina_tooltip";
						expression = "_this enablestamina _value;";
						defaultValue = "true";
						condition = "objectBrain";
						wikiType = "[[Bool]]";
					};
					class HideObject {
						property = "hideObject";
						control = "CheckboxReversed";
						displayName = "$STR_3DEN_Object_Attribute_HideObject_displayName";
						tooltip = "$STR_3DEN_Object_Attribute_HideObject_tooltip";
						expression = "if !(is3DEN) then {_this hideobjectglobal _value;};";
						defaultValue = "false";
						wikiType = "[[Bool]]";
					};
				};
			};
            class StateSpecial {
	            class Attributes {
		            delete AllowDamage;
//		            delete EnableRevive;
		            delete EnableSimulation;
		            delete EnableStamina;
		            delete HideObject;
		            class GW_DisableHC {
						displayName = "Disable HC Transfer";
						tooltip = "Disables Auto Transfer Group to Headless Client   (Requires GW Framework)";
						property = "GW_DisableHC";
						control = "Checkbox";
						expression = "(group _this) setVariable ['GW_HeadlessController_BlackList', _value, true];";
						defaultValue = "false";
						condition = "objectBrain";
					};
				};
			};
		};
	};

	class EventHandlers {
		class GW {
			OnMessage = QUOTE(call FUNC(addEH_onMessage));
			onMissionLoad = "[] call GW_3DEN_fnc_init";
			onMissionNew = "[] call GW_3DEN_fnc_init";
			onMissionPreviewEnd = "[] call GW_3DEN_fnc_init";
			onTerrainNew = "[] call GW_3DEN_fnc_init";
		};
	};

	class Tutorials {
		class GW_Help_Editing {
			displayName = "Advenced Editing";
			class Sections {
				class GW_Help_doActions {
					displayName = "Do Actions";
					class Steps {
						class GW_Help_doActions_SelectPosition {
							text = "Advanced Actions: <br/>Some actions may sometimes require a location and they are highlighted with a ""*"" in the end of its action";
						};
						class GW_Help_doActions_SelectPosition_2 {
							text = "Step 1: <br/>To mark the location simply right click to open a menu and it will automaticly store its position in the memory";
						};
						class GW_Help_doActions_SelectPosition_3 {
							text = "Step 2: <br/>Select the advanced action that you desire";
						};
					};
				};
				class GW_Help_Composition {
					displayName = "Create A Composition";
					class Steps {
						class GW_Help_Composition_1 {
							text = "Step 1: <br/>Select the objects you want to be copied";
						};
						class GW_Help_Composition_2 {
							text = "Step 2: <br/>All objects will be copied from the location of where the player is located";
						};
						class GW_Help_Composition_3 {
							text = "Step 3: <br/>Copy the composition from GW Tools and store it in a external text document and then later it can be added to the addon";
						};
					};
				};
			};
		};
	};
};
