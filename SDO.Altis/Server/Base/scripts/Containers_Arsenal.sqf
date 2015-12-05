if (DEBUG) then {
diag_log "***Reading Container_Arsenal ================";
};
if (isNil "PARAMS_ALLOW_3CB")  then  { waitUntil{!isNil "PARAMS_ALLOW_3CB"};};



//--- AmmoTruck Start
	_FALCONS_Box = _this select 0;

	["AmmoboxInit",[_FALCONS_Box,false]] call BIS_fnc_arsenal;

	[_FALCONS_Box,[true],true] call BIS_fnc_removeVirtualBackpackCargo;
	[_FALCONS_Box,[true],true] call BIS_fnc_removeVirtualItemCargo;
	[_FALCONS_Box,[true],true] call BIS_fnc_removeVirtualWeaponCargo;
	[_FALCONS_Box,[true],true] call BIS_fnc_removeVirtualMagazineCargo;

//--- Universal Gear

		_AmmoTruckammo = [];
		
if (PARAMS_ALLOW_BIS == 1) then
	{
	Bis_AmmunitionTruck = 
			[
				"10Rnd_338_Mag",
				"130Rnd_338_Mag",
				"30Rnd_45ACP_Mag_SMG_01",
				"30Rnd_45ACP_Mag_SMG_01_tracer_green",
				"11Rnd_45ACP_Mag",
				"16Rnd_9x21_Mag",
				"30Rnd_65x39_caseless_mag",
				"30Rnd_65x39_caseless_mag_Tracer",
				"100Rnd_65x39_caseless_mag",
				"100Rnd_65x39_caseless_mag_Tracer",
				"200Rnd_65x39_cased_Box",
				"200Rnd_65x39_cased_Box_Tracer",
				"30Rnd_556x45_Stanag",
				"30Rnd_556x45_Stanag_Tracer_Red",
				"20Rnd_762x51_Mag",
				"1Rnd_HE_Grenade_shell",
				"3Rnd_HE_Grenade_shell",
				
				"NLAW_F",
				"Titan_AA",
				"Titan_AT",
				
				"Laserbatteries",
				"SmokeShell",
				"SmokeShellBlue",
				"SmokeShellYellow",
				"SmokeShellGreen",
				"SmokeShellOrange",
				"SmokeShellPurple",
				"SmokeShellRed",
				"HandGrenade",
				"MiniGrenade",
				"B_IR_Grenade",
				
				"1Rnd_Smoke_Grenade_shell",
				"1Rnd_SmokeBlue_Grenade_shell",
				"1Rnd_SmokeGreen_Grenade_shell",
				"1Rnd_SmokeOrange_Grenade_shell",
				"1Rnd_SmokePurple_Grenade_shell",
				"1Rnd_SmokeRed_Grenade_shell",
				"1Rnd_SmokeYellow_Grenade_shell",
				
				"3Rnd_Smoke_Grenade_shell",
				"3Rnd_SmokeBlue_Grenade_shell",
				"3Rnd_SmokeGreen_Grenade_shell",
				"3Rnd_SmokeOrange_Grenade_shell",
				"3Rnd_SmokePurple_Grenade_shell",
				"3Rnd_SmokeRed_Grenade_shell",
				"3Rnd_SmokeYellow_Grenade_shell",
				"3Rnd_UGL_FlareCIR_F",
				"3Rnd_UGL_FlareGreen_F",
				"3Rnd_UGL_FlareRed_F",
				"3Rnd_UGL_FlareWhite_F",
				
				"UGL_FlareCIR_F",
				"UGL_FlareGreen_F",
				"UGL_FlareRed_F",
				"UGL_FlareWhite_F",
				
				"Chemlight_green",
				"Chemlight_red",
				"Chemlight_yellow",
				"Chemlight_blue"
			];
		Bis_Explosives =
			[
				"APERSBoundingMine_Range_Mag",
				"APERSMine_Range_Mag",
				"APERSTripMine_Wire_Mag",
				"ATMine_Range_Mag",
				"ClaymoreDirectionalMine_Remote_Mag",
				"SLAMDirectionalMine_Wire_Mag",
				"DemoCharge_Remote_Mag",
				"SatchelCharge_Remote_Mag"
			];
		_AmmoTruckammo = 	_AmmoTruckammo + Bis_AmmunitionTruck + Bis_Explosives;
	};

if (PARAMS_ALLOW_FAL == 1) then
	{
	};

if (PARAMS_ALLOW_ACE == 1) then
	{
	ACE_AmmunitionTruck = 
			[
						"ACE_100Rnd_65x39_caseless_mag_Tracer_Dim",
						"ACE_200Rnd_65x39_cased_Box_Tracer_Dim",
						"ACE_30Rnd_65x39_caseless_mag_Tracer_Dim",
						"ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim",
						"ACE_30Rnd_556x45_Stanag_M995_AP_mag",
						"ACE_30Rnd_556x45_Stanag_Mk262_mag",
						"ACE_30Rnd_556x45_Stanag_Mk318_mag",
						"ACE_30Rnd_556x45_Stanag_Tracer_Dim",
						"ACE_20Rnd_762x51_Mag_Tracer",
						"ACE_20Rnd_762x51_Mag_Tracer_Dim",
						"ACE_20Rnd_762x51_Mag_SD",
						"ACE_10Rnd_762x51_M118LR_Mag",
						"ACE_10Rnd_762x51_Mk316_Mod_0_Mag",
						"ACE_10Rnd_762x51_Mk319_Mod_0_Mag",
						"ACE_10Rnd_762x51_M993_AP_Mag",
						"ACE_20Rnd_762x51_M118LR_Mag",
						"ACE_20Rnd_762x51_Mk316_Mod_0_Mag",
						"ACE_20Rnd_762x51_Mk319_Mod_0_Mag",
						"ACE_20Rnd_762x51_M993_AP_Mag",
						"ACE_20Rnd_762x67_Mk248_Mod_0_Mag",
						"ACE_20Rnd_762x67_Mk248_Mod_1_Mag",
						"ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag",
						"ACE_30Rnd_65x47_Scenar_mag",
						"ACE_30Rnd_65_Creedmor_mag",
						"ACE_10Rnd_338_300gr_HPBT_Mag",
						"ACE_10Rnd_338_API526_Mag",
						"ACE_5Rnd_127x99_Mag",
						"ACE_5Rnd_127x99_API_Mag",
						"ACE_5Rnd_127x99_AMAX_Mag",
						"ACE_30Rnd_9x19_mag",
						"ACE_16Rnd_9x19_mag",
						"ACE_10Rnd_762x54_Tracer_mag",
			
						"ACE_HandFlare_White",
						"ACE_M84",
						"ACE_HuntIR_M203"
			];
	_AmmoTruckammo = 	_AmmoTruckammo + ACE_AmmunitionTruck;
	};

if (PARAMS_ALLOW_RHS == 1) then
	{
	RHS_AmmunitionTruck = 
			[
				//--- RHS 249 
					"rhs_200rnd_556x45_M_SAW",
					"rhs_200rnd_556x45_T_SAW",
					"rhs_200rnd_556x45_B_SAW",
					"rhsusf_100Rnd_556x45_soft_pouch",
					//"rhsusf_100Rnd_556x45_M200_soft_pouch",
					"rhsusf_200Rnd_556x45_soft_pouch",
				//--- RHS 240 Ammo
					"rhsusf_100Rnd_762x51",
					"rhsusf_100Rnd_762x51_m61_ap",
					"rhsusf_100Rnd_762x51_m62_tracer",
				//--- RHS Basic Stanag
					"rhs_mag_30Rnd_556x45_Mk318_Stanag",
					"rhs_mag_30Rnd_556x45_M855A1_Stanag",
					"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
				//-- RHS Others
					"rhsusf_20Rnd_762x51_m118_special_Mag",
					"rhsusf_20Rnd_762x51_m993_Mag",
					"rhsusf_5Rnd_300winmag_xm2010",
					"10Rnd_RHS_50BMG_Box",
					"rhsusf_10Rnd_STD_50BMG_M107",
				//--- RHS Shotgun ammo
					"rhsusf_5Rnd_00Buck",
					"rhsusf_8Rnd_00Buck",
					"rhsusf_5Rnd_Slug",
					"rhsusf_8Rnd_Slug",
				//--- GL Rounds
					"rhs_mag_M441_HE",
					"rhs_mag_M433_HEDP",
					"rhsusf_mag_6Rnd_M441_HE",
					"rhsusf_mag_6Rnd_M576_Buckshot",
					"rhsusf_mag_6Rnd_M433_HEDP",
					"rhsusf_mag_6Rnd_M714_white",
				//---RHS GL Flares and smokes

				//---RHS Pistol
					"rhsusf_mag_7x45acp_MHP",
					"rhsusf_mag_17Rnd_9x19_FMJ",
					"rhsusf_mag_17Rnd_9x19_JHP",
				//--- RHS Launcher rounds
					"rhs_m136_mag",
					"rhs_m136_hedp_mag",
					"rhs_m136_hp_mag",
					"rhs_fim92_mag",
					"rhs_fgm148_magazine_AT"
			];
		_AmmoTruckammo = 	_AmmoTruckammo + RHS_AmmunitionTruck;
	};

if (PARAMS_ALLOW_3CB == 1) then
	{
	CB_AmmunitionTruck = 
			[
				"UK3CB_BAF_30Rnd",
				"UK3CB_BAF_30Rnd_T",
				"UK3CB_BAF_100Rnd",
				"UK3CB_BAF_100Rnd_T",
				"UK3CB_BAF_200Rnd",
				"UK3CB_BAF_200Rnd_T",
				"UK3CB_BAF_20Rnd",
				"UK3CB_BAF_20Rnd_T",
				"UK3CB_BAF_75Rnd",
				"UK3CB_BAF_75Rnd_T",
				"UK3CB_BAF_17Rnd_9mm",
				"UK3CB_BAF_30Rnd_9mm",
				"UK3CB_BAF_10Rnd_127x99mm",
				"UK3CB_BAF_10Rnd_127x99mm_SLAP",
				"UK3CB_BAF_L115A3_Mag",
				"UK3CB_BAF_L128A1_Pellets",
				"UK3CB_BAF_L128A1_Slugs",
				"UK3CB_BAF_1Rnd_HEDP_Grenade_shell"
			];
	_AmmoTruckammo = 	_AmmoTruckammo + CB_AmmunitionTruck;
	};

	_Weapons_ATsBOTH =
				[
					"launch_B_Titan_F",
					"launch_B_Titan_short_F",
					"launch_NLAW_F",
					"UK3CB_BAF_AT4_AT_Launcher",
					"UK3CB_BAF_AT4_AP_Launcher",
					"UK3CB_BAF_AT4_CS_AT_Launcher",  
					"UK3CB_BAF_AT4_CS_AP_Launcher",
					"UK3CB_BAF_NLAW_Launcher",
					"UK3CB_BAF_Javelin_Launcher",
					"UK3CB_BAF_Javelin_Slung_Tube"
				];
				
	_Weapons_ATsBIS =
				[
							"launch_B_Titan_F",
							"launch_B_Titan_short_F",
							"launch_NLAW_F"
				];
				
	_Weapons_ATs3CB =
				[
					"UK3CB_BAF_AT4_AT_Launcher",
					"UK3CB_BAF_AT4_AP_Launcher",
					"UK3CB_BAF_AT4_CS_AT_Launcher",  
					"UK3CB_BAF_AT4_CS_AP_Launcher",
					"UK3CB_BAF_NLAW_Launcher",
					"UK3CB_BAF_Javelin_Launcher",
					"UK3CB_BAF_Javelin_Slung_Tube"
				];			
				

[_FALCONS_Box,[] + _AmmoTruckammo,true] call BIS_fnc_addVirtualMagazineCargo;

if (PARAMS_SELECT_Launchers == 0) then
	{
		[_FALCONS_Box,[] + _Weapons_ATsBOTH ,true] call BIS_fnc_addVirtualWeaponCargo;
	};
if (PARAMS_SELECT_Launchers == 1) then
	{
		[_FALCONS_Box,[] + _Weapons_ATsBIS ,true] call BIS_fnc_addVirtualWeaponCargo;
	};
if (PARAMS_SELECT_Launchers == 2) then
	{
		[_FALCONS_Box,[] + _Weapons_ATs3CB ,true] call BIS_fnc_addVirtualWeaponCargo;
	};
	
[_FALCONS_Box,[],true] call BIS_fnc_addVirtualItemCargo;

[_FALCONS_Box,[],true] call BIS_fnc_addVirtualBackpackCargo;

if (DEBUG) then {
diag_log "***Finished Reading  Container_Arsenal================";
};