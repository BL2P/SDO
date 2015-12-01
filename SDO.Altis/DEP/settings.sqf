/*  Copyright 2015 Fluit
    
    This file is part of Dynamic Enemy Population.

    Dynamic Enemy Population is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation version 3 of the License.

    Dynamic Enemy Population is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Dynamic Enemy Population.  If not, see <http://www.gnu.org/licenses/>.
*/

// *************************************************************
// This is the settings file for DEP. Edit to your own liking.
// For a complete list of possible settings visit:
//        https://fluitarma.wordpress.com/dep-settings/
// *************************************************************

/*
	Example:
	To turn on debug mode, uncomment the last line of this file
	by removing the two forward slashes!
*/

// dep_debug = true;

dep_side        = independent;              		// Enemy side (east, west, independent)
dep_despawn     = PARAMS_DEP_DESPAWN;      	 		// Despawn location after x minutes inactivity
dep_debug       = DEBUG;                    		// Enable debug
dep_max_ai_loc  = PARAMS_DEP_AI_LOC;        		// Maximum AI per location
dep_max_ai_tot  = PARAMS_DEP_AI_TOT;        		// Maximum AI in total
dep_act_dist    = PARAMS_DEP_ACTDIST;       		// Location activation distance
dep_act_height  = 80;                       		// Player must be below this height to activate location
dep_act_speed   = 160;                      		// Player must be below this speed to activate location
dep_roadblocks  = PARAMS_DEP_ROADBLK;       		// Number of roadblocks
dep_aa_camps    = PARAMS_DEP_AA;            		// Number of AA camps
dep_housepop    = PARAMS_DEP_ROADPOP;       		// Number of road population
dep_safe_zone = [getMarkerPos "respawn_west",getMarkerPos "zone",getMarkerPos "zone_1",getMarkerPos "zone_2",getMarkerPos "zone_3",getMarkerPos "zone_4",getMarkerPos "zone_5",getMarkerPos "zone_6",getMarkerPos "zone_7",getMarkerPos "zone_8",getMarkerPos "zone_9",getMarkerPos "zone_10"];    	// Safe zone position
dep_safe_rad    = PARAMS_DEP_SAFERADIUS;                            	// Safe zone radius
dep_ied_chance  = 0.8;             			 		// Chance of IEDs
dep_veh_chance  = 0.5;             			 		// Chance of vehicles
dep_cr_ied      = true;                      		// Restrict disarming IED to explosives class
//dep_ground_vehicles = ["I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_G_Van_01_transport_F","I_G_offroad_01_armed_F"];



if (PARAMS_DEP_MARKERS == 1) then 
	{
		dep_zone_markers = ['roadpop'];
	} else {
		dep_zone_markers = [];
	};
dep_unit_init   = "[_this] execVM ""Server\Server_Scripts\unitinit.sqf""; ";

//if(PARAMS_DEPHeadless == 1 || PARAMS_DEPHeadless == 3) then {dep_useheadless = true} else {dep_useheadless = false};

if (PARAMS_DEP_CIV == 1) then { dep_civilians = true; };

dep_fail_civilians = PARAMS_MAX_DEP_KILLEDCIVS; 							// Number of civilian casualties before mission fail. Use 0 for infinite.

dep_civ_fail_script = "CIVILIANFAIL = true; publicVariable ""CIVILIANFAIL""; mps_mission_finished = ""true""; publicvariable ""mps_mission_finished"";";

if (PARAMS_DEP_BUNKERS >= 0) then
{
    dep_bunkers = PARAMS_DEP_BUNKERS;
};

if (PARAMS_DEP_PATROLS >= 0) then
{
    dep_patrols = PARAMS_DEP_PATROLS;
};

// *************************************************************
// Change the following settings to use different enemy classes
// *************************************************************
if (PARAMS_DEP_UNITS == 1) then {
		// Military forces
		// ***************
		// Soldier
		 dep_u_soldier       = "TBan_Fighter2";
		// Grenade launcher
		 dep_u_gl            = "TBan_Fighter3";
		// Assault rifle
		 dep_u_ar            = "TBan_Fighter4";
		// Anti tank
		 dep_u_at            = "TBan_Fighter5";
		// Medic
		 dep_u_medic         = "TBan_Fighter6";
		// Anti air
		 dep_u_aa            = "TBan_Fighter6NH";
		// Assistant anti air
		 dep_u_aaa           = "TBan_Fighter2NH";
		// Squad leader
		 dep_u_sl            = "TBan_Fighter1";
		// Marksman
		dep_u_marksman      = "TBan_Fighter3NH";
		// Sniper
		 dep_u_sniper        = "TBan_Fighter3NH";
		// Crew
		 dep_u_veh_crew		 = "sub_ins_me_crew";


		// Guerilla forces
		// ***************
		// Soldier
		 dep_u_g_soldier     = "TBan_Fighter2";
		// Grenade launcher
		 dep_u_g_gl          = "TBan_Fighter3";
		// Assault rifle
		 dep_u_g_ar          = "TBan_Fighter4";
		// Anti tank
		 dep_u_g_at          = "TBan_Fighter5";
		// Medic
		 dep_u_g_medic       = "TBan_Fighter6";
		// Squad leader
		 dep_u_g_sl          = "TBan_Fighter1";
		// Marksman
		 dep_u_g_marksman    = "TBan_Fighter3NH";
		 //////////////////////////////////////////////////////////////////////////////////////////
		 dep_civ_veh = [
			"sub_ins_me_van",
			"sub_ins_me_offroad",
			"sub_ins_me_offroad_armed",
			"sub_ins_me_offroad_repair"
		];
		 dep_ground_vehicles = [
			"sub_ins_me_btr60",
			"sub_ins_me_offroad_armed"
			//"sub_ins_me_zsu"
		 ];
 };
 
if (PARAMS_DEP_UNITS == 2) then {
			 // Military forces
			// ***************

			// Soldier
			 dep_u_soldier       = "rhs_vdv_mflora_rifleman";

			// Grenade launcher
			 dep_u_gl            = "rhs_vdv_mflora_grenadier";

			// Assault rifle
			 dep_u_ar            = "rhs_vdv_mflora_machinegunner";

			// Anti tank
			 dep_u_at            = "rhs_vdv_mflora_at";

			// Medic
			 dep_u_medic         = "rhs_vdv_mflora_medic";

			// Anti air
			 dep_u_aa            = "rhs_vdv_mflora_aa";

			// Assistant anti air
			 dep_u_aaa           = "rhs_vdv_mflora_RShG2";

			// Squad leader
			 dep_u_sl            = "rhs_vdv_mflora_sergeant";

			// Marksman
			 dep_u_marksman      = "rhs_vdv_mflora_marksman";

			// Sniper
			 dep_u_sniper        = "rhs_msv_emr_marksman";
			 
			 dep_u_veh_crew		 = "rhs_vdv_mflora_crew";


			// Guerilla forces
			// ***************

			// Soldier
			 dep_u_g_soldier     = "rhs_msv_rifleman";

			// Grenade launcher
			 dep_u_g_gl          = "rhs_msv_grenadier";

			// Assault rifle
			 dep_u_g_ar          = "rhs_msv_machinegunner";

			// Anti tank
			 dep_u_g_at          = "rhs_msv_at";

			// Medic
			 dep_u_g_medic       = "rhs_msv_medic";

			// Squad leader
			 dep_u_g_sl          = "rhs_msv_sergeant";

			// Marksman
			 dep_u_g_marksman    = "rhs_msv_marksman";
			 
			 dep_civ_veh = [
				"RHS_UAZ_MSV_01", 
				"rhs_uaz_open_MSV_01",
				"rhs_gaz66_msv",
				"rhs_gaz66_flat_msv",
				"rhs_gaz66o_msv"
			];
			 
			 dep_ground_vehicles = [
				"RHS_UAZ_MSV_01", 
				"rhs_uaz_open_MSV_01",

				"rhs_btr60_msv",
				"rhs_btr70_msv",
				"rhs_btr80_msv",

				"rhs_tigr_msv",
				"rhs_tigr_3camo_msv",
				"rhs_tigr_ffv_3camo_msv",
				"rhs_tigr_ffv_msv",

				"RHS_Ural_MSV_01",
				"RHS_Ural_Open_Flat_MSV_01",
				"RHS_Ural_Open_Flat_MSV_01",

				"rhs_gaz66_msv",
				"rhs_gaz66_flat_msv",
				"rhs_gaz66o_msv"
			 ];
};

    if (PARAMS_DEP_UNITS == 3) then {
                             // Military forces
                            // ***************
     
                            // Soldier
                             dep_u_soldier       = "sub_ins_me_rifleman";
     
                            // Grenade launcher
                             dep_u_gl            = "sub_ins_me_gl";
     
                            // Assault rifle
                             dep_u_ar            = "sub_ins_me_mg";
     
                            // Anti tank
                             dep_u_at            = "sub_ins_me_lat";
     
                            // Medic
                             dep_u_medic         = "sub_ins_me_medic";
     
                            // Anti air
                             dep_u_aa            = "sub_ins_me_aa";
     
                            // Assistant anti air
                             dep_u_aaa           = "sub_ins_me_ammo";
     
                            // Squad leader
                             dep_u_sl            = "sub_ins_me_sl";
     
                            // Marksman
                             dep_u_marksman      = "sub_ins_me_sniper";
     
                            // Sniper
                             dep_u_sniper        = "sub_ins_me_sniper";
                             
                             dep_u_veh_crew          = "sub_ins_me_crew";
     
     
                            // Guerilla forces
                            // ***************
     
                            // Soldier
                             dep_u_g_soldier     = "sub_ins_me_rifleman";
     
                            // Grenade launcher
                             dep_u_g_gl          = "sub_ins_me_gl";
     
                            // Assault rifle
                             dep_u_g_ar          = "sub_ins_me_mg";
     
                            // Anti tank
                             dep_u_g_at          = "sub_ins_me_lat";
     
                            // Medic
                             dep_u_g_medic       = "sub_ins_me_medic";
     
                            // Squad leader
                             dep_u_g_sl          = "sub_ins_me_sl";
     
                            // Marksman
                             dep_u_g_marksman    = "sub_ins_me_sniper";
							 
								 dep_civ_veh = [
									"sub_ins_me_van",
									"sub_ins_me_offroad",
									"sub_ins_me_offroad_armed",
									"sub_ins_me_offroad_repair"
								];
								 dep_ground_vehicles = [
									"sub_ins_me_btr60",
									"sub_ins_me_offroad_armed"
									//"sub_ins_me_zsu"
								 ];
    };
