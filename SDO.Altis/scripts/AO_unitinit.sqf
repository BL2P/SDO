

private ["_unit","_backpack","_primaryAmmo","_secondaryAmmo","_ammo"];

		_unit = _this;

		_backpack = backpack _unit;
		if (_backpack == "") then
		{
			_unit addBackpack (["B_Carryall_ocamo","B_Kitbag_sgg","B_Bergen_sgg"] call BIS_fnc_selectRandom);
		};

		_primaryAmmo = primaryWeaponMagazine _unit; 
		_secondaryAmmo = secondaryWeaponMagazine _unit; 

		if (count _secondaryAmmo > 0) then 
		{
			_ammo = _secondaryAmmo select 0;
			_unit addMagazine _ammo;
			_unit addMagazine _ammo;
		};

		if (count _primaryAmmo > 0) then 
		{
			{
				_ammo = _x;
				for [{_y=1}, {_y<=8}, {_y=_y+1}] do {
					_unit addMagazine _ammo;
				};
			} forEach _primaryAmmo;
		};
