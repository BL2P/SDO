//Script by Sa-Matra edit by bl1p
//--- bl1p notes players can board as back passengers then take control of the vehicle as driver maybe pilot also
if (isServer || isDedicated || !hasInterFace) exitWith {Diag_log "I was kicked from the drivercheck.sqf I am not a true client";};

true spawn 
{

	_layer = 85125; 
    
	//--- List of pilot classes, crewman classes, affected aircraft classes and affected vehicle classes
    _pilots = 
	[
	"B_Pilot_F",
	"B_Helipilot_F",
	"B_helicrew_F"
	];
	
	_pilotsChopper = 
	[
	"B_Pilot_F",
	"B_Helipilot_F",
	"B_helicrew_F"
	];
	
     _crewmen = 
	[
	"B_soldier_repair_F",
	"B_crew_F",
	"B_officer_F"
	];
	
	
RES_VVS_Air = ["RHS_Mi24_base","RHS_Mi24V_Base","RHS_Mi24P_VVS_Base","RHS_Mi24P_vvs","RHS_Mi24P_vvsc","RHS_Mi24P_CAS_VVS_Base","RHS_Mi24P_CAS_vvs","RHS_Mi24P_CAS_vvsc","RHS_Mi24P_CAS_vdv","RHS_Mi24P_AT_VVS_Base","RHS_Mi24P_AT_vvs","RHS_Mi24P_AT_vvsc","RHS_Mi24P_AT_vdv","RHS_Mi24P_vdv","RHS_Mi24V_VVS_Base","RHS_Mi24V_vvs","RHS_Mi24V_vvsc","RHS_Mi24V_FAB_VVS_Base","RHS_Mi24V_FAB_vvs","RHS_Mi24V_FAB_vvsc","RHS_Mi24V_FAB_vdv","RHS_Mi24V_UPK23_VVS_Base","RHS_Mi24V_UPK23_vvs","RHS_Mi24V_UPK23_vvsc","RHS_Mi24V_UPK23_vdv","RHS_Mi24V_AT_VVS_Base","RHS_Mi24V_AT_vvs","RHS_Mi24V_AT_vvsc","RHS_Mi24V_AT_vdv","RHS_Mi24Vt_vvs","RHS_Mi24V_vdv","RHS_Mi8_base","rhs_mi8mtv3_base","rhs_mi8amtsh_base","rhs_mi8amt_base","RHS_Mi8_VVS_Base","RHS_Mi8MTV3_VVS_Base","RHS_Mi8AMTSh_VVS_Base","RHS_Mi8AMT_VVS_Base","RHS_Mi8mt_vvs","RHS_Mi8mt_vvsc","RHS_Mi8mt_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_Cargo_vvs","RHS_Mi8mt_Cargo_vvsc","RHS_Mi8mt_Cargo_vdv","RHS_Mi8mt_Cargo_vv","RHS_Mi8MTV3_vvs","RHS_Mi8MTV3_vvsc","RHS_Mi8MTV3_vdv","RHS_Mi8MTV3_UPK23_vvs","RHS_Mi8MTV3_UPK23_vvsc","RHS_Mi8MTV3_UPK23_vdv","RHS_Mi8MTV3_FAB_vvs","RHS_Mi8MTV3_FAB_vvsc","RHS_Mi8MTV3_FAB_vdv","RHS_Mi8AMT_vvs","RHS_Mi8AMT_vvsc","RHS_Mi8AMT_vdv","RHS_Mi8AMTSh_vvs","RHS_Mi8AMTSh_vvsc","RHS_Mi8AMTSh_UPK23_vvs","RHS_Mi8AMTSh_UPK23_vvsc","RHS_Mi8AMTSh_FAB_vvs","RHS_Mi8AMTSh_FAB_vvsc","RHS_Ka52_base","RHS_Ka52Black_base","RHS_Ka52_vvsc","RHS_Ka52_vvs","RHS_Ka52_UPK23_vvs","RHS_Ka52_UPK23_vvsc","rhs_ka60_grey","rhs_ka60_c","RHS_Mi8amt_chdkz","RHS_AH64_base","RHS_AH64D","RHS_AH64DWreck","RHS_AH64D_GS","RHS_AH64D_CS","RHS_AH64D_wd","RHS_AH64D_wd_GS","RHS_AH64D_wd_CS","RHS_AH64D_AA","RHS_AH64D_wd_AA","RHS_AH64DGrey","RHS_AH1Z_base","RHS_AH1Z","RHS_AH1ZWreck","RHS_AH1Z_GS","RHS_AH1Z_CS","RHS_AH1Z_wd","RHS_AH1Z_wd_GS","RHS_AH1Z_wd_CS","RHS_CH_47F_base","RHS_CH_47F","RHS_CH_47F_10","RHS_CH_47F_light","RHS_UH60_Base","RHS_UH60M_base","RHS_UH60M_US_base","RHS_UH60M","RHS_UH60M_MEV","RHS_UH60M_d","RHS_UH60M_MEV_d","RHS_UH60M_MEV2","RHS_UH60M_MEV2_d","RHS_UH1_Base","RHS_UH1Y_base","RHS_UH1Y_US_base","RHS_UH1Y","RHS_UH1Y_d","RHS_UH1Y_FFAR","RHS_UH1Y_FFAR_d","RHS_UH1Y_UNARMED","RHS_UH1Y_UNARMED_d","RHS_su25_base","RHS_Su25_VVS_Base","RHS_Su25SM_vvs","RHS_Su25SM_KH29_vvs","RHS_Su25SM_vvsc","RHS_Su25SM_KH29_vvsc","RHS_C130J","RHS_A10","B_Heli_Light_01_armed_F","C_Heli_Light_01_civil_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_v2_F","B_Heli_Attack_01_F","O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","I_Heli_Transport_02_F","I_Heli_light_03_F","I_Heli_lig;ht_03_unarmed_F","B_Plane_CAS_01_F","O_Plane_CAS_02_F","I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_AA_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","bwi_a3_t6a","bwi_a3_t6a_1","bwi_a3_t6a_2","bwi_a3_t6a_3","bwi_a3_t6a_4","bwi_a3_t6a_5","bwi_a3_t6a_6","bwi_a3_t6a_7","bwi_a3_t6a_8","bwi_a3_t6a_9","bwi_a3_t6a_nta","bwi_a3_t6a_nta_1","bwi_a3_t6a_nta_2","bwi_a3_t6c","bwi_a3_at6b","bwi_a3_at6b_1","bwi_a3_at6b_2","PMC_MH9","rkb_flyingDisk_dark","sab_BI_An2","Sab_cz_An2","Sab_fd_An2","Sab_yel_An2","Sab_ana_An2","sab_AH_An2","sab_ca_An2","Sab_ee_An2","Sab_ru_An2","Sab_An2_b","Sab_An2_i","Sab_An2_o","Sab_tk_An2","Sab_af_An2","Sab_A2_An2","Sab_Snow_An2","Sab_Snow2_An2","Sab_Snow3_An2","Sab_sea_An2","Sab_sea2_An2","Sab_sea3_An2","Sab_sea4_An2","Sab_Amphi_An2","sab_C130_J","sab_C130_JT","sab_C130_JC","sab_C130_JE","sab_C130_JEC","sab_C130_H","sab_C130_HC","sab_C130_HE","sab_C130_HEC","sab_C130_FA","sab_C130_LC","sab_C130_LC_Ski","sab_C130_CG","sab_C130_CSP","sab_C130_FP","sab_C130_H_CSAT","sab_C130_H_CSAT2","sab_C130_H_CSAT3","sab_C130_H_AAF","sab_C130_H_AAF2","sab_C130_H_AAF3","sab_C130_J_FF","sab_C130_J_FF2","sab_L100_AL","RHS_Mi8amt_civilian","CDF_A3_Mi_24v","CDF_A3_Mi_24p","CDF_A3_Mi17","CDF_A3_Mi17_rockets","CDF_A3_Su25SM"];


RES_VVS_Armored = ["rhs_a3spruttank_base","rhs_sprut_vdv","rhs_a3t72tank_base","rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv","rhs_t72bd_tv","rhs_t90_tv","rhs_t90a_tv","rhs_tank_base","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80","rhs_t80a","rhs_t80u","rhs_t80u_test","rhs_t80uk","rhs_t80u45m","rhs_t80ue1","rhs_t80um","rhs_t72bb_chdkz","rhsusf_m1a1tank_base","rhsusf_m1a1aimwd_usarmy","rhsusf_m1a1aimd_usarmy","rhsusf_m1a1aim_tuski_wd","rhsusf_m1a1aim_tuski_d","rhsusf_m1a1fep_d","rhsusf_m1a1fep_wd","rhsusf_m1a1fep_od","rhsusf_m1a2tank_base","rhsusf_m1a2sep1d_usarmy","rhsusf_m1a2sep1wd_usarmy","rhsusf_m1a2sep1tuskid_usarmy","rhsusf_m1a2sep1tuskiwd_usarmy","rhsusf_m1a2sep1tuskiiwd_usarmy","rhsusf_m1a2sep1tuskiid_usarmy","B_MBT_01_cannon_F","BWA3_Leopard2A6M_Fleck","O_APC_Tracked_02_cannon_F","BWA3_Puma_Fleck","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_AA_F","O_APC_Tracked_02_AA_F","I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F","O_MBT_02_cannon_F","O_MBT_02_arty_F","B_APC_Wheeled_01_cannon_F","O_APC_Wheeled_02_rcws_F","B_MBT_01_TUSK_F","I_APC_Wheeled_03_cannon_F","CDF_A3_BMD2","CDF_A3_BTR70"];

RES_VVS_Support = ["rhs_btr_base","rhs_btr70_vmf","rhs_btr70_vdv","rhs_btr70_vv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80_vdv","rhs_btr80_vv","rhs_btr80_vmf","rhs_btr80a_msv","rhs_btr80a_vdv","rhs_btr80a_vv","rhs_btr80a_vmf","rhs_pts_base","rhs_pts_vmf","rhs_btr60_base","rhs_btr60_vmf","rhs_btr60_vdv","rhs_btr60_vv","rhs_btr60_msv","rhs_btr70_chdkz","rhs_btr60_chdkz","rhsusf_m113_usarmy","rhsusf_m113_usarmy_supply","rhsusf_m113_usarmy_unarmed","rhsusf_m113_usarmy_medical","rhsusf_m113_usarmy_M240","rhsusf_m113_usarmy_MK19","rhsusf_m113d_usarmy","rhsusf_m113d_usarmy_supply","rhsusf_m113d_usarmy_unarmed","rhsusf_m113d_usarmy_medical","rhsusf_m113d_usarmy_M240","rhsusf_m113d_usarmy_MK19","rhs_bmd_base","rhs_bmd2_base","rhs_bmd1_base","rhs_bmd1","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd1r","rhs_bmd2","rhs_bmd2m","rhs_bmd2k","rhs_bmp3tank_base","rhs_bmp3_msv","rhs_bmp3_late_msv","rhs_bmp3m_msv","rhs_bmp3mera_msv","rhs_bmp1tank_base","rhs_bmp_base","rhs_bmp1_vdv","rhs_bmp1_tv","rhs_bmp1_msv","rhs_bmp1_vmf","rhs_bmp1_vv","rhs_bmp1p_vdv","rhs_bmp1p_tv","rhs_bmp1p_msv","rhs_bmp1p_vmf","rhs_bmp1p_vv","rhs_bmp1k_vdv","rhs_bmp1k_tv","rhs_bmp1k_msv","rhs_bmp1k_vmf","rhs_bmp1k_vv","rhs_bmp1d_vdv","rhs_bmp1d_tv","rhs_bmp1d_msv","rhs_bmp1d_vmf","rhs_bmp1d_vv","rhs_prp3_vdv","rhs_prp3_tv","rhs_prp3_msv","rhs_prp3_vmf","rhs_prp3_vv","rhs_bmp2e_vdv","rhs_bmp2e_tv","rhs_bmp2e_msv","rhs_bmp2e_vmf","rhs_bmp2e_vv","rhs_bmp2_vdv","rhs_bmp2_tv","rhs_bmp2_msv","rhs_bmp2_vmf","rhs_bmp2_vv","rhs_bmp2k_vdv","rhs_bmp2k_tv","rhs_bmp2k_msv","rhs_bmp2k_vmf","rhs_bmp2k_vv","rhs_bmp2d_vdv","rhs_bmp2d_tv","rhs_bmp2d_msv","rhs_bmp2d_vmf","rhs_bmp2d_vv","rhs_brm1k_base","rhs_brm1k_vdv","rhs_brm1k_tv","rhs_brm1k_msv","rhs_brm1k_vmf","rhs_brm1k_vv","rhs_bmd4_vdv","rhs_bmd4m_vdv","rhs_bmd4ma_vdv","rhs_bmd2_chdkz","rhs_bmd1_chdkz","RHS_M2A2_Base","RHS_M2A2","RHS_M2A2_BUSKI","RHS_M2A3","RHS_M2A3_BUSKI","RHS_M2A3_BUSKIII","RHS_M2A3_BUSKIII_wd","RHS_M6","RHS_M2A2_wd","RHS_M2A2_BUSKI_WD","RHS_M2A3_BUSKI_wd","RHS_M2A3_wd","RHS_M6_wd","rhs_p37","rhs_prv13","rhs_2P3_1","rhs_2P3_2","rhs_v2","rhs_v3"];

	
    _aircraft = 
	[
	"B_Heli_Transport_03_F",
	"I_Heli_Transport_02_F",
	"O_Heli_Attack_02_black_F",
	"B_Heli_Light_01_armed_F",
	"O_Heli_Attack_02_F",
	"I_Plane_Fighter_03_AA_F",
	"I_Plane_Fighter_03_CAS_F"
	] + RES_VVS_Air;
	
	_aircraftNOPilot = 
	[
	"B_Heli_Light_01_F",
	"O_Heli_Light_02_F"
	];
	
	_aircraftLVL1 = 
	[
	"B_Heli_Attack_01_F",
	"B_Plane_CAS_01_F"
	] + RES_VVS_Air;
	
    _armor = 
	[
	"B_MBT_01_cannon_F",
	"B_MBT_01_TUSK_F",
	"B_APC_Tracked_01_rcws_F",
	"B_APC_Tracked_01_CRV_F",
	"B_APC_Tracked_01_AA_F",
	"B_APC_Wheeled_01_cannon_F"
	] + RES_VVS_Armored + RES_VVS_Support;
	
	_mortarDudes = 
	[

	];
	
	_mortarWeapons = 
	[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F"
	];

    //Wait until player is fully loaded
    waitUntil {player == player};

    //Check if player is pilot, chopper pilot or crewman, you can add more classes into arrays	
	_iampilotChop = ({typeOf player == _x} count _pilotsChopper) > 0;
    _iampilot = ({typeOf player == _x} count _pilots) > 0;
    _iamcrewman = ({typeOf player == _x} count _crewmen) > 0;
	_iamMortarDude = ({typeOf player == _x} count _mortarDudes) > 0;
	
	_role = [];

    //Never ending cycle
    while{true} do 
	{
        //If player is inside vehicle and not on foot and is pilot
		waituntil {vehicle player != player};
        if(vehicle player != player) then 
		{
            _veh = vehicle player;
            _role = (assignedVehicleRole player);
            
			//Pilot check
			if (typeOf _veh in _aircraft) then 
			{
			    _forbidden = [driver _veh] + [_veh turretUnit [0]];
                if (player in _forbidden && !(_iampilotChop)) then 
			   {
					systemChat format ["Sorry %1 Pilots only",name player];
                    player action ["getOut", _veh];
					_veh engineon false;
					sleep 1;
			   };
			};
			
			//Mortar check
			if (typeOf _veh in _mortarWeapons) then 
			{
			    _forbidden = [gunner _veh];
                if (player in _forbidden && !(_iamMortarDude)) then 
			   {
					systemChat format ["Sorry %1 Mortar is Restricted",name player];
                    player action ["getOut", _veh];
					sleep 1;
			   };
            };
			
			
			//-- friend and pilot check on CHOPPER
			if (typeOf _veh in _aircraftLVL1) then 
			{
               //_friend = player getVariable "friend";
			    _forbidden = [driver _veh] + [gunner _veh];
                if (player in _forbidden && !(_iampilotChop)) then 
			   {
					systemChat format ["Sorry %1 Pilots Only",name player];
                    player action ["getOut", _veh];
					_veh engineon false;
					sleep 1;
			   };
            };
			
			
			
            //Check if vehicle is armor and player is not crewman
            if (typeOf _veh in _armor) then  
			{
               // _friend = player getVariable "friend";
				_forbidden = [commander _veh] + [gunner _veh] + [driver _veh];
				//_forbidden = [commander _veh] + [gunner _veh] + [driver _veh] + [crew _veh];
                if (player in _forbidden && !(_iamcrewman)) then  
				{
                    systemChat format ["Sorry %1 Only LvL 1 Crew in the vehicle",name player];
                    player action ["getOut", _veh];
					_veh engineon false;
					sleep 1;
			    };
            };
			// /*
			///tick tock for enemy vehicle
			//_RestrictedEnemyVehicles = [];
			//_RestrictedEnemyVehicles  getVariable RestrictedEnemyVehicles;
			//if (DEBUG) then {diag_log format ["RestrictedEnemyVehicles = %1",RestrictedEnemyVehicles];};
			waituntil {!isNil "RestrictedEnemyVehicles";};
			if (typeOf _veh in RestrictedEnemyVehicles) then 
			{
				// _friend = player getVariable "friend";
				_forbidden = [commander _veh] + [gunner _veh] + [driver _veh] + [crew _veh];
				if (player in _forbidden) then  
				{
					
					_ticktock = 10;
					while {_ticktock > 0} do
					{
						_veh lock true;
						_veh setFuel 0;
						_layer cuttext [format ["TICK... %1",_ticktock],"PLAIN"];
						playsound3d ["A3\Sounds_f\sfx\Beep_Target.wss",_veh, true, getpos _veh, 1, 1, 0];
						sleep 1;
						_ticktock = _ticktock -1;
						if (_ticktock < 5) then 
						{
							player action ["getOut", _veh];
							//_veh engineon false;
						};
					};
					sleep 1;
					_veh setdamage 1;
				};
            };
			// */
        };
		waituntil {vehicle player == player || [_role, (assignedVehicleRole player)] call BIS_fnc_arrayCompare};
    };
};