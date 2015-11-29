if !(isServer) exitwith {diag_log "***Exiting AO_UnitTypes_WEU.sqf not a server";};

diag_log "***Reading AO_UnitTypes_WEU.sqf============";


/* =============================================== */
/* ==================== AO UNITS  ================= */
/* =============================================== */

//--- Millitary 
	// Commander
		SDO_u_AO_com           = 	"sub_ins_weu_off";
	// Squad leader
		SDO_u_AO_sl            = "sub_ins_weu_sl";
	  // TeamLeader
		SDO_u_AO_tl            = 	"sub_ins_weu_tl";
	// Lite
		SDO_u_AO_lite       = "sub_ins_weu_lite";
	// Soldier
		SDO_u_AO_rifle       = "sub_ins_weu_rifleman";
	// Grenade launcher
		SDO_u_AO_gl            = "sub_ins_weu_gl";
	// Assault rifle
		SDO_u_AO_ar            = "sub_ins_weu_mg";
	// Anti tank
		SDO_u_AO_at            = "sub_ins_weu_lat";
	// Medic
		SDO_u_AO_med         = "sub_ins_weu_medic";
	// Anti air
		SDO_u_AO_aa            = "sub_ins_weu_aa";
	// Assistant anti air
		SDO_u_AO_ammo           = "sub_ins_weu_ammo";
	// Engineer
		SDO_u_AO_rep            = "sub_ins_weu_engineer";
	// Explosives
		SDO_u_AO_exp            =  "sub_ins_weu_exp";
	// Marksman
		SDO_u_AO_marksman      = "sub_ins_weu_sniper";
	// Marksman
		SDO_u_AO_spotter_sniper        = "sub_ins_weu_tl";
	// Sniper
		SDO_u_AO_sniper        = "sub_ins_weu_sniper";
	 // Crew
		SDO_u_AO_veh_crew		 = "sub_ins_weu_crew";
	 
	 
 //--- Guerilla forces
	// Soldier
		SDO_u_g_soldier     = "TBan_Fighter2";
	// Grenade launcher
		SDO_u_g_gl          = "TBan_Fighter3";
	// Assault rifle
		SDO_u_g_ar          = "TBan_Fighter4";
	// Anti tank
		SDO_u_g_at          = "TBan_Fighter5";
	// Medic
		SDO_u_g_medic       = "TBan_Fighter6";
	// Squad leader
		SDO_u_g_sl          = "TBan_Fighter1";
	// Marksman
		SDO_u_g_marksman    = "TBan_Fighter3NH";
 
/* =============================================== */
/* ==================== AO VEHICLES  ============== */
/* =============================================== */
//---Civi types
	SDO_Unarmed_vehicles = 
		[
			"sub_ins_weu_van",
			"sub_ins_weu_offroad"
		];
//---Support types
	 SDO_Support_vehicles = 
		[
			"sub_ins_weu_offroad_repair"
		];	
//---Armed car types
	 SDO_Armed_Cars = 
		[
			"sub_ins_weu_offroad_armed"
		];
 //---BMP types
	 SDO_APC_vehicles = 
		[
			"sub_ins_weu_btr60",
			"sub_ins_weu_bmp1"
		];	 
 //---Tank types
	SDO_Heavy_Armour_vehicles = 
		[
			"sub_ins_weu_t72"
		];
 //---Anit Air types
	SDO_AAA_Armour_vehicles = 
		[
			"sub_ins_weu_zsu"
		];
 //---Boat types
 SDO_Ship_vehicles = 
		[
			"sub_ins_weu_boat"
		];
 //---Big Bada Boom types
 SDO_Artilary_vehicles = 
		[
			"sub_ins_weu_mortar"
		];

		
 SDO_Air_Trans = 
		[
			"O_Heli_Light_02_unarmed_F"
		];
 SDO_Air_Attack_chop = 
		[
			"O_Heli_Attack_02_F"
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
		SDO_u_AO_sl,
		SDO_u_AO_rifle,
		SDO_u_AO_gl,
		SDO_u_AO_ar,
		SDO_u_AO_at,
		SDO_u_AO_med
	];
	
AO_Recon_Squad_Weapons = 
	[
		SDO_u_AO_sl,
		SDO_u_AO_rifle,
		SDO_u_AO_gl,
		SDO_u_AO_ar,
		SDO_u_AO_at,
		SDO_u_AO_med
	];
	
 AO_Squad_Heavy = 
	[
		SDO_u_AO_sl,
		SDO_u_AO_gl,
		SDO_u_AO_gl,
		SDO_u_AO_ar,
		SDO_u_AO_ammo,
		SDO_u_AO_med
	];
 
 AO_UnitTypes = true;
 
 diag_log "***Finished Reading AO_UnitTypes_WEU.sqf============";
 
 
 