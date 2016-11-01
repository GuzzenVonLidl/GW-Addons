
class Cfg3DEN {
	class Mission {
//			#include "missionAttributes\preferences.hpp"
	 };
	class Object {
		class AttributeCategories {
			class Inventory {
				displayName = $STR_3DEN_Object_AttributeCategory_Storage;
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
			onMissionLoad = "['load'] call GW_3DEN_fnc_init";
			onMissionNew = "['new'] call GW_3DEN_fnc_init";
			onMissionPreviewEnd = "['PreviewEnd'] call GW_3DEN_fnc_init";
			OnMissionSave = "['save'] call GW_3DEN_fnc_init";	// No?
			onTerrainNew = "['terrain'] call GW_3DEN_fnc_init";
		};
	};
};

/*
			onConnectingEnd = "['connectEnd',_this] call bis_fnc_3DENControlsHint;";
			onConnectingStart = "['connectStart',_this] call bis_fnc_3DENControlsHint;";
			onEntityMenu = "['onEntityMenu',_this] call bis_fnc_3DENEntityMenu;";
			onGridChange = "['OnGridChange',_this,true] call bis_fnc_3DENGrid;";
			onHistoryChange = "['History'] call bis_fnc_3DENToolbar;";
			onMapClosed = "['ToggleMap'] call bis_fnc_3DENToolbar;";
			onMapOpened = "['ToggleMap'] call bis_fnc_3DENToolbar;";
			onMessage = "_this call bis_fnc_3DENNotification;";
			onMissionAutosave = "1 call bis_fnc_3DENNotification;";
			onMissionListChange = "['onMissionListChange',0] call bis_fnc_3DENInterface;";
			onMissionLoad = "['Init'] call bis_fnc_3DENToolbar; ['History'] call bis_fnc_3DENToolbar; ['MissionSection'] spawn bis_fnc_3DENToolbar; ['PlaceEmpty'] spawn bis_fnc_3DENInterface;	";
			onMissionNew = "['History'] call bis_fnc_3DENToolbar; ['MissionSection'] spawn bis_fnc_3DENToolbar; ['PlaceEmpty'] spawn bis_fnc_3DENInterface; 0 call BIS_fnc_3DENVisionMode; 0 call BIS_fnc_3DENFlashlight;";
			onMissionPreview = "['onMissionPreview',_this] spawn bis_fnc_3DENMissionPreview;";
			onMissionPreviewEnd = "['onMissionPreviewEnd',_this] call bis_fnc_3DENMissionPreview; true call bis_fnc_3DENDrawLocations; _this'server' call bis_fnc_3DENStatusBar; [] spawn bis_fnc_3dentutorial; ['reset'] call bis_fnc_3DENEntityMenu; -2 spawn BIS_fnc_3DENVisionMode; -2 call BIS_fnc_3DENFlashlight; enableenvironment ('Preferences' get3DENMissionAttribute 'EnableEnvironment');";
			onModeChange = "['showInterface',true] call bis_fnc_3DENInterface; ['showPanelRight',true] call bis_fnc_3DENInterface; ['mode'] spawn bis_fnc_3DENInterface; ['subMode'] spawn bis_fnc_3DENInterface;";
			onMoveGridToggle = "['MoveGridToggle'] call bis_fnc_3DENToolbar;";
			onRedo = "['History'] call bis_fnc_3DENToolbar;";
			onRotateGridToggle = "['RotateGridToggle'] call bis_fnc_3DENToolbar;";
			onScaleGridToggle = "['ScaleGridToggle'] call bis_fnc_3DENToolbar;";
			onSearchCreate = "['TabRight',0] call bis_fnc_3DENInterface;";
			onSearchEdit = "['TabLeft',0] call bis_fnc_3DENInterface;";
			onSelectionChange = "'select' call bis_fnc_3DENControlsHint;";
			onServerToggle = "'Server' call bis_fnc_3DENStatusBar; 'ButtonPlay' call bis_fnc_3DENInterface;";
			onSubmodeChange = "['showInterface',true] call bis_fnc_3DENInterface; ['showPanelRight',true] call bis_fnc_3DENInterface; ['subMode'] spawn bis_fnc_3DENInterface;";
			onSurfaceSnapToggle = "['SurfaceSnapToggle'] call bis_fnc_3DENToolbar;";
			onTerrainNew = "true call bis_fnc_3DENDrawLocations;'init' call bis_fnc_3DENListLocations;'ButtonPlay' call bis_fnc_3DENInterface;'FadeIn' spawn bis_fnc_3DENInterface;['Init'] call bis_fnc_3DENToolbar;0 call BIS_fnc_3DENVisionMode;0 call BIS_fnc_3DENFlashlight;if (missionname == '' && ('preferences' get3denmissionattribute 'StartRandom')) then {'random' call bis_fnc_3DENCamera;};'onTerrainNew' call bis_fnc_3DENInterface;enableenvironment ('Preferences' get3DENMissionAttribute 'EnableEnvironment');";
			onTogglePlaceEmptyVehicle = "['PlaceEmpty'] spawn bis_fnc_3DENInterface;";
			onUndo = "['History'] call bis_fnc_3DENToolbar;";
			onVerticalToggle = "['VerticalToggle'] call bis_fnc_3DENToolbar;";
			onWidgetArea = "['WidgetToggle'] call bis_fnc_3DENToolbar;";
			onWidgetNone = "['WidgetToggle'] call bis_fnc_3DENToolbar;";
			onWidgetRotation = "['WidgetToggle'] call bis_fnc_3DENToolbar;";
			onWidgetScale = "['WidgetToggle'] call bis_fnc_3DENToolbar;";
			onWidgetToggle = "['WidgetToggle'] call bis_fnc_3DENToolbar;";
			onWidgetTranslation = "['WidgetToggle'] call bis_fnc_3DENToolbar;";
			onWorkspacePartSwitch = "['MissionSection'] spawn bis_fnc_3DENToolbar;";
*/
