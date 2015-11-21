_specIndex = _this select 0;
_obj = _this select 1;
_specItems = _obj getVariable ["FalconsArsenal_specItems", []];

_itemsArray = _specItems select _specIndex;

[_obj, [_obj] call BIS_fnc_getVirtualBackpackCargo] call BIS_fnc_removeVirtualBackpackCargo;
[_obj, [_obj] call BIS_fnc_getVirtualItemCargo] call BIS_fnc_removeVirtualItemCargo;
[_obj, [_obj] call BIS_fnc_getVirtualMagazineCargo] call BIS_fnc_removeVirtualMagazineCargo;
[_obj, [_obj] call BIS_fnc_getVirtualWeaponCargo] call BIS_fnc_removeVirtualWeaponCargo;

[_obj, _itemsArray] call BIS_fnc_addVirtualBackpackCargo; 
[_obj, _itemsArray] call BIS_fnc_addVirtualItemCargo; 
[_obj, _itemsArray] call BIS_fnc_addVirtualMagazineCargo; 
[_obj, _itemsArray] call BIS_fnc_addVirtualWeaponCargo;

_obj removeAction (_obj getVariable ["bis_fnc_arsenal_action", 0]);

_action = _obj addaction [
	("<img image='\A3\Ui_f\data\Logos\a_64_ca.paa' /> " + "Falcons Arsenal"),
	{
		_box = _this select 0;
		_unit = _this select 1;
		["Open",[nil,_box]] call bis_fnc_arsenal;
	},
	[],
	6,
	true,
	false,
	"",
	"
		_cargo = _target getvariable ['bis_addVirtualWeaponCargo_cargo',[[],[],[],[]]];
		if ({count _x > 0} count _cargo == 0) then {
			_target removeaction (_target getvariable ['bis_fnc_arsenal_action',-1]);
			_target setvariable ['bis_fnc_arsenal_action',nil];
		};
		_condition = _target getvariable ['bis_fnc_arsenal_condition',{true}];
		alive _target && {_target distance _this < 8} && {call _condition}
	"
];
_obj setVariable ["bis_fnc_arsenal_action", _action];