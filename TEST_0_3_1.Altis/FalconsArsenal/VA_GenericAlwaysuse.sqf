//--- Edited for Zargabad
if (isServer) exitwith {diag_log "I was kicked from VA_GenAuse.sqf";};
diag_log "////====****READING VA_GenAuse.SQF ****====////";

/////////////////////////////////////////////////////////////////

		GenAuse_Weapons_Standard =
			[
			];
		Weapons_Standard = Weapons_Standard + GenAuse_Weapons_Standard;
		
		GenAuse_Weapons_GLs =
			[
			];
			
		GenAuse_Weapons_ARs =
			[
			];
			
		GenAuse_Weapons_ATs =
			[
			];
			
		GenAuse_Weapons_Snipers =
			[
			];
			
		GenAuse_Weapons_LaserDes =
			[
			];
			
		GenAuse_Weapons_Generic =
			[
				"Rangefinder",
				"Binocular"
			];

		GenAuse_Ammunition = 
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

		GenAuse_Explosives =
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

		GenAuse_Backpacks = 
			[
				"B_Parachute"
			];

		GenAuse_scopes = 
			[
				"optic_Aco",
				"optic_Aco_smg",
				"optic_Holosight",
				"optic_Holosight_smg",
				"optic_Hamr",
				"optic_MRCO",
				"optic_Arco",
				"optic_MRD"
			];	
			
		GenAuse_Scopes_Sniper =
			[
				"optic_AMS",
				"optic_AMS_khk",
				"optic_AMS_snd"
			];
				
		GenAuse_Silencers = 
			[
				"muzzle_snds_acp",
				"muzzle_snds_H",
				"muzzle_snds_L",
				"muzzle_snds_M",
				"muzzle_snds_H_SW",
				"muzzle_snds_B"
			];
				
		GenAuse_Uniforms = 
			[
			];

		GenAuse_Vests = 
			[
			];

		GenAuse_Helmets = 
			[

			];
				
		GenAuse_Hats_Glasses_Masks = 
			[
				"G_Combat",
				"G_Lowprofile",
				"G_Tactical_Black"
			];

		GenAuse_Items_Generic = 
			[
				"ItemCompass",
				"ItemGPS",
				"ItemMap",
				"ItemWatch",
				"acc_flashlight",
				"acc_pointer_IR",
				"bipod_01_F_snd",
				"bipod_01_F_blk",
				"bipod_01_F_mtp"
			];

		if (PARAMS_ALLOW_NVG == 1) then
			{
				GenAuse_NVGs = 
					[
						"NVGoggles"
					];
				GenAuse_Items_Generic = GenAuse_Items_Generic + GenAuse_NVGs;
			};

/////////////////////////////////////////////////////////////////	

GENERAL_GLOBAL = GENERAL_GLOBAL + GenAuse_Items_Generic + GenAuse_Hats_Glasses_Masks + GenAuse_Helmets + GenAuse_Vests + GenAuse_Uniforms + GenAuse_scopes + GenAuse_Backpacks + GenAuse_Ammunition + GenAuse_Weapons_Generic;

/////////////////////////////////////////////////////////////////
GrenadierItems = GrenadierItems+
	[
	] + GENERAL_GLOBAL + GenAuse_Weapons_GLs;
	
/////////////////////////////////////////////////////////////////			
AutoriflemanItems = AutoriflemanItems+
	[
	
	] + GENERAL_GLOBAL + GenAuse_Weapons_ARs;

/////////////////////////////////////////////////////////////////
ATItems = ATItems+
	[

	] + GENERAL_GLOBAL + GenAuse_Weapons_ATs + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
MedicItems = MedicItems+
	[

	] + GENERAL_GLOBAL + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
EODItems = EODItems+
	[
		"ToolKit"
	] + GENERAL_GLOBAL + GenAuse_Explosives + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
PilotItems = PilotItems+
	[
		"ToolKit",
		"U_B_HeliPilotCoveralls",
		"H_HelmetCrew_B",
		"H_PilotHelmetHeli_B"
	] + GENERAL_GLOBAL;
/////////////////////////////////////////////////////////////////
RTOItems = RTOItems+
	[
	
	] + GENERAL_GLOBAL + GenAuse_Weapons_Standard;
/////////////////////////////////////////////////////////////////
RifelmanItems = RifelmanItems+
	[	
	] + GENERAL_GLOBAL + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
CommanderItems = CommanderItems+
	[
		"Laserdesignator"
	] + GENERAL_GLOBAL + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
SquadLeadItems = SquadLeadItems+
	[
		"Laserdesignator"
	] + GENERAL_GLOBAL + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
TeamLeadItems = TeamLeadItems+
	[
		"Laserdesignator"
	] + GENERAL_GLOBAL + GenAuse_Weapons_GLs + GenAuse_Weapons_Standard;
	
/////////////////////////////////////////////////////////////////
ReconTLItems = ReconTLItems+
	[	
		"Laserdesignator"
	] + GENERAL_GLOBAL + GenAuse_Silencers + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
MarksmanItems = MarksmanItems+
	[
		"U_B_FullGhillie_lsh"
	] + GENERAL_GLOBAL + GenAuse_Weapons_Snipers + GenAuse_Silencers + GenAuse_Scopes_Sniper ;

/////////////////////////////////////////////////////////////////
ReconItems = ReconItems+
	[	
	] + GENERAL_GLOBAL + GenAuse_Silencers + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
JTACItems = JTACItems+
	[
		"Laserdesignator"
	] + GENERAL_GLOBAL + GenAuse_Silencers + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconMedic = RconMedic+
	[
	] + GENERAL_GLOBAL + GenAuse_Silencers + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
UAVItems = UAVItems+
	[
		"B_UAV_01_backpack_F",
		"B_UavTerminal"
	] + GENERAL_GLOBAL + GenAuse_Silencers  + GenAuse_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconExp = RconExp+
	[
		"ToolKit"
	] + GENERAL_GLOBAL + GenAuse_Silencers + GenAuse_Weapons_Standard + GenAuse_Explosives;

/////////////////////////////////////////////////////////////////
