//--- Edited for Zargabad
if (isServer) exitwith {diag_log "I was kicked from VA_FAL.sqf";};
diag_log "////====****READING VA_FAL.SQF ****====////";

/////////////////////////////////////////////////////////////////
				if(PARAMS_ALLOW_UNIFORM == 0) then 
					{		
					Falcons_Backpacks = 
						[
						"Falcons_Backpack_DPM",
						"Falcons_Backpack_Compact_DPM",
						"Falcons_Backpack_Kitbag_DPM",
						"Falcons_Backpack_Desert",
						"Falcons_Backpack_Compact_Desert",
						"Falcons_Backpack_Kitbag_Desert",
						"Falcons_Backpack_Dark",
						"Falcons_Backpack_Compact_Dark",
						"Falcons_Backpack_Kitbag_Dark",
						"Falcons_Backpack_URBAN",
						"Falcons_Backpack_Compact_URBAN",
						"Falcons_Backpack_Kitbag_URBAN"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 1) then 
					{
					Falcons_Backpacks = 
						[
						"Falcons_Backpack_DPM",
						"Falcons_Backpack_Compact_DPM",
						"Falcons_Backpack_Kitbag_DPM"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 2) then 
					{
					Falcons_Backpacks = 
						[
						"Falcons_Backpack_URBAN",
						"Falcons_Backpack_Compact_URBAN",
						"Falcons_Backpack_Kitbag_URBAN"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 3) then 
					{
					Falcons_Backpacks = 
						[
						"Falcons_Backpack_Dark",
						"Falcons_Backpack_Compact_Dark",
						"Falcons_Backpack_Kitbag_Dark"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 4) then 
					{
					Falcons_Backpacks = 
						[
						"Falcons_Backpack_Desert",
						"Falcons_Backpack_Compact_Desert",
						"Falcons_Backpack_Kitbag_Desert"
						];
					};

/////////////////////////////////////////////////////////////////
				if(PARAMS_ALLOW_UNIFORM == 0) then 
					{
					Falcons_Uniforms = 
						[
						"Falcons_CombatUniform_DPM",
						"Falcons_CombatUniform_DPM_tshirt",
						"Falcons_CombatUniform_DPM_vest",
						"Falcons_CombatUniform_Desert",
						"Falcons_CombatUniform_Desert_tshirt",
						"Falcons_CombatUniform_Desert_vest",
						"Falcons_CombatUniform_Dark",
						"Falcons_CombatUniform_Dark_tshirt",
						"Falcons_CombatUniform_Dark_vest",
						"Falcons_CombatUniform_URBAN",
						"Falcons_CombatUniform_URBAN_tshirt",
						"Falcons_CombatUniform_URBAN_vest"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 1) then 
					{
					Falcons_Uniforms = 
						[
						"Falcons_CombatUniform_DPM",
						"Falcons_CombatUniform_DPM_tshirt",
						"Falcons_CombatUniform_DPM_vest"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 2) then 
					{
					Falcons_Uniforms = 
						[
						"Falcons_CombatUniform_URBAN",
						"Falcons_CombatUniform_URBAN_tshirt",
						"Falcons_CombatUniform_URBAN_vest"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 3) then 
					{
					Falcons_Uniforms = 
						[
						"Falcons_CombatUniform_Dark",
						"Falcons_CombatUniform_Dark_tshirt",
						"Falcons_CombatUniform_Dark_vest"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 4) then 
					{
					Falcons_Uniforms = 
						[
						"Falcons_CombatUniform_Desert",
						"Falcons_CombatUniform_Desert_tshirt",
						"Falcons_CombatUniform_Desert_vest"
						];
					};
/////////////////////////////////////////////////////////////////

				if(PARAMS_ALLOW_UNIFORM == 0) then 
					{
					Falcons_Vests = 
						[
						"Falcons_DPM_Plate_Carrier",
						"Falcons_DPM_Plate_Carrier_H",
						"Falcons_DPM_PlateCarrier_1",
						"Falcons_DPM_PlateCarrier_2",
						"Falcons_Desert_Plate_Carrier",
						"Falcons_Desert_Plate_Carrier_H",
						"Falcons_Desert_PlateCarrier_1",
						"Falcons_Desert_PlateCarrier_2",
						"Falcons_URBAN_Plate_Carrier",
						"Falcons_URBAN_Plate_Carrier_H",
						"Falcons_URBAN_PlateCarrier_1",
						"Falcons_URBAN_PlateCarrier_2",
						"Falcons_Dark_Plate_Carrier",
						"Falcons_Dark_Plate_Carrier_H",
						"Falcons_Dark_PlateCarrier_1",
						"Falcons_Dark_PlateCarrier_2"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 1) then 
					{
						Falcons_Vests = 
							[
						"Falcons_DPM_Plate_Carrier",
						"Falcons_DPM_Plate_Carrier_H",
						"Falcons_DPM_PlateCarrier_1",
						"Falcons_DPM_PlateCarrier_2"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 2) then 
					{
						Falcons_Vests = 
							[
						"Falcons_URBAN_Plate_Carrier",
						"Falcons_URBAN_Plate_Carrier_H",
						"Falcons_URBAN_PlateCarrier_1",
						"Falcons_URBAN_PlateCarrier_2"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 3) then 
					{
						Falcons_Vests = 
							[
						"Falcons_Dark_Plate_Carrier",
						"Falcons_Dark_Plate_Carrier_H",
						"Falcons_Dark_PlateCarrier_1",
						"Falcons_Dark_PlateCarrier_2"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 4) then 
					{
						Falcons_Vests = 
							[
						"Falcons_Desert_Plate_Carrier",
						"Falcons_Desert_Plate_Carrier_H",
						"Falcons_Desert_PlateCarrier_1",
						"Falcons_Desert_PlateCarrier_2"
						];
					};
					
/////////////////////////////////////////////////////////////////

				if(PARAMS_ALLOW_UNIFORM == 0) then 
					{
					Falcons_Helmets = 
						[
						"Falcons_Helmet_Wood",
						"Falcons_Helmet_simple_wood",
						"Falcons_Helmet_Light_wood",
						"Falcons_Helmet_Cammo_Wood",
						
						"Falcons_Helmet_Desert",
						"Falcons_Helmet_simple_Desert",
						"Falcons_Helmet_Light_Desert",
						"Falcons_Helmet_Cammo_Desert",
						
						"Falcons_Helmet_urban",
						"Falcons_Helmet_simple_urban",
						"Falcons_Helmet_Light_urban",
						"Falcons_Helmet_Cammo_Urban",
						
						"Falcons_Helmet_Dark",
						"Falcons_Helmet_simple_Dark",
						"Falcons_Helmet_Light_Dark",
						"Falcons_Helmet_Cammo_Dark"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 1) then 
					{
					Falcons_Helmets = 
						[
						"Falcons_Helmet_Wood",
						"Falcons_Helmet_simple_wood",
						"Falcons_Helmet_Light_wood",
						"Falcons_Helmet_Cammo_Wood"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 2) then 
					{
					Falcons_Helmets = 
						[
						"Falcons_Helmet_urban",
						"Falcons_Helmet_simple_urban",
						"Falcons_Helmet_Light_urban",
						"Falcons_Helmet_Cammo_Urban"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 3) then 
					{
					Falcons_Helmets = 
						[
						"Falcons_Helmet_Dark",
						"Falcons_Helmet_simple_Dark",
						"Falcons_Helmet_Light_Dark",
						"Falcons_Helmet_Cammo_Dark"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 4) then 
					{
					Falcons_Helmets = 
						[
						"Falcons_Helmet_Desert",
						"Falcons_Helmet_simple_Desert",
						"Falcons_Helmet_Light_Desert",
						"Falcons_Helmet_Cammo_Desert"
						];
					};
					
/////////////////////////////////////////////////////////////////

				if(PARAMS_ALLOW_UNIFORM == 0) then 
					{	
					Falcons_Hats_Glasses_Masks = 
						[
						"Falcons_Cap_headphones",
						"Falcons_Woolhat_Black",
						"Falcons_Woolhat_Blue",
						"Falcons_Woolhat_Brown",
						"Falcons_Woolhat_Green",
						"Falcons_Woolhat_Red",
						"Falcons_bandana_Skull",
						"Falcons_bandana_Skull2",
						"Falcons_Beret_Green",
						"Falcons_bandana_Desert",
						"Falcons_bandana_Dark",
						"Falcons_bandana_Wood",
						"Falcons_bandana_Urban"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 1) then 
					{
					Falcons_Hats_Glasses_Masks = 
						[
						"Falcons_Cap_headphones",
						"Falcons_Woolhat_Black",
						"Falcons_Woolhat_Blue",
						"Falcons_Woolhat_Brown",
						"Falcons_Woolhat_Green",
						"Falcons_Woolhat_Red",
						"Falcons_bandana_Skull",
						"Falcons_bandana_Skull2",
						"Falcons_Beret_Green",
						"Falcons_bandana_Wood"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 2) then 
					{
					Falcons_Hats_Glasses_Masks = 
						[
						"Falcons_Cap_headphones",
						"Falcons_Woolhat_Black",
						"Falcons_Woolhat_Blue",
						"Falcons_Woolhat_Brown",
						"Falcons_Woolhat_Green",
						"Falcons_Woolhat_Red",
						"Falcons_bandana_Skull",
						"Falcons_bandana_Skull2",
						"Falcons_Beret_Green",
						"Falcons_bandana_Urban"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 3) then 
					{
					Falcons_Hats_Glasses_Masks = 
						[
						"Falcons_Cap_headphones",
						"Falcons_Woolhat_Black",
						"Falcons_Woolhat_Blue",
						"Falcons_Woolhat_Brown",
						"Falcons_Woolhat_Green",
						"Falcons_Woolhat_Red",
						"Falcons_bandana_Skull",
						"Falcons_bandana_Skull2",
						"Falcons_Beret_Green",
						"Falcons_bandana_Dark"
						];
					};
				if(PARAMS_ALLOW_UNIFORM == 4) then 
					{
					Falcons_Hats_Glasses_Masks = 
						[
						"Falcons_Cap_headphones",
						"Falcons_Woolhat_Black",
						"Falcons_Woolhat_Blue",
						"Falcons_Woolhat_Brown",
						"Falcons_Woolhat_Green",
						"Falcons_Woolhat_Red",
						"Falcons_bandana_Skull",
						"Falcons_bandana_Skull2",
						"Falcons_Beret_Green",
						"Falcons_bandana_Desert"
						];
					};

		//-- generic items for all recon
		if(PARAMS_ALLOW_UNIFORM == 0) then 
			{	
			All_ReconItems =
				[	
				"Falcons_DPM_booniehat",
				"Falcons_Urban_booniehat",
				"Falcons_Dark_booniehat",
				"Falcons_Desert_booniehat",
				"Falcons_Folded_boonie"
					];
			};
		if(PARAMS_ALLOW_UNIFORM == 1) then 
				{
			All_ReconItems = 
				[	
				"Falcons_DPM_booniehat",
				"Falcons_Folded_boonie"
					];
				};
			if(PARAMS_ALLOW_UNIFORM == 2) then 
				{
			All_ReconItems =
				[	
				"Falcons_Urban_booniehat",
				"Falcons_Folded_boonie"
					];
				};
			if(PARAMS_ALLOW_UNIFORM == 3) then 
				{
			All_ReconItems =
				[	
				"Falcons_Dark_booniehat",
				"Falcons_Folded_boonie"
					];
				};
			if(PARAMS_ALLOW_UNIFORM == 4) then 
				{
			All_ReconItems =
				[	
				"Falcons_Desert_booniehat",
				"Falcons_Folded_boonie"
					];
				};
				
/////////////////////////////////////////////////////////////////	

GENERAL_GLOBAL = GENERAL_GLOBAL  + Falcons_Hats_Glasses_Masks + Falcons_Helmets + Falcons_Vests + Falcons_Uniforms + Falcons_Backpacks;

/////////////////////////////////////////////////////////////////
GrenadierItems = GrenadierItems +
	[
	] + GENERAL_GLOBAL;
	
/////////////////////////////////////////////////////////////////			
AutoriflemanItems =  AutoriflemanItems + 
	[
	
	] + GENERAL_GLOBAL;

/////////////////////////////////////////////////////////////////
ATItems = ATItems+
	[

	] + GENERAL_GLOBAL;

/////////////////////////////////////////////////////////////////

		if(PARAMS_ALLOW_UNIFORM == 0) then 
			{	
			MedicItems = MedicItems+
				[
				"Falcons_Backpack_URBAN_Medic",
				"Falcons_Backpack_Dark_Medic",
				"Falcons_Backpack_Desert_Medic",
				"Falcons_Backpack_DPM_Medic",
				
				"Falcons_Helmet_Desert_medic",
				"Falcons_Helmet_Dark_medic",
				"Falcons_Helmet_Urban_medic",
				"Falcons_Helmet_Wood_medic",
				
				"Falcons_DPM_booniehat_Medic",
				"Falcons_Urban_booniehat_Medic",
				"Falcons_Dark_booniehat_Medic",
				"Falcons_Desert_booniehat_Medic"
				] + GENERAL_GLOBAL;
			};
		if(PARAMS_ALLOW_UNIFORM == 1) then 
				{
				MedicItems = MedicItems+
					[
						"Falcons_Backpack_DPM_Medic",
						"Falcons_Helmet_Wood_medic",
						"Falcons_DPM_booniehat_Medic"
						] + GENERAL_GLOBAL;
				};
			if(PARAMS_ALLOW_UNIFORM == 2) then 
				{
				MedicItems = MedicItems+
					[
						"Falcons_Backpack_URBAN_Medic",
						"Falcons_Helmet_Urban_medic",
						"Falcons_Urban_booniehat_Medic"
						] + GENERAL_GLOBAL;
				};
			if(PARAMS_ALLOW_UNIFORM == 3) then 
				{
				MedicItems = MedicItems+
					[
						"Falcons_Backpack_Dark_Medic",
						"Falcons_Helmet_Dark_medic",
						"Falcons_Dark_booniehat_Medic"
						] + GENERAL_GLOBAL;
				};
			if(PARAMS_ALLOW_UNIFORM == 4) then 
				{
				MedicItems = MedicItems+
					[
					"Falcons_Backpack_Desert_Medic",
					"Falcons_Helmet_Desert_medic",
					"Falcons_Desert_booniehat_Medic"
					] + GENERAL_GLOBAL;
				};
			

/////////////////////////////////////////////////////////////////
EODItems =EODItems+
	[
	] + GENERAL_GLOBAL;

/////////////////////////////////////////////////////////////////
PilotItems = PilotItems+
	[
	] + GENERAL_GLOBAL;
/////////////////////////////////////////////////////////////////
RTOItems = RTOItems+
	[
	
] + GENERAL_GLOBAL;
/////////////////////////////////////////////////////////////////
RifelmanItems = RifelmanItems+
	[	
	] + GENERAL_GLOBAL;

/////////////////////////////////////////////////////////////////
CommanderItems = CommanderItems+
	[
	"Falcons_Beret_Red"
	] + GENERAL_GLOBAL;

/////////////////////////////////////////////////////////////////
SquadLeadItems = SquadLeadItems+
	[
	"Falcons_Beret_Blue"
	] + GENERAL_GLOBAL;

/////////////////////////////////////////////////////////////////
TeamLeadItems = TeamLeadItems+
	[
	] + GENERAL_GLOBAL;
	
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
ReconTLItems = ReconTLItems+
	[	
	
	] + GENERAL_GLOBAL+ All_ReconItems;
/////////////////////////////////////////////////////////////////
MarksmanItems = MarksmanItems+
	[
	] + GENERAL_GLOBAL+ All_ReconItems;

/////////////////////////////////////////////////////////////////
ReconItems = ReconItems+
	[	
	] + GENERAL_GLOBAL+ All_ReconItems;

/////////////////////////////////////////////////////////////////
JTACItems = JTACItems+
	[
	] + GENERAL_GLOBAL+ All_ReconItems;

/////////////////////////////////////////////////////////////////
RconMedic = RconMedic+
	[
	] + GENERAL_GLOBAL+ All_ReconItems + MedicItems;

/////////////////////////////////////////////////////////////////
UAVItems = UAVItems+
	[
	] + GENERAL_GLOBAL+ All_ReconItems;

/////////////////////////////////////////////////////////////////
RconExp = RconExp+
	[
	] + GENERAL_GLOBAL+ All_ReconItems;

