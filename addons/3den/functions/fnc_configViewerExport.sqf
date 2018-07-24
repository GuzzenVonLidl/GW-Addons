/*

	Author: DreadedEntity, Simplified by GuzzenVonLidl
	Outputs a full class definition, even returning subclasses and their attributes
	This function should not be called manually, and only from the config viewer screen

	Usage:
	[] call GW_3den_fnc_configViewerExport;

	Arguments: NO

	Return Value: YES <CONFIG>

	Public: NO
*/
#include "script_Component.hpp"

disableSerialization;
_cfgViewer = findDisplay 2928;
_ed_config = _cfgViewer displayCtrl 1400;
_btn_export = _cfgViewer displayCtrl 7301;
_curCfgArr = call compile (ctrltext _ed_config);

_fnc_copyConfigClass = {
	if (!isClass (_this select 0)) exitWith {"noClass"};
	params ["_class", ["_numTabs", 0, [0]], ["_output", "", [""]]];
	private ["_numParams","_param","_newConfig"];

	private _MAKE_TABS = {
		_tabs = "";
		for "_t" from 1 to _this do {
			_tabs = _tabs + (toString [9]);
		};
		_tabs;
	};

	private _params = [];
	private _newLine = toString [13, 10];
	private _parents = _class call BIS_fnc_returnParents;
	private _output = _output + (_numTabs call _MAKE_TABS) + "class " + (configName (_this select 0)) + _newLine + (_numTabs call _MAKE_TABS) + "{" + _newline;

	{
		_numParams = (count _x) - 1;
		for "_i" from 0 to _numParams do {
			_param = configName (_x select _i);
			_newConfig = (_this select 0) >> _param;
			if (isClass _newConfig) then {
				_output = [_newConfig, _numTabs + 1, _output] call _fnc_copyConfigClass;
			} else {
				_newParam = _param;
				_data = nil;
				switch (true) do {
					case (isNumber _newConfig): {
						_data = getNumber _newConfig;
					};
					case (isText _newConfig): {
						_data = str(getText _newConfig);
					};
					case (isArray _newConfig): {
						_newParam = _newParam + "[]";
						_data = str(getArray _newConfig);
						_data = "{" + (_data select [1, (count _data) - 2]) + "}";
					};
				};
				if (_params find _param == -1) then {
					_output = _output + ((_numTabs + 1) call _MAKE_TABS) + format["%1 = %2;%3", _newParam, _data, _newLine];
					_params pushBack _param;
				};
			};
		};
	} forEach _parents;
	_output = _output + (_numTabs call _MAKE_TABS) + "};" + _newline;
	copyToClipboard _output;
	_output
};

[_curCfgArr] call _fnc_copyConfigClass;
