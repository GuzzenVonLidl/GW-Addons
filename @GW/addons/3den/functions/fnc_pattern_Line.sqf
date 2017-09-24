/*
	Author: GuzzenVonLidl
	Idea from Revo

	Description:
	Moves all selected entities into a perfect line and sets their orientation to 0.

	Parameter(s):
	-

	Returns:
	true/false
*/

private _offset = ("Preferences" get3DENMissionAttribute "GW_PatternOffset");
private _allEntities = ((get3DENSelected "object") + (get3DENSelected "Marker") + (get3DENSelected "Trigger") + (get3DENSelected "Logic"));
if ((count _allEntities) < 2) exitWith {false};

private _getObject = (_allEntities select 0);
private _lastPos = ((_getObject get3DENAttribute "Position") select 0);
private _rotation = ((_getObject get3DENAttribute "Rotation") select 0);

collect3DENHistory {
	{
		_x set3DENAttribute ["Position", _lastPos];
		_x set3DENAttribute ["Rotation", _rotation];
		_lastPos set [0, ((_lastPos select 0) + _offset)];
	} forEach _allEntities;
};

true
