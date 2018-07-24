#include "script_Component.hpp"
disableSerialization;
#define	SETTING(Var1)	getText(missionConfigFile >> "GW_FRAMEWORK" >> "Naming" >> Var1)

private _output = [];
private _events = [];
private _errorCount = 0;
private _ctrlListbox = (_this controlsGroupCtrl 15675);
private _ctrlListButton = (_this controlsGroupCtrl 15676);

_output append (_this call FUNC(AutoTest_Mission));

_output pushBack [-1,""];
_output pushBack [-1,"========================================================================"];	// Seperator
_output pushBack [-1,""];

_output append (_this call FUNC(AutoTest_Common));

{
	_x params ["_img", "_message", ["_tooltip", "", [""]], ["_eventIndex", [-1]]];
	_index = _ctrlListbox lbAdd _message;
	_events pushBack _eventIndex;

	if ((_eventIndex select 0) isEqualTo -1) then {
		_ctrlListButton lbAdd "";
	} else {
		_ctrlListButton lbAdd "| GO TO |";
	};

	if !(_tooltip isEqualTo "") then {
		_ctrlListbox lbSetTooltip [_index, _tooltip];
	};

	if (_img isEqualTo 0) then {
		_ctrlListbox lbSetPicture [_index, QPATHTOF(UI\_Approved.paa)];
	};
	if (_img isEqualTo 1) then {
		_ctrlListbox lbSetPicture [_index, QPATHTOF(UI\_warning.paa)];
	};
	if (_img isEqualTo 2) then {
		_ctrlListbox lbSetPicture [_index, QPATHTOF(UI\_Error.paa)];
		_errorCount = _errorCount + 1;
	};
} forEach _output;

_ctrlListbox setVariable [QEGVAR(3den,AutoTestEvents), _events];

if (_errorCount > 0) then {
	_index = _ctrlListbox lbAdd "";
	_index = _ctrlListbox lbAdd "========================================================================";
	_index = _ctrlListbox lbAdd "";
	_index = _ctrlListbox lbAdd format ["%1 Errors found, Mission is NOT ready to play", _errorCount];
	_ctrlListbox lbSetTooltip [_index, "Fix current errors and try again"];
	_ctrlListbox lbSetPicture [_index, QPATHTOF(UI\_Error.paa)];

	_ctrlListButton lbAdd "";
	_ctrlListButton lbAdd "";
	_ctrlListButton lbAdd "";
	_ctrlListButton lbAdd "";
};

EGVAR(3den,ExportErrorCount) = _errorCount;
EGVAR(3den,AutoTestEvents) = _events;

uiNamespace setVariable [QGVARMAIN(ctrlListbox), _ctrlListbox];
uiNamespace setVariable [QGVARMAIN(ctrlListButton), _ctrlListButton];
