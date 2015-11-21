if (isServer) exitwith {diag_log "I was kicked from ACE_VA.sqf";};
diag_log "////====****READING VA_ACE.SQF ****====////";

/////////////////////////////////////////////////////////////////

		ACE_Weapons_Standard =
			[
			];
		Weapons_Standard = Weapons_Standard + ACE_Weapons_Standard;
			
		ACE_Weapons_GLs =
			[
			];
			
		ACE_Weapons_ARs =
			[
			];
			
		ACE_Weapons_ATs =
			[
			];
			
		ACE_Weapons_Snipers =
			[
			];
			
		ACE_Weapons_LaserDes =
			[
			];
			
		ACE_Weapons_Generic =
			[
			];

		ACE_Ammunition = 
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

		ACE_Explosives =
			[
			];

		ACE_Backpacks = 
			[
			
			];

		ACE_scopes = 
			[
						"ACE_optic_Arco_2D",
						"ACE_optic_Arco_PIP",
						"ACE_optic_MRCO_2D",
						"ACE_optic_MRCO_PIP",
						"ACE_optic_Hamr_2D",
						"ACE_optic_Hamr_PIP"
			];	
			
		ACE_Scopes_Sniper =
			[
			];
				
		ACE_Silencers = 
			[
			];
				
		ACE_Uniforms = 
			[
			
			];

		ACE_Vests = 
			[
			
			];

		ACE_Helmets = 
			[
			
			];
				
		ACE_Hats_Glasses_Masks = 
			[
			
			];

		ACE_Items_Generic = 
			[
						"ACE_Vector",
						"ACE_IR_Strobe_Item",
						"ACE_Clacker",
						"ACE_M26_Clacker",
						"ACE_EarPlugs",
						"ACE_MapTools",
						"ACE_microDAGR",
						"ACE_RangeTable_82mm",
						"ACE_SpareBarrel",
						"ACE_UAVBattery",
						"ACE_wirecutter",
						"ACE_HuntIR_monitor",
						"ACE_DAGR",
						
						"ACE_SpottingScope",
						
						"ACE_Flashlight_MX991",
						"ACE_Flashlight_KSF1",
						"ACE_Flashlight_XL50",
						
						"ACE_fieldDressing",
						//"ACE_personalAidKit",
						"ACE_tourniquet",
						"ACE_morphine"
			];

		if (PARAMS_ALLOW_NVG == 1) then
			{
				ACE_NVGs = 
					[
						"ACE_NVG_Gen1",
						"ACE_NVG_Gen3",
						"ACE_NVG_Gen4",
						"ACE_NVG_Wide"
					];
				ACE_Items_Generic = ACE_Items_Generic + ACE_NVGs;
			};

/////////////////////////////////////////////////////////////////	

GENERAL_GLOBAL = GENERAL_GLOBAL + ACE_Items_Generic + ACE_Hats_Glasses_Masks + ACE_Helmets + ACE_Vests + ACE_Uniforms + ACE_scopes + ACE_Backpacks + ACE_Ammunition + ACE_Weapons_Generic;

/////////////////////////////////////////////////////////////////
GrenadierItems = GrenadierItems +
	[
	] + GENERAL_GLOBAL + ACE_Weapons_GLs;
	
/////////////////////////////////////////////////////////////////			
AutoriflemanItems = AutoriflemanItems+
	[
	
	] + GENERAL_GLOBAL + ACE_Weapons_ARs;

/////////////////////////////////////////////////////////////////
ATItems = ATItems+
	[

	] + GENERAL_GLOBAL + ACE_Weapons_ATs + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
MedicItems = MedicItems+
	[
		"ACE_personalAidKit",
		
		"ACE_elasticBandage",
		"ACE_quikclot",
		"ACE_packingBandage",
		"ACE_surgicalKit",
		"ACE_plasmaIV_500",
		"ACE_plasmaIV_250",
		"ACE_plasmaIV",
		//"ACE_bloodIV_500",
		//"ACE_bloodIV_250",
		//"ACE_bloodIV",
		"ACE_salineIV_500",
		"ACE_salineIV_250",
		"ACE_salineIV",
		"ACE_epinephrine",
		"ACE_atropine"
	] + GENERAL_GLOBAL + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
EODItems = EODItems+
	[
		"ACE_DefusalKit"
	] + GENERAL_GLOBAL + ACE_Explosives + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
PilotItems = PilotItems+
	[
	] + GENERAL_GLOBAL;
/////////////////////////////////////////////////////////////////
RTOItems = RTOItems+
	[
	
	] + GENERAL_GLOBAL + ACE_Weapons_Standard;
/////////////////////////////////////////////////////////////////
RifelmanItems = RifelmanItems+
	[	
	] + GENERAL_GLOBAL + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
CommanderItems = CommanderItems+
	[
	] + GENERAL_GLOBAL + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
SquadLeadItems = SquadLeadItems+
	[
	] + GENERAL_GLOBAL + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
TeamLeadItems = TeamLeadItems+
	[
	] + GENERAL_GLOBAL + ACE_Weapons_GLs + ACE_Weapons_Standard;
	

/////////////////////////////////////////////////////////////////
ReconTLItems = ReconTLItems+
	[	
	] + GENERAL_GLOBAL + ACE_Silencers + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
MarksmanItems = MarksmanItems+
	[
					"ACE_RangeCard",
					"ACE_ATragMX",
					"ACE_Tripod",
					"ACE_Kestrel4500",
					"ACE_optic_LRPS_2D",
					"ACE_optic_LRPS_PIP",
					"ACE_optic_SOS_2D",
					"ACE_optic_SOS_PIP"
	] + GENERAL_GLOBAL + ACE_Weapons_Snipers + ACE_Silencers + ACE_Scopes_Sniper;

/////////////////////////////////////////////////////////////////
ReconItems = ReconItems+
	[	
	] + GENERAL_GLOBAL + ACE_Silencers + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
JTACItems = JTACItems+
	[
	] + GENERAL_GLOBAL + ACE_Silencers + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconMedic = RconMedic+
	[
		"ACE_elasticBandage",
		"ACE_quikclot",
		"ACE_packingBandage",
		"ACE_surgicalKit",
		"ACE_plasmaIV_500",
		"ACE_plasmaIV_250",
		"ACE_plasmaIV",
		"ACE_bloodIV_500",
		"ACE_bloodIV_250",
		"ACE_bloodIV",
		"ACE_salineIV_500",
		"ACE_salineIV_250",
		"ACE_salineIV",
		"ACE_epinephrine",
		"ACE_atropine"
	] + GENERAL_GLOBAL + ACE_Silencers + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
UAVItems = UAVItems+
	[
		"ACE_UAVBattery"
	] + GENERAL_GLOBAL + ACE_Silencers  + ACE_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconExp = RconExp+
	[
		"ACE_DefusalKit"
	] + GENERAL_GLOBAL + ACE_Silencers + ACE_Weapons_Standard + ACE_Explosives;

