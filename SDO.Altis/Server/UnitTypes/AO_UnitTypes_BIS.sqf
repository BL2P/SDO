if !(isServer) exitwith {diag_log "Exiting AO_UnitTypes_BIS.sqf not a server";};

diag_log "==========Reading AO_UnitTypes_BIS.sqf============";


/* =============================================== */
/* ==================== AO UNITS  ================= */
/* =============================================== */

//--- Millitary 
	// Commander
		SDO_u_AO_com           = 	"O_officer_F";
	// Squad leader
		SDO_u_AO_sl            = "O_Soldier_SL_F";
	  // TeamLeader
		SDO_u_AO_tl            = 	"O_Soldier_TL_F";
	// Lite
		SDO_u_AO_lite       = "O_Soldier_lite_F";
	// Soldier
		SDO_u_AO_rifle       = "O_Soldier_F";
	// Grenade launcher
		SDO_u_AO_gl            = "O_Soldier_GL_F";
	// Assault rifle
		SDO_u_AO_ar            = "O_Soldier_AR_F";
	// Anti tank
		SDO_u_AO_at            = "O_Soldier_LAT_F";
	// Medic
		SDO_u_AO_med         = "O_medic_F";
	// Anti air
		SDO_u_AO_aa            = "O_Soldier_AA_F";
	// Assistant anti air
		SDO_u_AO_ammo           = "O_Soldier_A_F";
	// Engineer
		SDO_u_AO_rep            = "O_soldier_repair_F";
	// Explosives
		SDO_u_AO_exp            =  "O_soldier_exp_F";
	// Marksman
		SDO_u_AO_marksman      = "O_soldier_M_F";
	// Marksman
		SDO_u_AO_spotter_sniper        = "O_spotter_F";
	// Sniper
		SDO_u_AO_sniper        = "O_sniper_F";
	 // Crew
		SDO_u_AO_veh_crew		 = "O_crew_F";
	 
	 
 //--- Guerilla forces
	// Soldier
		SDO_u_g_soldier     = "O_G_Soldier_F";
	// Grenade launcher
		SDO_u_g_gl          = "O_G_Soldier_GL_F";
	// Assault rifle
		SDO_u_g_ar          = "O_G_Soldier_AR_F";
	// Anti tank
		SDO_u_g_at          = "O_G_Soldier_LAT_F";
	// Medic
		SDO_u_g_medic       = "O_G_medic_F";
	// Squad leader
		SDO_u_g_sl          = "O_G_Soldier_SL_F";
	// Marksman
		SDO_u_g_marksman    = "O_G_Soldier_M_F";
		
		
  //--- Recon basic
 
SDO_u_AO_ReconSL = "O_recon_TL_F";
SDO_u_AO_ReconRifle = "O_recon_F";
SDO_u_AO_ReconMedic = "O_recon_medic_F";
SDO_u_AO_ReconJTAC = "O_recon_JTAC_F";
SDO_u_AO_ReconRifle = "O_recon_F";
SDO_u_AO_ReconMarksman = "O_recon_M_F";
 
//---Recon Weapons
 
SDO_u_AO_ReconSL  = "O_recon_TL_F";
SDO_u_AO_ReconAT = "O_recon_LAT_F";
SDO_u_AO_ReconRifle = "O_recon_F";
SDO_u_AO_ReconMedic = "O_recon_medic_F";
SDO_u_AO_ReconExpl  = "O_recon_exp_F";
SDO_u_AO_ReconSniper = "O_Pathfinder_F";
 
//--- Heavy mg
SDO_u_AO_HeavyGunner = "O_HeavyGunner_F";
	
/* =============================================== */
/* ==================== AO VEHICLES  ============== */
/* =============================================== */
//---Civi types
	SDO_Unarmed_vehicles = 
		[
			"O_MRAP_02_F",
			"O_Truck_02_covered_F",
			"O_Truck_02_transport_F",
			"O_Truck_03_transport_F",
			"O_Truck_03_covered_F"
		];
//---Support types
	 SDO_Support_vehicles = 
		[
			"O_Truck_03_repair_F",
			"O_Truck_03_ammo_F",
			"O_Truck_03_fuel_F",
			"O_Truck_03_medical_F",
			"O_Truck_03_device_F"
		];	
//---Armed car types
	 SDO_Armed_Cars = 
		[
			"O_MRAP_02_hmg_F",
			"O_MRAP_02_hmg_F",
			"O_MRAP_02_hmg_F",
			
			"O_MRAP_02_gmg_F",
			"O_MRAP_02_gmg_F",
			
			"O_APC_Wheeled_02_rcws_F"
		];
 //---BMP types
	 SDO_APC_vehicles = 
		[
			"O_APC_Tracked_02_cannon_F"
		];	 
 //---Tank types
	SDO_Heavy_Armour_vehicles = 
		[
			"O_MBT_02_cannon_F"
		];
 //---Anit Air types
	SDO_AAA_Armour_vehicles = 
		[
			"O_APC_Tracked_02_AA_F"
		];
 //---Boat types
 SDO_Ship_vehicles = 
		[
			"O_Boat_Armed_01_hmg_F"
		];
 //---Big Bada Boom types
 SDO_Artilary_vehicles = 
		[
			"O_MBT_02_arty_F"
		];
		
 SDO_Air_Trans = 
		[
			"O_Heli_Light_02_unarmed_F"
		];
 SDO_Air_Attack_chop = 
		[
			"O_Heli_Light_02_F"
		];
 SDO_Air_Attack_plane = 
		[
			"O_Plane_CAS_02_F"
		];
		
		RestrictedEnemyVehicles = [] + SDO_Air_Attack_plane + SDO_Air_Attack_chop + SDO_Artilary_vehicles + SDO_Heavy_Armour_vehicles + SDO_APC_vehicles + SDO_Armed_Cars; publicVariable "RestrictedEnemyVehicles";
		
/* =============================================== */
/* ==================== AO GROUPS  =============== */
/* =============================================== */

AO_Squad_Basic = 
	[
		SDO_u_AO_sl,
		SDO_u_AO_rifle,
		SDO_u_AO_gl,
		SDO_u_AO_ar,
		SDO_u_AO_at,
		SDO_u_AO_med
	];

AO_Squad_Grenadier = 
	[
		SDO_u_AO_sl,
		SDO_u_AO_gl,
		SDO_u_AO_gl,
		SDO_u_AO_ar,
		SDO_u_AO_ammo,
		SDO_u_AO_med
	];

AO_Squad_AT = 
	[
		SDO_u_AO_sl,
		SDO_u_AO_rifle,
		SDO_u_AO_ammo,
		SDO_u_AO_at,
		SDO_u_AO_at,
		SDO_u_AO_med
	];

AO_Squad_AA = 
	[
		SDO_u_AO_sl,
		SDO_u_AO_aa,
		SDO_u_AO_ammo,
		SDO_u_AO_ar,
		SDO_u_AO_at,
		SDO_u_AO_med
	];
			
AO_Squad_Snipers =
	[
		SDO_u_AO_spotter_sniper,
		SDO_u_AO_sniper 
	];			
			
 AO_Squad_Specialists =
	[
		SDO_u_AO_rep,
		SDO_u_AO_exp
	];	
 
AO_Squad_Command =
	[
		SDO_u_AO_com,
		SDO_u_AO_rifle,
		SDO_u_AO_rifle,
		SDO_u_AO_med,
		SDO_u_AO_rep,
		SDO_u_AO_exp
	];	
	
AO_Recon_Squad_Basic = 
	[
		SDO_u_AO_ReconSL,
		SDO_u_AO_ReconRifle,
		SDO_u_AO_ReconMedic,
		SDO_u_AO_ReconJTAC,
		SDO_u_AO_ReconRifle,
		SDO_u_AO_ReconMarksman
	];
	
AO_Recon_Squad_Weapons = 
	[
		SDO_u_AO_ReconSL,
		SDO_u_AO_ReconAT,
		SDO_u_AO_ReconRifle,
		SDO_u_AO_ReconMedic,
		SDO_u_AO_ReconExpl,
		SDO_u_AO_ReconSniper
	];
 
 AO_Squad_Heavy = 
	[
		SDO_u_AO_sl,
		SDO_u_AO_ar,
		SDO_u_AO_ar,
		SDO_u_AO_HeavyGunner,
		SDO_u_AO_ammo,
		SDO_u_AO_med
	];
 
 AO_UnitTypes = true;
 
 diag_log "==========Finished Reading AO_UnitTypes_BIS.sqf============";
 
 
 