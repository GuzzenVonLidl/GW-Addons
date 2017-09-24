/*
	Author: GuzzenVonLidl
	Idea from Revo

	Description:
	Moves selected objects into a circular pattern.

	Parameter(s):
	-

	Returns:
	true/false
*/

private _allEntities = ((get3DENSelected "object") + (get3DENSelected "Marker") + (get3DENSelected "Trigger") + (get3DENSelected "Logic"));
if ((count _allEntities) < 2) exitWith {false};

private _radius = ("Preferences" get3DENMissionAttribute "GW_PatternOffset");
private _getObject = (_allEntities select 0);
private _center = ((_getObject get3DENAttribute "Position") select 0);
private _rotation = ((_getObject get3DENAttribute "Rotation") select 0);

collect3DENHistory {
	{
		private _pos = (_center getPos [_radius, ((360/(count _allEntities)) * _forEachIndex)]);
		_x set3DENAttribute ["Position",_pos];
		_x set3DENAttribute ["Rotation",[0,0,(360/(count _allEntities)) * _forEachIndex]];
	} forEach _allEntities;
};

true
