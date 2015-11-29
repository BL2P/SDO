
if (!isDedicated) then {
	waitUntil {!isNull player && time > 1};
	_target = _this select 0;
	_array = _this select 1;

	switch (true) do {
		case (tolower typeName _target == "side"): {
			switch (true) do {
				case (_target == sideUnknown): {
					[_target, _array] call FalconsArsenal_fnc_createLocalArsenal;
				};
				case (_target == playerSide): {
					[_target, _array] call FalconsArsenal_fnc_createLocalArsenal;
				};
			};
		};
		case (tolower typeName _target == "group"): {
			if (group player == _target) then {
				[_target, _array] call FalconsArsenal_fnc_createLocalArsenal;
			};
		};
		case (tolower typeName _target == "object"): {
			if (player == _target) then {
				[_target, _array] call FalconsArsenal_fnc_createLocalArsenal;
			};
		};
		default {};
	};

};
