private ["_unit","_backpack","_primaryAmmo","_secondaryAmmo","_ammo"];
_unit = _this select 0;


//////////////////////////////
_type = 0;
if ((typeOf _unit) in dep_guer_units) then
{
	_type = 1;
} else {
	if ((typeOf _unit) in dep_mil_units) then
	{
		_type = 2;
	};
};

_primary = primaryWeapon _unit;
_unit removeWeaponGlobal "rhs_weap_rsp30_red";

if (_type == 1) then 
{
	if ((typeOf _unit) =="TBan_Fighter3NH") then {
		_unit addWeaponGlobal "rhs_weap_svd_pso1";
		_unit addMagazines ["rhs_10Rnd_762x54mmR_7N1", 8];	
	};
	if ((typeOf _unit) =="TBan_Fighter1") then {
		_unit addWeaponGlobal "rhs_weap_ak74m_2mag";
		_unit addMagazines ["rhs_30Rnd_545x39_AK", 8];
	};
	if ((typeOf _unit) =="TBan_Fighter2") then {
		_unit addWeaponGlobal "rhs_weap_akm";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];	
	};
	if ((typeOf _unit) =="TBan_Fighter3") then {
		_unit addWeaponGlobal "rhs_weap_akm_gp25";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 5];
		_unit addMagazines ["rhs_VOG25", 8];
	};
	if ((typeOf _unit) =="TBan_Fighter4") then {
		_unit addWeaponGlobal "rhs_weap_pkm";
		_unit addMagazines ["rhs_100Rnd_762x54mmR_green", 8];
	};
	if ((typeOf _unit) =="TBan_Fighter5") then {
		_unit addWeaponGlobal "rhs_weap_akms";
		_unit addWeaponGlobal "rhs_weap_rpg7";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];
		_unit addMagazines ["rhs_rpg7_PG7VL_mag", 2];
		_unit addBackpack "rhs_rpg_empty";
	};
	if ((typeOf _unit) =="TBan_Fighter6") then {
		_unit addWeaponGlobal "rhs_weap_akm";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];	
	};
	if ((typeOf _unit) =="TBan_Fighter2NH") then {
		_unit addWeaponGlobal "rhs_weap_akm";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];
	};
	if ((typeOf _unit) =="TBan_Fighter6NH") then {
		_unit addWeaponGlobal "rhs_weap_akm";
		_unit addWeaponGlobal "rhs_weap_igla";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];
		_unit addMagazines ["rhs_mag_9k38_rocket", 2];
	};

/////////////////////////////////////////////////////////////////////////////////////////////////

	if (_primary == "rhs_weap_ak74m_dtk") then 
	{
		_unit removeWeaponGlobal _primary; 
		//_unit addWeaponGlobal (["rhs_weap_ak74m_camo_folded","rhs_weap_ak74","rhs_weap_ak74m_camo_pkas","rhs_weap_ak74m_dtk"] call bis_fnc_selectRandom);
		_unit addWeaponGlobal (["rhs_weap_ak74m_camo_folded","rhs_weap_ak74m_camo_pkas","rhs_weap_ak74m_dtk"] call bis_fnc_selectRandom);
	};	
};

if (_type == 2) then 
{
	if ((typeOf _unit) =="TBan_Fighter3NH") then {
		_unit addWeaponGlobal "rhs_weap_svd_pso1";
		_unit addMagazines ["rhs_10Rnd_762x54mmR_7N1", 8];	
	};
	if ((typeOf _unit) =="TBan_Fighter1") then {
		_unit addWeaponGlobal "rhs_weap_ak74m_2mag";
		_unit addMagazines ["rhs_30Rnd_545x39_AK", 8];
	};
	if ((typeOf _unit) =="TBan_Fighter2") then {
		_unit addWeaponGlobal "rhs_weap_akm";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];	
	};
	if ((typeOf _unit) =="TBan_Fighter3") then {
		_unit addWeaponGlobal "rhs_weap_akm_gp25";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 5];
		_unit addMagazines ["rhs_VOG25", 8];
	};
	if ((typeOf _unit) =="TBan_Fighter4") then {
		_unit addWeaponGlobal "rhs_weap_pkm";
		_unit addMagazines ["rhs_100Rnd_762x54mmR_green", 8];
	};
	if ((typeOf _unit) =="TBan_Fighter5") then {
		_unit addWeaponGlobal "rhs_weap_akms";
		_unit addWeaponGlobal "rhs_weap_rpg7";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];
		_unit addMagazines ["rhs_rpg7_PG7VL_mag", 2];
		_unit addBackpack "rhs_rpg_empty";
	};
	if ((typeOf _unit) =="TBan_Fighter6") then {
		_unit addWeaponGlobal "rhs_weap_akm";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];	
	};
	if ((typeOf _unit) =="TBan_Fighter2NH") then {
		_unit addWeaponGlobal "rhs_weap_akm";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];
	};
	if ((typeOf _unit) =="TBan_Fighter6NH") then {
		_unit addWeaponGlobal "rhs_weap_akm";
		_unit addWeaponGlobal "rhs_weap_igla";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];
		_unit addMagazines ["rhs_mag_9k38_rocket", 2];
	};

/////////////////////////////////////////////////////////////////////////////////////////////////

	if (_primary == "rhs_weap_ak74m_dtk") then 
	{
		_unit removeWeaponGlobal _primary; 
		_unit removeMagazines "rhs_30Rnd_545x39_7N10_AK";
		_unit addMagazines ["rhs_30Rnd_762x39mm", 8];
		_unit addWeaponGlobal (["rhs_weap_akms","rhs_weap_akm"] call bis_fnc_selectRandom);
	};	
};
//////////////////////////////

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

