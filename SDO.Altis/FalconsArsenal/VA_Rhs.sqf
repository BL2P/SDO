if (isServer) exitwith {diag_log "I was kicked from RHS_VA.sqf";};
diag_log "////====****READING VA_RHS.SQF ****====////";

/////////////////////////////////////////////////////////////////

if (PARAMS_ALLOW_RHS == 1) then
	{
		RHS_Weapons_Standard =
			[
				//--- M4s
					"rhs_weap_m4",
					"rhs_weap_m4_carryhandle",
					"rhs_weap_m4_carryhandle_pmag",
					"rhs_weap_m4_grip",
					"rhs_weap_m4_grip2",
				//--- M4A1s
					"rhs_weap_m4a1",
					"rhs_weap_m4a1_grip",
					"rhs_weap_m4a1_grip2",
					"rhs_weap_m4a1_carryhandle",
					"rhs_weap_m4a1_carryhandle_pmag",			
					"rhs_weap_m4a1_carryhandle_grip",
					"rhs_weap_m4a1_carryhandle_grip2",
				//--- M16A4s
					"rhs_weap_m16a4",
					"rhs_weap_m16a4_carryhandle",
					"rhs_weap_m16a4_carryhandle_pmag",
					"rhs_weap_m16a4_grip",
					"rhs_weap_m16a4_carryhandle_grip",
					"rhs_weap_m16a4_carryhandle_grip_pmag"
			];
		Weapons_Standard = Weapons_Standard + RHS_Weapons_Standard;
			
		RHS_Weapons_GLs =
			[
				//--- M4 GLs
					"rhs_weap_m4_m320",
					"rhs_weap_m4_m203",
					"rhs_weap_m4_m203S",
				//--- M4a1 GLs
					"rhs_weap_m4a1_m320",
					"rhs_weap_m4a1_m203",
					"rhs_weap_m4a1_m203s",
					"rhs_weap_m4a1_carryhandle_m203",
					"rhs_weap_m4a1_carryhandle_m203S",
				//--- M16A4 GLs
					"rhs_weap_m16a4_carryhandle_M203",
				//--- M32 6rnd GL
					"rhs_weap_m32",
				//--- Pistol 320
					"rhs_weap_M320"
			];
			
		RHS_Weapons_ARs =
			[
				//--- M249s
					"rhs_weap_m249_pip_S",
					"rhs_weap_m249_pip_S_para",
					"rhs_weap_m249_pip_S_vfg",
					"rhs_weap_m249_pip_L",
					"rhs_weap_m249_pip_L_para",
					"rhs_weap_m249_pip_L_vfg",
				//--- M240s
					"rhs_weap_m240B",
					"rhs_weap_m240G",
					"rhs_weap_m240B_CAP"
			];
			
		RHS_Weapons_ATs =
			[
			
			];
			
		RHS_Weapons_Snipers =
			[
						//--- SR25 (7.62 Semi auto)
							"rhs_weap_sr25",
							"rhs_weap_sr25_ec",
						//---M14 Ebri
							"rhs_weap_m14ebrri",
						//--- 2010 Sniper
							"rhs_weap_XM2010",
							"rhs_weap_XM2010_d",
							"rhs_weap_XM2010_wd",
							"rhs_weap_XM2010_sa"
			];
			
		RHS_Weapons_LaserDes =
			[
			];
			
		RHS_Weapons_Generic =
			[
				"rhsusf_acc_harris_bipod",
				"lerca_1200_black",
				"lerca_1200_tan",
				"rhsusf_weap_m1911a1",
				"rhsusf_weap_glock17g4"
			];

		RHS_Ammunition = 
			[
				//--- RHS 249 
					"rhs_200rnd_556x45_M_SAW",
					"rhs_200rnd_556x45_T_SAW",
					"rhs_200rnd_556x45_B_SAW",
					"rhsusf_100Rnd_556x45_soft_pouch",
					"rhsusf_100Rnd_556x45_M200_soft_pouch",
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
					"rhs_mag_m4009",
					"rhs_mag_m576",
					"rhs_mag_M585_white",
					"rhs_mag_m661_green",
					"rhs_mag_m662_red",
					"rhs_mag_m713_Red",
					"rhs_mag_m714_White",
					"rhs_mag_m715_Green",
					"rhs_mag_m716_yellow",
				//---RHS Pistol
					"rhsusf_mag_7x45acp_MHP",
					"rhsusf_mag_17Rnd_9x19_FMJ",
					"rhsusf_mag_17Rnd_9x19_JHP",
				//--- RHS Launcher rounds
					"rhs_m136_mag",
					"rhs_m136_hedp_mag",
					"rhs_m136_hp_mag",
					"rhs_fim92_mag",
					"rhs_fgm148_magazine_AT",
				//--- RHS Nades
					"rhs_mag_m67",
					"rhs_mag_mk84",
					"rhs_mag_an_m8hc",
					"rhs_mag_an_m14_th3",
					"rhs_mag_m7a3_cs",
					"rhs_mag_mk3a2",
				//--- RHS Hand smokes
					"rhs_mag_m18_smoke_base",
					"rhs_mag_m18_green",
					"rhs_mag_m18_purple",
					"rhs_mag_m18_red",
					"rhs_mag_m18_yellow"
			];

		RHS_Explosives =
			[
				"rhsusf_m112_mag",
				"rhsusf_m112x4_mag",
				"rhs_mine_M19_mag"
			];

		RHS_Backpacks = 
			[

			];

		RHS_scopes = 
			[
				"rhsusf_acc_SF3P556",
				"rhsusf_acc_SFMB556",
				"rhsusf_acc_compm4",
				"rhsusf_acc_eotech_552",
				"rhsusf_acc_ELCAN",
				"rhsusf_acc_ELCAN_ard",
				"rhsusf_acc_ELCAN_pip",
				"rhsusf_acc_ACOG",
				"rhsusf_acc_ACOG_wd",
				"rhsusf_acc_ACOG_d",
				"rhsusf_acc_ACOG_sa",
				"rhsusf_acc_ACOG_pip",
				"rhsusf_acc_ACOG2",
				"rhsusf_acc_ACOG3",
				"rhsusf_acc_ACOG_USMC",
				"rhsusf_acc_ACOG2_USMC",
				"rhsusf_acc_ACOG3_USMC",
				"rhsusf_acc_EOTECH"
			];	
			
		RHS_Scopes_Sniper =
			[
				//--- Sniper scopes
					"rhsusf_acc_LEUPOLDMK4_2",
					"rhsusf_acc_LEUPOLDMK4"
			];
				
		RHS_Silencers = 
			[
				"rhsusf_acc_rotex5_grey",
				"rhsusf_acc_rotex5_tan",
				"rhsusf_acc_nt4_black",
				"rhsusf_acc_nt4_tan",
				"rhsusf_acc_muzzleFlash_SF"
			];
				
		RHS_Uniforms = 
			[
			
			];

		RHS_Vests = 
			[
			
			];

		RHS_Helmets = 
			[
			
			];
				
		RHS_Hats_Glasses_Masks = 
			[
			
			];

		RHS_Items_Generic = 
			[
				"rhsusf_acc_anpeq15A",
				"rhsusf_acc_anpeq15",
				"rhsusf_acc_anpeq15_light",
				"rhsusf_acc_anpeq15side"
			];

		if (PARAMS_ALLOW_NVG == 1) then
			{
				RHS_NVGs = 
					[
					];
				RHS_Items_Generic = RHS_Items_Generic + RHS_NVGs;
			};
	};
/////////////////////////////////////////////////////////////////	

GENERAL_GLOBAL = GENERAL_GLOBAL + RHS_Items_Generic + RHS_Hats_Glasses_Masks + RHS_Helmets + RHS_Vests + RHS_Uniforms + RHS_scopes + RHS_Backpacks + RHS_Ammunition + RHS_Weapons_Generic;

/////////////////////////////////////////////////////////////////
GrenadierItems = GrenadierItems+
	[

	] + GENERAL_GLOBAL + RHS_Weapons_GLs;
	
/////////////////////////////////////////////////////////////////			
AutoriflemanItems = AutoriflemanItems+
	[
	] + GENERAL_GLOBAL + RHS_Weapons_ARs;

/////////////////////////////////////////////////////////////////
ATItems = ATItems+
	[

	] + GENERAL_GLOBAL + RHS_Weapons_ATs + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
MedicItems = MedicItems+
	[
	] + GENERAL_GLOBAL + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
EODItems = EODItems+
	[
		"rhs_weap_M590_5RD",
		"rhs_weap_M590_8RD"
	] + GENERAL_GLOBAL + RHS_Explosives + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
PilotItems = PilotItems+
	[
	] + GENERAL_GLOBAL;
/////////////////////////////////////////////////////////////////
RTOItems = RTOItems+
	[
	
	] + GENERAL_GLOBAL + RHS_Weapons_Standard;
/////////////////////////////////////////////////////////////////
RifelmanItems = RifelmanItems+
	[	
		//--- M590 Shotgun
			"rhs_weap_M590_5RD",
			"rhs_weap_M590_8RD"
	] + GENERAL_GLOBAL + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
CommanderItems = CommanderItems+
	[
	] + GENERAL_GLOBAL + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
SquadLeadItems = SquadLeadItems+
	[
	] + GENERAL_GLOBAL + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
TeamLeadItems = TeamLeadItems+
	[
	] + GENERAL_GLOBAL + RHS_Weapons_GLs + RHS_Weapons_Standard;
	
/////////////////////////////////////////////////////////////////
ReconTLItems = ReconTLItems+
	[	
	] + GENERAL_GLOBAL + RHS_Silencers + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
MarksmanItems = MarksmanItems+
	[
		//--- RHS Supresors	
			"rhsusf_acc_M2010S",
			"rhsusf_acc_SR25S"
	] + GENERAL_GLOBAL + RHS_Weapons_Snipers + RHS_Silencers + RHS_Scopes_Sniper;

/////////////////////////////////////////////////////////////////
ReconItems = ReconItems+
	[	
	] + GENERAL_GLOBAL + RHS_Silencers + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
JTACItems = JTACItems+
	[
	] + GENERAL_GLOBAL + RHS_Silencers + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconMedic = RconMedic+
	[
	] + GENERAL_GLOBAL + RHS_Silencers + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
UAVItems = UAVItems+
	[
	] + GENERAL_GLOBAL + RHS_Silencers  + RHS_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconExp = RconExp+
	[
		//--- M590 Shotgun
			"rhs_weap_M590_5RD",
			"rhs_weap_M590_8RD"
	] + GENERAL_GLOBAL + RHS_Silencers + RHS_Weapons_Standard + RHS_Explosives;

