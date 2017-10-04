/*
	[] call GW_enhancements_fnc_switchAttachment
*/
#include "script_component.hpp"

private _currentItem = ((primaryWeaponItems player) select 1);
private _attachments = ([_currentItem] call FUNC(findAttachment));
if !(_attachments isEqualTo []) then {
	private _nextItem = (_attachments select 0);
	if (_currentItem isEqualTo _nextItem) then {
		_nextItem = (_attachments select 1);
	};

	private _lightActive = (player isFlashlightOn (currentWeapon player) || player isIRLaserOn (currentWeapon player));
	player removePrimaryWeaponItem _currentItem;
	playSound "GW_enhancements_Attachment";
	[{
		params ["_currentItem","_nextItem","_lightActive"];
		player addPrimaryWeaponItem _nextItem;

		if (_lightActive) then {
			player action ["IRLaserOn", player];
			player action ["GunLightOn", player];
		};
		hint format ["%1", (configfile >> "CfgWeapons" >> _nextItem >> "displayName") call BIS_fnc_getCfgData];
		[{
			hint "";
		}, [], 3] call CBA_fnc_waitAndExecute;
	}, [_currentItem, _nextItem, _lightActive], 0.1] call CBA_fnc_waitAndExecute;
};
