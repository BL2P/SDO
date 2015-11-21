/*
	Returns index of the first element in array that meets given conditions. If nothing found returns -1
*/

private ["_cond","_ret","_x"];
_array = _this select 0;
_conditions = _this select 1;

_ret = -1;

{
	if (call _conditions) exitWith {
		_ret = _forEachIndex;
	};
} forEach _array;

_ret





