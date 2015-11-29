if (isServer) exitwith {diag_log "***I was kicked from VA_BIS.sqf";};
diag_log "***READING VA_BIS.SQF ****====////";

/////////////////////////////////////////////////////////////////

		Bis_Weapons_Standard =
			[
				"arifle_MX_Black_F",
				"arifle_MXC_Black_F",
				"arifle_MXM_Black_F"
			];
		Weapons_Standard = Weapons_Standard + Bis_Weapons_Standard;
		
		Bis_Weapons_GLs =
			[
				"arifle_MX_GL_Black_F"
			];
			
		Bis_Weapons_ARs =
			[
				"arifle_MX_SW_Black_F",
				"LMG_Mk200_F",
				"MMG_02_black_F",
				"MMG_02_sand_F",
				"MMG_02_camo_F"
			];

			Bis_Weapons_ATs =
				[

				];

		Bis_Weapons_Snipers =
			[
				"srifle_EBR_F",
				"srifle_DMR_02_F",
				"srifle_DMR_03_F",
				"srifle_DMR_06_olive_F"
			];
			
		Bis_Weapons_LaserDes =
			[
			];
			
		Bis_Weapons_Generic =
			[
				"SMG_01_F",
				"hgun_P07_F",
				"hgun_Pistol_heavy_01_F",
				"Rangefinder",
				"Binocular"
			];

		Bis_Ammunition = 
			[
				"10Rnd_338_Mag",
				"130Rnd_338_Mag",
				"30Rnd_45ACP_Mag_SMG_01",
				//"30Rnd_45ACP_Mag_SMG_01_tracer_green",
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

		Bis_Backpacks = 
			[
				"B_Parachute"
				//"B_Kitbag_cbr"
			];

		Bis_scopes = 
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
			
		Bis_Scopes_Sniper =
			[
				"optic_AMS",
				"optic_AMS_khk",
				"optic_AMS_snd"
			];
				
		Bis_Silencers = 
			[
				"muzzle_snds_acp",
				"muzzle_snds_H",
				"muzzle_snds_L",
				"muzzle_snds_M",
				"muzzle_snds_H_SW",
				"muzzle_snds_B"
			];
				
		Bis_Uniforms = 
			[
			//	"U_B_CTRG_1",
			//	"U_B_CTRG_2",
			//	"U_B_CTRG_3"
			];

		Bis_Vests = 
			[
			//	"V_PlateCarrierH_CTRG",
			//	"V_PlateCarrierL_CTRG"
			];

		Bis_Helmets = 
			[
			//	"H_HelmetB_camo",
			//	"H_HelmetB_light",
			//	"H_HelmetSpecB"

			];
				
		Bis_Hats_Glasses_Masks = 
			[
			//	"H_Cap_oli_hs",
			//	"G_Tactical_Black",
			//	"G_Bandanna_beast"
			];

		Bis_Items_Generic = 
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
				BIS_NVGs = 
					[
						"NVGoggles"
					];
				Bis_Items_Generic = Bis_Items_Generic + BIS_NVGs;
			};

/////////////////////////////////////////////////////////////////	

GENERAL_GLOBAL = GENERAL_GLOBAL + Bis_Items_Generic + Bis_Hats_Glasses_Masks + Bis_Helmets + Bis_Vests + Bis_Uniforms + Bis_scopes + Bis_Backpacks + Bis_Ammunition + Bis_Weapons_Generic;

/////////////////////////////////////////////////////////////////
GrenadierItems = GrenadierItems+
	[
		"V_PlateCarrierIAGL_oli"
	] + GENERAL_GLOBAL + Bis_Weapons_GLs;
	
/////////////////////////////////////////////////////////////////			
AutoriflemanItems = AutoriflemanItems+
	[

	] + GENERAL_GLOBAL + Bis_Weapons_ARs;

/////////////////////////////////////////////////////////////////
ATItems = ATItems+
	[

	] + GENERAL_GLOBAL + Bis_Weapons_ATs + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
MedicItems = MedicItems+
	[

	] + GENERAL_GLOBAL + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
EODItems = EODItems+
	[
		"V_PlateCarrierIAGL_oli",
		"ToolKit"
	] + GENERAL_GLOBAL + Bis_Explosives + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
PilotItems = PilotItems+
	[
		"U_B_HeliPilotCoveralls",
		"H_HelmetCrew_B",
		"H_PilotHelmetHeli_B"
	] + GENERAL_GLOBAL + Bis_Weapons_Standard;
/////////////////////////////////////////////////////////////////
RTOItems = RTOItems+
	[
	
	] + GENERAL_GLOBAL + Bis_Weapons_Standard;
/////////////////////////////////////////////////////////////////
RifelmanItems = RifelmanItems+
	[	
		"V_PlateCarrierIAGL_oli"
	] + GENERAL_GLOBAL + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
CommanderItems = CommanderItems+
	[
		"Laserdesignator"
	] + GENERAL_GLOBAL + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
SquadLeadItems = SquadLeadItems+
	[
		"Laserdesignator"
	] + GENERAL_GLOBAL + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
TeamLeadItems = TeamLeadItems+
	[
		"Laserdesignator"
	] + GENERAL_GLOBAL + Bis_Weapons_GLs + Bis_Weapons_Standard;
	
/////////////////////////////////////////////////////////////////
ReconTLItems = ReconTLItems+
	[	
		"H_Booniehat_khk_hs",
		"Laserdesignator"
	] + GENERAL_GLOBAL + Bis_Silencers + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
MarksmanItems = MarksmanItems+
	[
		"H_Booniehat_khk_hs",
		"U_B_FullGhillie_lsh"
	] + GENERAL_GLOBAL + Bis_Weapons_Snipers + Bis_Silencers + Bis_Scopes_Sniper ;

/////////////////////////////////////////////////////////////////
ReconItems = ReconItems+
	[	
		"H_Booniehat_khk_hs"
	] + GENERAL_GLOBAL + Bis_Silencers + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
JTACItems = JTACItems+
	[
		"Laserdesignator",
		"H_Booniehat_khk_hs"
	] + GENERAL_GLOBAL + Bis_Silencers + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconMedic = RconMedic+
	[
		"H_Booniehat_khk_hs"
	] + GENERAL_GLOBAL + Bis_Silencers + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
UAVItems = UAVItems+
	[
		"H_Booniehat_khk_hs",
		"B_UAV_01_backpack_F",
		"B_UavTerminal"
	] + GENERAL_GLOBAL + Bis_Silencers  + Bis_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconExp = RconExp+
	[
		"H_Booniehat_khk_hs",
		"V_PlateCarrierIAGL_oli",
		"ToolKit"
	] + GENERAL_GLOBAL + Bis_Silencers + Bis_Weapons_Standard + Bis_Explosives;

/////////////////////////////////////////////////////////////////


VABISDONE = true;