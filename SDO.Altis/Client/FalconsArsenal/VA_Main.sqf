if (isServer) exitwith {diag_log "***I was kicked from VA_MAIN.sqf";};
if (isNil "PARAMS_ALLOW_BIS")  then  { waitUntil{!isNil "PARAMS_ALLOW_BIS"};};
diag_log "***READING VA_MAIN.SQF ****====////";

_target = sideUnknown;
_restrictionDistance = 0;
/////////////////////////////////////////////////////////////////  _specNames _specSlots _specTypes ... all must have the same amounts
_specNames = 
["Grenadier", "Autorifleman", "AT Specialist", "Medic", "EOD", "PilotCrewmen","RTO","Rifelman","Commander","SquadLead","TeamLead","ReconTL","Marksman","Recon","JTAC","RconMedic","UAVOperator","RconExp"];
/////////////////////////////////////////////////////////////////
_specSlots = 
[
-1,
-1,
-1,
-1,
-1,
-1, 
-1, 
-1,
-1, 
-1, 
-1,
-1, 
-1, 
-1, 
-1,
-1,
-1,
-1
];
///////////////////////////////////////////////////////////////// 
_specTypes = 
[
	["B_Soldier_GL_F"],
	["B_soldier_AR_F"],
	["B_soldier_LAT_F","B_soldier_AT_F"],
	["B_medic_F"],
	["B_soldier_exp_F"],
	["B_Helipilot_F","B_helicrew_F","B_Pilot_F","B_soldier_repair_F","B_engineer_F","B_crew_F"],
	["B_Soldier_A_F"],
	["B_Soldier_F"],
	["B_officer_F"],
	["B_Soldier_SL_F"],
	["B_Soldier_TL_F"],
	["B_recon_TL_F"],
	["B_recon_M_F","B_sniper_F"],
	["B_recon_F"],
	["B_recon_JTAC_F"],
	["B_recon_medic_F"],
	["B_soldier_UAV_F"],
	["B_recon_exp_F"]
];


GENERAL_GLOBAL = [];
Weapons_Standard = [];

GrenadierItems =  [];		
AutoriflemanItems =  [];
ATItems =  [];
MedicItems =  [];
EODItems =  [];
PilotItems =  [];
RTOItems =  [];
RifelmanItems =  [];
CommanderItems =  [];
SquadLeadItems =  [];
TeamLeadItems =  [];
ReconTLItems = [];
MarksmanItems =  [];
ReconItems =  [];
JTACItems =  [];
RconMedic =  [];
UAVItems =  [];
RconExp = [];


DangerAlowed = [];
AllowedItems = [];

/////////////////////////////////////////////////////////////////
if (PARAMS_ALLOW_BIS == 1) then
	{
		_VA_Bis_Script = execVM "Client\FalconsArsenal\VA_Bis.sqf";
		waitUntil{scriptDone _VA_Bis_Script}; 
	};

if (PARAMS_ALLOW_FAL == 1) then
	{
		_VA_Falcons_Script = execVM "Client\FalconsArsenal\VA_Fal.sqf";
		waitUntil{scriptDone _VA_Falcons_Script}; 
	};

if (PARAMS_ALLOW_ACE == 1) then
	{
		_VA_Ace_Script = execVM "Client\FalconsArsenal\VA_Ace.sqf";
		waitUntil{scriptDone _VA_Ace_Script}; 
	};

if (PARAMS_ALLOW_RHS == 1) then
	{
		_VA_Rhs_Script = execVM "Client\FalconsArsenal\VA_Rhs.sqf";
		waitUntil{scriptDone _VA_Rhs_Script}; 
	};

if (PARAMS_ALLOW_3CB == 1) then
	{
		_VA_3cb_Script = execVM "Client\FalconsArsenal\VA_3cb.sqf";
		waitUntil{scriptDone _VA_3cb_Script}; 
	};	
	//--- Items to always use
		_VA_GenericAlwaysuse_Script = execVM "Client\FalconsArsenal\VA_GenericAlwaysuse.sqf";
		waitUntil{scriptDone _VA_GenericAlwaysuse_Script}; 
		
	//--- Fal Uniforms
		_VA_FalUniforms_Script = execVM "Client\FalconsArsenal\VA_FalUniforms.sqf";
		waitUntil{scriptDone _VA_FalUniforms_Script}; 

if (PARAMS_SELECT_Launchers == 0) then
	{
			_VA_BisLaunchers_Script = execVM "Client\FalconsArsenal\VA_BisLaunchers.sqf";
		waitUntil{scriptDone _VA_BisLaunchers_Script}; 
		
			_VA_3cbLaunchers_Script = execVM "Client\FalconsArsenal\VA_3cbLaunchers.sqf";
		waitUntil{scriptDone _VA_3cbLaunchers_Script}; 
	};
	
if (PARAMS_SELECT_Launchers == 1) then
	{
			_VA_BisLaunchers_Script = execVM "Client\FalconsArsenal\VA_BisLaunchers.sqf";
		waitUntil{scriptDone _VA_BisLaunchers_Script}; 
	};

if (PARAMS_SELECT_Launchers == 2) then
	{
			_VA_3cbLaunchers_Script = execVM "Client\FalconsArsenal\VA_3cbLaunchers.sqf";
		waitUntil{scriptDone _VA_3cbLaunchers_Script}; 
	};
	
	// Find out which class the player is
_GrenadierItems_CLASS = ["B_Soldier_GL_F"]; 
_AutoriflemanItems_CLASS = ["B_soldier_AR_F"]; 
_ATItems_CLASS = ["B_soldier_LAT_F","B_soldier_AT_F"]; 
_MedicItems_CLASS = ["B_medic_F"];  
_EODItems_CLASS = ["B_soldier_exp_F"]; 
_PilotItems_CLASS = ["B_Helipilot_F","B_helicrew_F","B_Pilot_F","B_soldier_repair_F","B_engineer_F","B_crew_F"]; 
_RTOItems_CLASS = ["B_Soldier_A_F"]; 
_RifelmanItems_CLASS = ["B_Soldier_F"]; 
_CommanderItems_CLASS = ["B_officer_F"];
_SquadLeadItems_CLASS = ["B_Soldier_SL_F"];
_TeamLeadItems_CLASS = ["B_Soldier_TL_F"];
_ReconTeamLeadItems_CLASS =	["B_recon_TL_F"],
_MarksmanItems_CLASS = ["B_recon_M_F","B_sniper_F"];
_ReconItems_CLASS = ["B_recon_F"];
_JTACItems_CLASS = ["B_recon_JTAC_F"];
_RconMedic_CLASS = ["B_recon_medic_F"];
_UAVItems_CLASS = ["B_soldier_UAV_F"];
_RconExp_CLASS = ["B_recon_exp_F"];


AllowdExtrasATDanger = 
[
"launch_RPG32_F",
"launch_I_Titan_F",
"launch_O_Titan_F",
"launch_I_Titan_short_F",
"launch_O_Titan_short_F"
];

AllowdExtrasGLDanger = 
[
"arifle_Katiba_GL_F",
"arifle_Katiba_GL_ACO_F",
"arifle_Katiba_GL_ARCO_pointer_F",
"arifle_Katiba_GL_ACO_pointer_F",
"arifle_Mk20_GL_F",
"arifle_Mk20_GL_plain_F",
"arifle_Mk20_GL_MRCO_pointer_F",
"arifle_Mk20_GL_ACO_F",
"arifle_TRG21_GL_F",
"arifle_TRG21_GL_MRCO_F",
"arifle_TRG21_GL_ACO_pointer_F"
];

AllowdExtrasSniperDanger =
[
"srifle_DMR_01_DMS_BI_F",
"srifle_DMR_01_DMS_snds_BI_F",
"srifle_DMR_01_MRCO_F",
"srifle_DMR_01_DMS_snds_F",
"srifle_DMR_01_ARCO_F",
"srifle_DMR_01_F",
"srifle_DMR_01_SOS_F",
"srifle_DMR_01_ACO_F",
"srifle_DMR_01_DMS_F",
"srifle_GM6_F",
"srifle_GM6_SOS_F",
"srifle_GM6_camo_F",
"srifle_GM6_camo_SOS_F",
"srifle_GM6_camo_LRPS_F",
"srifle_DMR_04_F",
"srifle_DMR_04_Tan_F",
"srifle_DMR_04_ACO_F",
"srifle_DMR_04_MRCO_F",
"srifle_DMR_04_SOS_F",
"srifle_DMR_04_DMS_F",
"srifle_DMR_04_ARCO_F",
"srifle_DMR_04_NS_LP_F",
"srifle_DMR_05_blk_F",
"srifle_DMR_05_hex_F",
"srifle_DMR_05_tan_f",
"srifle_DMR_05_ACO_F",
"srifle_DMR_05_MRCO_F",
"srifle_DMR_05_SOS_F",
"srifle_DMR_05_DMS_F",
"srifle_DMR_05_KHS_LP_F",
"srifle_DMR_05_DMS_snds_F",
"srifle_DMR_05_ARCO_F"

];

AllowdExtrasMGDanger =
[
"LMG_Mk200_F",
"LMG_Mk200_MRCO_F",
"LMG_Mk200_pointer_F",
"LMG_Mk200_LP_BI_F",
"LMG_Mk200_BI_F",
"LMG_Zafir_F",
"LMG_Zafir_pointer_F",
"MMG_01_hex_ARCO_LP_F",
"MMG_01_hex_F",
"MMG_01_tan_F"
];

DangerAlowed = DangerAlowed + AllowdExtrasATDanger + AllowdExtrasGLDanger + AllowdExtrasSniperDanger + AllowdExtrasMGDanger;

// Set the allowed items for the player
if ((typeOf player) in _GrenadierItems_CLASS) 		then { AllowedItems = AllowedItems + GrenadierItems + AllowdExtrasGLDanger; }; 
if ((typeOf player) in _AutoriflemanItems_CLASS) 	then { AllowedItems = AllowedItems + AutoriflemanItems + AllowdExtrasMGDanger; }; 
if ((typeOf player) in _ATItems_CLASS) 				then { AllowedItems = AllowedItems + ATItems + AllowdExtrasATDanger; }; 
if ((typeOf player) in _MedicItems_CLASS) 			then { AllowedItems = AllowedItems + MedicItems; }; 
if ((typeOf player) in _EODItems_CLASS) 			then { AllowedItems = AllowedItems + EODItems; }; 
if ((typeOf player) in _PilotItems_CLASS) 			then { AllowedItems = AllowedItems + PilotItems; }; 
if ((typeOf player) in _RTOItems_CLASS) 			then { AllowedItems = AllowedItems + RTOItems; }; 
if ((typeOf player) in _RifelmanItems_CLASS) 		then { AllowedItems = AllowedItems + RifelmanItems; }; 
if ((typeOf player) in _CommanderItems_CLASS) 		then { AllowedItems = AllowedItems + CommanderItems; }; 
if ((typeOf player) in _SquadLeadItems_CLASS) 		then { AllowedItems = AllowedItems + SquadLeadItems; }; 
if ((typeOf player) in _TeamLeadItems_CLASS) 		then { AllowedItems = AllowedItems + TeamLeadItems; }; 
if ((typeOf player) in _ReconTeamLeadItems_CLASS)		then { AllowedItems = AllowedItems + ReconItems + TeamLeadItems; }; 
if ((typeOf player) in _MarksmanItems_CLASS) 		then { AllowedItems = AllowedItems + MarksmanItems + AllowdExtrasSniperDanger; }; 
if ((typeOf player) in _ReconItems_CLASS) 			then { AllowedItems = AllowedItems + ReconItems; }; 
if ((typeOf player) in _JTACItems_CLASS) 			then { AllowedItems = AllowedItems + JTACItems; };  
if ((typeOf player) in _RconMedic_CLASS) 			then { AllowedItems = AllowedItems + RconMedic; }; 
if ((typeOf player) in _UAVItems_CLASS) 			then { AllowedItems = AllowedItems + UAVItems; }; 
if ((typeOf player) in _RconExp_CLASS) 				then { AllowedItems = AllowedItems + RconExp; }; 


AllowdExtrasGeneric = 
[
"arifle_Katiba_C_F",
"arifle_Katiba_C_ACO_pointer_F",
"arifle_Katiba_C_ACO_F",
"arifle_Katiba_ACO_F",
"arifle_Katiba_ACO_pointer_F",
"arifle_Katiba_ARCO_F",
"arifle_Katiba_ARCO_pointer_F",
"arifle_Katiba_pointer_F",
"arifle_Katiba_F",
"arifle_Katiba_C_F",
"arifle_Mk20_F",
"arifle_Mk20C_F",
"arifle_Mk20C_ACO_F",
"arifle_Mk20_Holo_F",
"arifle_Mk20_ACO_F",
"arifle_Mk20_plain_F",
"arifle_Mk20C_plain_F",
"arifle_Mk20C_ACO_pointer_F",
"arifle_Mk20_pointer_F",
"arifle_Mk20_ACO_pointer_F",
"arifle_Mk20_MRCO_F",
"arifle_Mk20_MRCO_plain_F",
"arifle_Mk20_MRCO_pointer_F",
"arifle_TRG21_F",
"arifle_TRG20_F",
"arifle_TRG20_Holo_F",
"arifle_TRG20_ACO_pointer_F",
"arifle_TRG20_ACO_F",
"arifle_TRG20_ACO_Flash_F",
"arifle_TRG21_ARCO_pointer_F",
"arifle_TRG21_ACO_pointer_F",
"arifle_TRG21_MRCO_F",
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_02_F",
"hgun_Rook40_F",
"hgun_PDW2000_F",
"hgun_Pistol_Signal_F",
"hgun_PDW2000_F",
//--- Backpacks
"B_AssaultPack_khk",
"B_AssaultPack_dgtl",
"B_AssaultPack_rgr",
"B_AssaultPack_sgg",
"B_AssaultPack_blk",
"B_AssaultPack_cbr",
"B_AssaultPack_mcamo",
"B_Kitbag_mcamo",
"B_Kitbag_sgg",
"B_Kitbag_cbr",
"B_Bergen_sgg",
"B_Bergen_mcamo",
"B_Bergen_rgr",
"B_Bergen_blk",
"B_FieldPack_blk",
"B_FieldPack_ocamo",
"B_FieldPack_oucamo",
"B_FieldPack_cbr",
"B_Carryall_ocamo",
"B_Carryall_oucamo",
"B_Carryall_mcamo",
"B_Carryall_oli",
"B_Carryall_khk",
"B_Carryall_cbr",
"B_OutdoorPack_blk",
"B_OutdoorPack_tan",
"B_OutdoorPack_blu",
"B_HuntingBackpack"
];

AllowdExtrasItems = 
[
"optic_Aco_smg",
"optic_ACO_grn_smg",
"optic_Holosight_smg",
"optic_Yorris",
"optic_MRD",
"optic_Arco",
"optic_Hamr",
"optic_Aco",
"optic_ACO_grn",
"optic_Holosight",
"optic_MRCO",
"acc_flashlight",
"acc_pointer_IR",
"bipod_01_F_snd",
"bipod_01_F_blk",
"bipod_01_F_mtp",
"bipod_02_F_blk",
"bipod_02_F_tan",
"bipod_02_F_hex",
"bipod_03_F_blk"
];

AllowdExtrasAmmo = 
[
"RPG32_F",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"1Rnd_HE_Grenade_shell",
"UGL_FlareWhite_F",
"UGL_FlareGreen_F",
"UGL_FlareRed_F",
"UGL_FlareYellow_F",
"UGL_FlareCIR_F",
"1Rnd_Smoke_Grenade_shell",
"1Rnd_SmokeRed_Grenade_shell",
"1Rnd_SmokeGreen_Grenade_shell",
"1Rnd_SmokeYellow_Grenade_shell",
"1Rnd_SmokePurple_Grenade_shell",
"1Rnd_SmokeBlue_Grenade_shell",
"1Rnd_SmokeOrange_Grenade_shell",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"1Rnd_HE_Grenade_shell",
"UGL_FlareWhite_F",
"UGL_FlareGreen_F",
"UGL_FlareRed_F",
"UGL_FlareYellow_F",
"UGL_FlareCIR_F",
"1Rnd_Smoke_Grenade_shell",
"1Rnd_SmokeRed_Grenade_shell",
"1Rnd_SmokeGreen_Grenade_shell",
"1Rnd_SmokeYellow_Grenade_shell",
"1Rnd_SmokePurple_Grenade_shell",
"1Rnd_SmokeBlue_Grenade_shell",
"1Rnd_SmokeOrange_Grenade_shell",
"150Rnd_762x54_Box",
"150Rnd_762x54_Box_Tracer",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"1Rnd_HE_Grenade_shell",
"UGL_FlareWhite_F",
"UGL_FlareGreen_F",
"UGL_FlareRed_F",
"UGL_FlareYellow_F",
"UGL_FlareCIR_F",
"1Rnd_Smoke_Grenade_shell",
"1Rnd_SmokeRed_Grenade_shell",
"1Rnd_SmokeGreen_Grenade_shell",
"1Rnd_SmokeYellow_Grenade_shell",
"1Rnd_SmokePurple_Grenade_shell",
"1Rnd_SmokeBlue_Grenade_shell",
"1Rnd_SmokeOrange_Grenade_shell",
"150Rnd_93x64_Mag",
"10Rnd_93x64_DMR_05_Mag",
"10Rnd_127x54_Mag",
"10Rnd_762x54_Mag",
"5Rnd_127x108_Mag",
"5Rnd_127x108_APDS_Mag",
"200Rnd_65x39_cased_Box",
"200Rnd_65x39_cased_Box_Tracer"
];

AllowedItems = AllowedItems + AllowdExtrasItems;
AllowedItems = AllowedItems + AllowdExtrasAmmo;
AllowedItems = AllowedItems + AllowdExtrasGeneric;

VA_MAIN = true;
	
_specItems = [GrenadierItems,AutoriflemanItems,ATItems,MedicItems,EODItems,PilotItems,RTOItems,RifelmanItems,CommanderItems,SquadLeadItems,TeamLeadItems,ReconTLItems,MarksmanItems,ReconItems,JTACItems,RconMedic,UAVItems,RconExp];




//////////////////////////////////////////////////////////////////////////////////////////////

[_target, [_this select 0, _restrictionDistance, _specNames, _specSlots, _specTypes, _specItems]] spawn FalconsArsenal_fnc_executeLocalArsenal;

