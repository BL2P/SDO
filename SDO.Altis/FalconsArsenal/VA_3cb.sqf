if (isServer) exitwith {diag_log "I was kicked from 3CB_VA.sqf";};
diag_log "////====****READING VA_3CB.SQF ****====////";

/////////////////////////////////////////////////////////////////

		CB_Weapons_Standard =
			[
				"UK3CB_BAF_L22",
				"UK3CB_BAF_L22A2",
				"UK3CB_BAF_L85A2",
				"UK3CB_BAF_L85A2_RIS_AFG",
				"UK3CB_BAF_L85A2_EMAG",
				"UK3CB_BAF_L85A2_RIS"
			];
		Weapons_Standard = Weapons_Standard + CB_Weapons_Standard;
			
		CB_Weapons_GLs =
			[
				"UK3CB_BAF_L85A2_UGL",
				"UK3CB_BAF_L85A2_UGL_HWS"
			];
			
		CB_Weapons_ARs =
			[
				"UK3CB_BAF_L86A2",
				"UK3CB_BAF_L110A2",
				"UK3CB_BAF_L110A2_FIST",
				"UK3CB_BAF_L7A2",
				"UK3CB_BAF_L7A2_FIST"
			];

		
			CB_Weapons_ATs =
				[

				];

		CB_Weapons_Snipers =
			[
				"UK3CB_BAF_L86A3",
				"UK3CB_BAF_L129A1",
				"UK3CB_BAF_L129A1_AFG",
				"UK3CB_BAF_L129A1_FGrip",
				"UK3CB_BAF_L129A1_Grippod",
				"UK3CB_BAF_L115A3_Desert",
				"UK3CB_BAF_L115A3_Desert_Ghillie",
				"UK3CB_BAF_L115A3",
				"UK3CB_BAF_L115A3_Ghillie",
				"UK3CB_BAF_L82A1"
			];
			
		CB_Weapons_LaserDes =
			[
			];
			
		CB_Weapons_Generic =
			[
				"UK3CB_BAF_L91A1",
				"UK3CB_BAF_L92A1",
				"UK3CB_BAF_L131A1"
			];

		CB_Ammunition = 
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
				"UK3CB_BAF_150Rnd_762x51_box",
				"UK3CB_BAF_100Rnd_127x99_box",
				"UK3CB_BAF_1Rnd_HEDP_Grenade_shell"
			];

		CB_Explosives =
			[
			];

		CB_Backpacks = 
			[
				"UK3CB_BAF_B_Bergen_MTP_Rifleman_H_A",
				"UK3CB_BAF_B_Bergen_MTP_Rifleman_H_B",
				"UK3CB_BAF_B_Bergen_MTP_Rifleman_H_C",
				"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_A",
				"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_B",
				"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C",
				"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D"
			];

		CB_scopes = 
			[
				"UK3CB_BAF_SpecterLDS",
				"UK3CB_BAF_SpecterLDS_3D",
				"UK3CB_BAF_SpecterLDS_Dot",
				"UK3CB_BAF_SpecterLDS_Dot_3D",
				"UK3CB_BAF_Eotech",
				"UK3CB_BAF_SUSAT",
				"UK3CB_BAF_SUSAT_3D",
				"UK3CB_BAF_TA31F",
				"UK3CB_BAF_TA31F_3D",
				"UK3CB_BAF_TA31F_Hornbill",
				"UK3CB_BAF_TA31F_Hornbill_3D",
				"UK3CB_BAF_TA648",
				"UK3CB_BAF_TA648_308"
			];	
			
		CB_Scopes_Sniper =
			[
				"UK3CB_BAF_SB31250",
				"UK3CB_BAF_SB31250_Desert",
				"UK3CB_BAF_SB31250_Desert_Ghillie",
				"UK3CB_BAF_SB31250_Ghillie"
			];
				
		CB_Silencers = 
			[
				"UK3CB_BAF_Silencer_L110",
				"UK3CB_BAF_Silencer_L115A3",
				"UK3CB_BAF_Silencer_L85",
				"UK3CB_BAF_Silencer_L91A1",
				"UK3CB_BAF_SFFH"
			];
				
		CB_Uniforms = 
			[
			
			];

		CB_Vests = 
			[
			
			];

		CB_Helmets = 
			[
			
			];
				
		CB_Hats_Glasses_Masks = 
			[
			
			];

		CB_Items_Generic = 
			[
				"UK3CB_BAF_Flashlight_L131A1",
				"UK3CB_BAF_LLM_Flashlight_Black",
				"UK3CB_BAF_LLM_Flashlight_Tan",
				"UK3CB_BAF_LLM_IR_Black",
				"UK3CB_BAF_LLM_IR_Tan"
			];

		if (PARAMS_ALLOW_NVG == 1) then
			{
				CB_NVGs = 
					[
					];
				CB_Items_Generic = CB_Items_Generic + CB_NVGs;
			};
			
/////////////////////////////////////////////////////////////////	

GENERAL_GLOBAL = GENERAL_GLOBAL + CB_Items_Generic + CB_Hats_Glasses_Masks + CB_Helmets + CB_Vests + CB_Uniforms + CB_scopes + CB_Backpacks + CB_Ammunition + CB_Weapons_Generic;

/////////////////////////////////////////////////////////////////
GrenadierItems = GrenadierItems+
	[
	
	] + GENERAL_GLOBAL + CB_Weapons_GLs;

/////////////////////////////////////////////////////////////////			
AutoriflemanItems = AutoriflemanItems+
	[

	] + GENERAL_GLOBAL + CB_Weapons_ARs;

/////////////////////////////////////////////////////////////////
ATItems = ATItems+
	[
	] + GENERAL_GLOBAL + CB_Weapons_ATs + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
MedicItems = MedicItems+
	[
		"UK3CB_BAF_B_Bergen_MTP_Medic_H_A",
		"UK3CB_BAF_B_Bergen_MTP_Medic_H_B",
		"UK3CB_BAF_B_Bergen_MTP_Medic_L_A",
		"UK3CB_BAF_B_Bergen_MTP_Medic_L_B"
	] + GENERAL_GLOBAL + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
EODItems = EODItems+
	[
		"UK3CB_BAF_L128A1",
		"UK3CB_BAF_B_Bergen_MTP_Engineer_H_A",
		"UK3CB_BAF_B_Bergen_MTP_Engineer_L_A"
	] + GENERAL_GLOBAL + CB_Explosives + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
PilotItems = PilotItems+
	[
	] + GENERAL_GLOBAL;
/////////////////////////////////////////////////////////////////
RTOItems = RTOItems+
	[
		"UK3CB_BAF_B_Bergen_MTP_Radio_H_A",
		"UK3CB_BAF_B_Bergen_MTP_Radio_H_B",
		"UK3CB_BAF_B_Bergen_MTP_Radio_L_A",
		"UK3CB_BAF_B_Bergen_MTP_Radio_L_B"
	] + GENERAL_GLOBAL + CB_Weapons_Standard;
/////////////////////////////////////////////////////////////////
RifelmanItems = RifelmanItems+
	[	
		"UK3CB_BAF_L128A1",
		"UK3CB_BAF_B_Bergen_MTP_PointMan_H_A",
		"UK3CB_BAF_B_Bergen_MTP_PointMan_L_A"
	] + GENERAL_GLOBAL + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
CommanderItems = CommanderItems+
	[
		"UK3CB_BAF_Soflam_Laserdesignator"
	] + GENERAL_GLOBAL + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
SquadLeadItems = SquadLeadItems+
	[
		"UK3CB_BAF_B_Bergen_MTP_SL_H_A",
		"UK3CB_BAF_B_Bergen_MTP_SL_L_A",
		"UK3CB_BAF_Soflam_Laserdesignator"
	] + GENERAL_GLOBAL + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
TeamLeadItems = TeamLeadItems+
	[
		"UK3CB_BAF_Soflam_Laserdesignator"
	] + GENERAL_GLOBAL + CB_Weapons_GLs + CB_Weapons_Standard;
	
/////////////////////////////////////////////////////////////////
MarksmanItems = MarksmanItems+
	[

	] + GENERAL_GLOBAL + CB_Weapons_Snipers + CB_Silencers + CB_Scopes_Sniper;
/////////////////////////////////////////////////////////////////
ReconTLItems = ReconTLItems+
	[	
		"UK3CB_BAF_Soflam_Laserdesignator"
	] + GENERAL_GLOBAL + CB_Silencers + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
ReconItems = ReconItems+
	[	
	] + GENERAL_GLOBAL + CB_Silencers + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
JTACItems = JTACItems+
	[
		"UK3CB_BAF_B_Bergen_MTP_JTAC_H_A",
		"UK3CB_BAF_B_Bergen_MTP_JTAC_L_A",
		"UK3CB_BAF_Soflam_Laserdesignator"
	] + GENERAL_GLOBAL + CB_Silencers + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconMedic = RconMedic+
	[
		"UK3CB_BAF_B_Bergen_MTP_Medic_H_A",
		"UK3CB_BAF_B_Bergen_MTP_Medic_H_B",
		"UK3CB_BAF_B_Bergen_MTP_Medic_L_A",
		"UK3CB_BAF_B_Bergen_MTP_Medic_L_B"
	] + GENERAL_GLOBAL + CB_Silencers + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
UAVItems = UAVItems+
	[
	] + GENERAL_GLOBAL + CB_Silencers  + CB_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconExp = RconExp+
	[		
		"UK3CB_BAF_L128A1",
		"UK3CB_BAF_B_Bergen_MTP_Sapper_H_A",
		"UK3CB_BAF_B_Bergen_MTP_Sapper_L_A"
	] + GENERAL_GLOBAL + CB_Silencers + CB_Weapons_Standard + CB_Explosives;

