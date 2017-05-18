
class Cfg3DEN {
	class Mission {
		class Preferences {
			class AttributeCategories {
				class GW_Options {
					displayName = "GW Settings";
					class Attributes {
						class GW_GarrisonRadius {
							displayName = "Garrison Radius";
							tooltip = "Buildings to gather around unit clicked";
							property = "GW_GarrisonRadius";
							control = "EditShort";
							expression = "";
							defaultValue = "100";
							typeName = "NUMBER";
						};
						class GW_WaypointRadius {
							displayName = "Waypoint Radius";
							tooltip = "Places waypoints in a radius around right clicked";
							property = "GW_WaypointRadius";
							control = "EditShort";
							expression = "";
							defaultValue = "250";
							typeName = "NUMBER";
						};
						class GW_WaypointCount {
							displayName = "Waypoint Count";
							tooltip = "Amount of waypoints to be placed";
							property = "GW_WaypointCount";
							control = "EditShort";
							expression = "";
							defaultValue = "10";
							typeName = "NUMBER";
						};
						class GW_HideObjectRadius {
							displayName = "Hide Object Radius";
							tooltip = "In meters, 0 = is closest object";
							property = "GW_HideObjectRadius";
							control = "EditShort";
							expression = "";
							defaultValue = "0";
							typeName = "NUMBER";
						};
						class GW_ShowObjectRadius {
							displayName = "Show Object Radius";
							tooltip = "In meters, 0 = is closest object";
							property = "GW_ShowObjectRadius";
							control = "EditShort";
							expression = "";
							defaultValue = "0";
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
		};
	};

	class EventHandlers {
		class GW {
			OnMessage = "if (((_this select 0) isEqualTo 6) && ((['GW_FRAMEWORK', 'Core', 'devBuild'] call BIS_fnc_getCfgData) isEqualTo -2)) then { ['Warning debug mode is enabled','I understand'] call BIS_fnc_3DENShowMessage; };";
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
