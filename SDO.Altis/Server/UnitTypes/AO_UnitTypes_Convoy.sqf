if !(isServer) exitwith {diag_log "***Exiting AO_UnitTypes_BIS.sqf not a server";};

diag_log "***Reading AO_UnitTypes_BIS.sqf============";

/* =============================================== */
/* ==================== Conv UNITS  ================= */
/* =============================================== */


/* =============================================== */
/* ==================== Conv VEHICLES  ============== */
/* =============================================== */
//---Civi types
	Conv_Unarmed_vehicles = 
		[
			"I_G_Offroad_01_F",
			"I_MRAP_03_F",
			"I_Truck_02_covered_F",
			"I_Truck_02_transport_F"
		];
		
	Conv_TransTruck  = 
		[
			"I_Truck_02_covered_F",
			"I_Truck_02_transport_F"
		];
//---Support types
	 Conv_Support_vehicles = 
		[
			"I_Truck_02_ammo_F",
			"I_Truck_02_fuel_F",
			"I_Truck_02_medical_F"
		];	
//---Armed car types
	 Conv_Armed_Cars = 
		[
			"I_G_Offroad_01_armed_F",
			"I_MRAP_03_hmg_F",
			"I_MRAP_03_gmg_F",
			"I_APC_Wheeled_03_cannon_F"
		];
 //---BMP types
	 Conv_APC_vehicles = 
		[
			"I_APC_tracked_03_cannon_F"
		];	 
 //---Tank types
	Conv_Heavy_Armour_vehicles = 
		[
			"I_MBT_03_cannon_F"
		];
 //---Anit Air types
	Conv_AAA_Armour_vehicles = 
		[
			"I_APC_Wheeled_03_cannon_F"
		];
 //---Boat types

 //---Big Bada Boom types
 Conv_Artilary_vehicles = 
		[
			"I_APC_Wheeled_03_cannon_F"
		];
		
 Conv_Air_Trans = 
		[
			"I_Heli_Transport_02_F"
		];
 Conv_Air_Attack_chop = 
		[
			"I_Heli_light_03_F"
		];
 Conv_Air_Attack_plane = 
		[
			"I_Plane_Fighter_03_CAS_F"
		];
		
		RestrictedEnemyVehicles = [] + Conv_Air_Attack_plane + Conv_Air_Attack_chop + Conv_Artilary_vehicles + Conv_Heavy_Armour_vehicles + Conv_APC_vehicles + Conv_Armed_Cars; publicVariable "RestrictedEnemyVehicles";
		
/* =============================================== */
/* ==================== AO GROUPS  =============== */
/* =============================================== */

 diag_log "***Finished Reading AO_UnitTypes_BIS.sqf============";
 
 
 