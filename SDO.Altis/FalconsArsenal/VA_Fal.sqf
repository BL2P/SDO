//--- Edited for Zargabad
if (isServer) exitwith {diag_log "I was kicked from VA_FAL.sqf";};
diag_log "////====****READING VA_FAL.SQF ****====////";

/////////////////////////////////////////////////////////////////

		Falcons_Weapons_Standard =
			[
				"Falcons_arifle_MXC_Wood_F",
				"Falcons_arifle_MX_Wood_F",
				"Falcons_arifle_MXM_Wood_F",
				"Falcons_arifle_MXC_Urban_F",
				"Falcons_arifle_MX_Urban_F",
				"Falcons_arifle_MXM_Urban_F"
			];
		Weapons_Standard = Weapons_Standard + Falcons_Weapons_Standard;
		
		Falcons_Weapons_GLs =
			[
				"Falcons_arifle_MX_GL_Urban_F",
				"Falcons_arifle_MX_GL_Wood_F"
			];
			
		Falcons_Weapons_ARs =
			[
				/*
				NOT WORKING
				"Falcons_arifle_MX_SW_Urban_F",
				"Falcons_arifle_MX_SW_Wood_F"
				*/
			];
			
		Falcons_Weapons_ATs =
			[
			];
			
		Falcons_Weapons_Snipers =
			[
			];
			
		Falcons_Weapons_LaserDes =
			[
			];
			
		Falcons_Weapons_Generic =
			[
			];

		Falcons_Ammunition = 
			[
			];

		Falcons_Explosives =
			[
			];

		Falcons_scopes = 
			[
			];	
			
		Falcons_Scopes_Sniper =
			[
			];
				
		Falcons_Silencers = 
			[
			];
				
/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////

		Falcons_Items_Generic = 
			[
			
			];

/////////////////////////////////////////////////////////////////					
			
		if (PARAMS_ALLOW_NVG == 1) then
			{
				Falcons_NVGs = 
					[
					];
				Falcons_Items_Generic = Falcons_Items_Generic + Falcons_NVGs;
			};

/////////////////////////////////////////////////////////////////	

GENERAL_GLOBAL = GENERAL_GLOBAL + Falcons_Items_Generic + Falcons_scopes  + Falcons_Ammunition + Falcons_Weapons_Generic;

/////////////////////////////////////////////////////////////////
GrenadierItems = GrenadierItems +
	[
	] + GENERAL_GLOBAL + Falcons_Weapons_GLs;
	
/////////////////////////////////////////////////////////////////			
AutoriflemanItems =  AutoriflemanItems + 
	[
	
	] + GENERAL_GLOBAL + Falcons_Weapons_ARs;

/////////////////////////////////////////////////////////////////
ATItems = ATItems+
	[

	] + GENERAL_GLOBAL + Falcons_Weapons_ATs + Falcons_Weapons_Standard;

/////////////////////////////////////////////////////////////////

MedicItems = MedicItems+
	[
	
	] + GENERAL_GLOBAL + Falcons_Weapons_Standard;

/////////////////////////////////////////////////////////////////
EODItems =EODItems+
	[
	] + GENERAL_GLOBAL + Falcons_Explosives + Falcons_Weapons_Standard;

/////////////////////////////////////////////////////////////////
PilotItems = PilotItems+
	[
	] + GENERAL_GLOBAL + Falcons_Weapons_Standard;
/////////////////////////////////////////////////////////////////
RTOItems = RTOItems+
	[
	
	] + GENERAL_GLOBAL + Falcons_Weapons_Standard;
/////////////////////////////////////////////////////////////////
RifelmanItems = RifelmanItems+
	[	
	] + GENERAL_GLOBAL + Falcons_Weapons_Standard;

/////////////////////////////////////////////////////////////////
CommanderItems = CommanderItems+
	[
	] + GENERAL_GLOBAL + Falcons_Weapons_Standard;

/////////////////////////////////////////////////////////////////
SquadLeadItems = SquadLeadItems+
	[
	] + GENERAL_GLOBAL + Falcons_Weapons_Standard;

/////////////////////////////////////////////////////////////////
TeamLeadItems = TeamLeadItems+
	[
	] + GENERAL_GLOBAL + Falcons_Weapons_GLs + Falcons_Weapons_Standard ;
	
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
ReconTLItems = ReconTLItems+
	[	
	
	] + GENERAL_GLOBAL + Falcons_Silencers + Falcons_Weapons_Standard ;
/////////////////////////////////////////////////////////////////
MarksmanItems = MarksmanItems+
	[
	] + GENERAL_GLOBAL + Falcons_Weapons_Snipers + Falcons_Silencers + Falcons_Scopes_Sniper;

/////////////////////////////////////////////////////////////////
ReconItems = ReconItems+
	[	
	] + GENERAL_GLOBAL + Falcons_Silencers + Falcons_Weapons_Standard;

/////////////////////////////////////////////////////////////////
JTACItems = JTACItems+
	[
	] + GENERAL_GLOBAL + Falcons_Silencers + Falcons_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconMedic = RconMedic+
	[
	] + GENERAL_GLOBAL + Falcons_Silencers + Falcons_Weapons_Standard ;

/////////////////////////////////////////////////////////////////
UAVItems = UAVItems+
	[
	] + GENERAL_GLOBAL + Falcons_Silencers  + Falcons_Weapons_Standard;

/////////////////////////////////////////////////////////////////
RconExp = RconExp+
	[
	] + GENERAL_GLOBAL + Falcons_Silencers + Falcons_Weapons_Standard + Falcons_Explosives;

