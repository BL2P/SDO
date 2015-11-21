if (isServer) exitwith {diag_log "I was kicked from VA_MAIN.sqf";};
if (isNil "PARAMS_ALLOW_BIS")  then  { waitUntil{!isNil "PARAMS_ALLOW_BIS"};};
diag_log "////====****READING VA_MAIN.SQF ****====////";

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
	["B_Helipilot_F","B_helicrew_F","B_Pilot_F","B_soldier_repair_F"],
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

AllowedItems = [];

/////////////////////////////////////////////////////////////////
if (PARAMS_ALLOW_BIS == 1) then
	{
		_VA_Bis_Script = execVM "FalconsArsenal\VA_Bis.sqf";
		waitUntil{scriptDone _VA_Bis_Script}; 
	};

if (PARAMS_ALLOW_FAL == 1) then
	{
		_VA_Falcons_Script = execVM "FalconsArsenal\VA_Fal.sqf";
		waitUntil{scriptDone _VA_Falcons_Script}; 
	};

if (PARAMS_ALLOW_ACE == 1) then
	{
		_VA_Ace_Script = execVM "FalconsArsenal\VA_Ace.sqf";
		waitUntil{scriptDone _VA_Ace_Script}; 
	};

if (PARAMS_ALLOW_RHS == 1) then
	{
		_VA_Rhs_Script = execVM "FalconsArsenal\VA_Rhs.sqf";
		waitUntil{scriptDone _VA_Rhs_Script}; 
	};

if (PARAMS_ALLOW_3CB == 1) then
	{
		_VA_3cb_Script = execVM "FalconsArsenal\VA_3cb.sqf";
		waitUntil{scriptDone _VA_3cb_Script}; 
	};	
	//--- Items to always use
		_VA_GenericAlwaysuse_Script = execVM "FalconsArsenal\VA_GenericAlwaysuse.sqf";
		waitUntil{scriptDone _VA_GenericAlwaysuse_Script}; 
		
	//--- Fal Uniforms
		_VA_FalUniforms_Script = execVM "FalconsArsenal\VA_FalUniforms.sqf";
		waitUntil{scriptDone _VA_FalUniforms_Script}; 

if (PARAMS_SELECT_Launchers == 0) then
	{
			_VA_BisLaunchers_Script = execVM "FalconsArsenal\VA_BisLaunchers.sqf";
		waitUntil{scriptDone _VA_BisLaunchers_Script}; 
		
			_VA_3cbLaunchers_Script = execVM "FalconsArsenal\VA_3cbLaunchers.sqf";
		waitUntil{scriptDone _VA_3cbLaunchers_Script}; 
	};
	
if (PARAMS_SELECT_Launchers == 1) then
	{
			_VA_BisLaunchers_Script = execVM "FalconsArsenal\VA_BisLaunchers.sqf";
		waitUntil{scriptDone _VA_BisLaunchers_Script}; 
	};

if (PARAMS_SELECT_Launchers == 2) then
	{
			_VA_3cbLaunchers_Script = execVM "FalconsArsenal\VA_3cbLaunchers.sqf";
		waitUntil{scriptDone _VA_3cbLaunchers_Script}; 
	};
	
	// Find out which class the player is
_GrenadierItems_CLASS = ["B_Soldier_GL_F"]; 
_AutoriflemanItems_CLASS = ["B_soldier_AR_F"]; 
_ATItems_CLASS = ["B_soldier_LAT_F","B_soldier_AT_F"]; 
_MedicItems_CLASS = ["B_medic_F"];  
_EODItems_CLASS = ["B_soldier_exp_F"]; 
_PilotItems_CLASS = ["B_Helipilot_F","B_helicrew_F","B_Pilot_F","B_soldier_repair_F"]; 
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


// Set the allowed items for the player
if ((typeOf player) in _GrenadierItems_CLASS) 		then { AllowedItems = AllowedItems + GrenadierItems; }; 
if ((typeOf player) in _AutoriflemanItems_CLASS) 	then { AllowedItems = AllowedItems + AutoriflemanItems; }; 
if ((typeOf player) in _ATItems_CLASS) 				then { AllowedItems = AllowedItems + ATItems; }; 
if ((typeOf player) in _MedicItems_CLASS) 			then { AllowedItems = AllowedItems + MedicItems; }; 
if ((typeOf player) in _EODItems_CLASS) 			then { AllowedItems = AllowedItems + EODItems; }; 
if ((typeOf player) in _PilotItems_CLASS) 			then { AllowedItems = AllowedItems + PilotItems; }; 
if ((typeOf player) in _RTOItems_CLASS) 			then { AllowedItems = AllowedItems + RTOItems; }; 
if ((typeOf player) in _RifelmanItems_CLASS) 		then { AllowedItems = AllowedItems + RifelmanItems; }; 
if ((typeOf player) in _CommanderItems_CLASS) 		then { AllowedItems = AllowedItems + CommanderItems; }; 
if ((typeOf player) in _SquadLeadItems_CLASS) 		then { AllowedItems = AllowedItems + SquadLeadItems; }; 
if ((typeOf player) in _TeamLeadItems_CLASS) 		then { AllowedItems = AllowedItems + TeamLeadItems; }; 
if ((typeOf player) in _ReconTeamLeadItems_CLASS)		then { AllowedItems = AllowedItems + ReconItems + TeamLeadItems; }; 
if ((typeOf player) in _MarksmanItems_CLASS) 		then { AllowedItems = AllowedItems + MarksmanItems; }; 
if ((typeOf player) in _ReconItems_CLASS) 			then { AllowedItems = AllowedItems + ReconItems; }; 
if ((typeOf player) in _JTACItems_CLASS) 			then { AllowedItems = AllowedItems + JTACItems; };  
if ((typeOf player) in _RconMedic_CLASS) 			then { AllowedItems = AllowedItems + RconMedic; }; 
if ((typeOf player) in _UAVItems_CLASS) 			then { AllowedItems = AllowedItems + UAVItems; }; 
if ((typeOf player) in _RconExp_CLASS) 				then { AllowedItems = AllowedItems + RconExp; }; 
	
VA_MAIN = true;
	
_specItems = [GrenadierItems,AutoriflemanItems,ATItems,MedicItems,EODItems,PilotItems,RTOItems,RifelmanItems,CommanderItems,SquadLeadItems,TeamLeadItems,ReconTLItems,MarksmanItems,ReconItems,JTACItems,RconMedic,UAVItems,RconExp];




//////////////////////////////////////////////////////////////////////////////////////////////

[_target, [_this select 0, _restrictionDistance, _specNames, _specSlots, _specTypes, _specItems]] spawn FalconsArsenal_fnc_executeLocalArsenal;

