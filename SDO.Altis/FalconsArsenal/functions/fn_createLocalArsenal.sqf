private ["_specIndex","_specSlots","_slotsArray","_objArray"];
_target = _this select 0;
_array = _this select 1;

_obj = _array select 0;
_restrictionDistance = _array select 1;
_specNames = _array select 2;
_specSlots = _array select 3;
_specTypes = _array select 4;
_specItems = _array select 5;

_obj removeAction (_obj getVariable ["bis_fnc_arsenal_action", 0]);
_obj removeAction (_obj getVariable ["FalconsArsenal_actionID", -1]);
terminate (_obj getVariable ["FalconsArsenal_restrictionHandle", scriptNull]);

_slotsArray = _obj getVariable ["FalconsArsenal_currentSlots", []];
_index = [_slotsArray, {_x select 0 isEqualTo _target}] call FalconsArsenal_fnc_conditionalIndex;
if !(_index isEqualTo -1) then {
	_specSlots = (_slotsArray select _index) select 1;
};

_specIndex = 0;
for "_i" from 0 to (count _specTypes - 1) do {
	_typeArray = _specTypes select _i;
	if ((toLower str _typeArray) find (toLower typeOf player) > -1) exitWith {
		if (_specSlots select _i != 0) then {
			_specIndex = _i;
		};
	};
};

_obj setVariable ["FalconsArsenal_specNames", _specNames];
_obj setVariable ["FalconsArsenal_specItems", _specItems];

[_specIndex, _obj] call FalconsArsenal_fnc_updateLocalArsenal;

if (_specSlots select _specIndex > -1) then {
	_specSlots set [_specIndex, (_specSlots select _specIndex) - 1 max 0];
};

_slotsArray = _obj getVariable ["FalconsArsenal_currentSlots", []];
_index = [_slotsArray, {_x select 0 isEqualTo _target}] call FalconsArsenal_fnc_conditionalIndex;
if (_index isEqualTo -1) then {
	_slotsArray pushBack [_target, _specSlots];	
} else {
	_slotsArray set [_index, [_target, _specSlots]];
};
_obj setVariable ["FalconsArsenal_currentSlots", _slotsArray, true];

_objArray = player getVariable ["FalconsArsenal_objArray", []];
_index = [_objArray, {_x select 0 isEqualTo _obj && _x select 1 isEqualTo _target}] call FalconsArsenal_fnc_conditionalIndex;
if (_index isEqualTo -1) then {
	_objArray pushBack [_obj, _target, _specIndex];
} else {
	_objArray set [_index, [_obj, _target, _specIndex]];
};
player setVariable ["FalconsArsenal_objArray", _objArray, true];

