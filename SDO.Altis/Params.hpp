class Params
{
	class Space0
		{
			title = "                                                                    GAME  SETTINGS"; 
			values[]= {0}; 
			texts[]= {" "}; 
			default = 0;
		};
		
	class ticketLimit 
	{ 
	   title = "Tickets limit"; 
	   values[] = {1,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,200,300,400,500,600,700,800,900,99999}; 
	   texts[] = {"1","10","20","30","40","50","60","70","80","90","100","110","120","130","140","150","200","300","400","500","600","700","800","900","Off"}; 
	   default = 99999; 
	};  
		
	class AOTOGGLE
	{
		title = "AOs ON or OFF";
		values[] = {0,1};
		texts[] = {"Off","ON"};
		default = 1;
	};

class Daytime
	{
		title = "Time";
		texts[] = {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","0"};
		values[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,0};
		default = 5;
		function = "BIS_fnc_paramDaytime"; // (Optional) Function called when player joins, selected value is passed as an argument
 		isGlobal = 0; // (Optional) 1 to execute script / function locally for every player who joins, 0 to do it only on server
	};

	class AOENDCOUNT
	{
		title = "Amount of AO to complete";
		values[] = {41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0};
		texts[] = {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","All"};
		default = 0;
	};

	class EnemyLeftThreshhold
	{
		title = "Enemy Left Threshold (to complete an AO) ";
		values[] = {1,2,3,4,5,6,7,8,9,10};
		texts[] = {"1","2","3","4","5","6","7","8","9","10"};
		default = 4;
	};

	class AOSize
	{
		title = "Main AO Diameter";
		values[] = {500};
		texts[] = {"500m"};
		default = 500;
	};
	
	class STARTAODISTANCE
	{
		title = "How far to start search for an AO (will increase if none found)";
		values[] = {1000,2000,3000,4000,5000,6000,7000,8000,9000,10000,18000};
		texts[] = {"1000","2000","3000","4000","5000","6000","7000","8000","9000","10000","18000"};
		default = 4000;
	};
	
	class Space0POINT1
	{
		title = "                                                                              ALLOWED GEAR WEAPONS and UNIFORMS"; 
		values[]= {0}; 
		texts[]= {" "}; 
		default = 0;
	};
		
	class ALLOW_BIS
	{
		title = "Add BIS Weapons and Vests to the arsenal";
		values[] = {0,1};
		texts[] = {"No","Yes"};
		default = 1;
	};
	class SELECT_Launchers
	{
		title = "Choose Launchers for Arsenal";
		values[] = {0,1,2};
		texts[] = {"Both Bis and 3cb Launchers","Bis Launchers","3cb Launchers"};
		default = 0;
	};
	class ALLOW_ACE
	{
		title = "Add ACE Gear to the arsenal";
		values[] = {0,1};
		texts[] = {"No","Yes"};
		default = 1;
	};
	
	class ALLOW_FAL
	{
		title = "Add Falcons Weapons to the arsenal";
		values[] = {0,1};
		texts[] = {"No","Yes"};
		default = 1;
	};
	
	class ALLOW_RHS
	{
		title = "Add RHS Weapons to the arsenal";
		values[] = {0,1};
		texts[] = {"No","Yes"};
		default = 1;
	};
	
	class ALLOW_3CB
	{
		title = "Add 3CB Gear n Weapons to the arsenal";
		values[] = {0,1};
		texts[] = {"No","Yes"};
		default = 1;
	};
	
	class ALLOW_NVG
	{
		title = "Add NVGs to the arsenal";
		values[] = {0,1};
		texts[] = {"No","Yes"};
		default = 1;
	};
	class ALLOW_UNIFORM
	{
		title = "Type of Uniforms to Allow";
		values[] = {0,1,2,3,4};
		texts[] = {"ALL","Woodland","Urban","Dark","Desert"};
		default = 0;
	};
	class Space1
		{
			title = "                                                                   DYNAMIC ENEMY POPULATION"; 
			values[]= {0}; 
			texts[]= {" "}; 
			default = 0;
		};
        
    class DEP
	{
		title = "Dynamic Enemy Population";
		values[] = {1};
		texts[] = {"On"};
		default = 1;
	};
	class DEP_UNITS
	{
		title = "DEP Enemy Unit type to use";

		values[] = {0,1,2,3};
		texts[] = {"Default","Takistan", "RHS Russians","Middle East"};
		default = 0;
	};
    class DEP_DESPAWN
	{
		title = "DEP Location deactivate minutes";
		values[] = {2, 5, 10, 15, 20 , 30, 45, 60};
		texts[] = {"2", "5", "10", "15", "20", "30", "45", "60"};
		default = 10;
	};
    class DEP_AI_LOC
	{
		title = "DEP Max amount of AI per location";
		values[] = {8, 15, 20, 25};
		texts[] = {"8", "15", "20", "25"};
		default = 8;
	};
    class DEP_AI_TOT
	{
		title = "DEP Total amount of AI";
		values[] = {150, 200, 250, 300, 350, 400};
		texts[] = {"150", "200", "250", "300", "350", "400"};
		default = 200;
	};
    class DEP_ACTDIST
	{
		title = "DEP Location activation distance";
		values[] = {800, 1000, 1200, 1500, 2000};
		texts[] = {"800", "1000", "1200", "1500", "2000"};
		default = 1000;
	};
	class DEP_SAFERADIUS
    {
        title = "DEP Safe zone radius";
        values[] = {500, 600, 700, 800, 1000};
        texts[] = {"500", "600", "700", "800", "1000"};
        default = 1000;
    };
    class DEP_ROADPOP
	{
		title = "DEP Enemy Residential Spawn Locations";
		values[] = {1,100, 150, 200, 250, 300};
		texts[] = {"1","100", "150", "200", "250", "300"};
		default = 150;
	};
    class DEP_ROADBLK
	{
		title = "DEP Enemy roadblocks";
		values[] = {20, 40, 75};
		texts[] = {"20", "40", "75"};
		default = 20;
	};
    class DEP_AA
	{
		title = "DEP Enemy AA sites";
		values[] = {0, 5, 10, 20, 30, 40};
		texts[] = {"None", "5", "10", "20", "30", "40"};
		default = 20;
	};
	class DEP_BUNKERS
	{
		title = "DEP Enemy Camps";
		values[] = {0, 5, 10, 20, 30, 40, 50, 60};
		texts[] = {"none", "5", "10", "20", "30", "40", "50", "60"};
		default = 20;
	};
    class DEP_PATROLS
	{
		title = "DEP Enemy Patrols";
		values[] = {0, 5, 10, 20, 30, 40};
		texts[] = {"None", "5", "10", "20", "30", "40"};
		default = 20;
	};
    class DEP_CIV
	{
		title = "DEP Enable Civilians";
		values[] = {0, 1};
		texts[] = {"No", "Yes"};
		default = 0;
	};
	class MAX_DEP_KILLEDCIVS
	{
	title = "DEP Max Allowed Civilian Deaths";
	values[] = {1, 5, 10, 20, 30, 40};
	texts[] = {"1", "5", "10", "20", "30", "40"};
	default = 10;
	};
	class DEP_MARKERS
	{
		title = "DEP Enable Markers";
		values[] = {0, 1};
		texts[] = {"No", "Yes"};
		default = 0;
	};
	class DEP_VICTORY
	{
		title = "DEP Enable Victory via DEP locations (Residential)";
		values[] = {0, 1};
		texts[] = {"No", "Yes"};
		default = 0;
	};

	class Space1b
		{
			title = "                                                                   AO ENEMY SETTINGS"; 
			values[]= {0}; 
			texts[]= {" "}; 
			default = 0;
		};
	
class AO_UNITS
	{
		title = "AO Enemy Unit type to use";
		values[] = {0,1,2,3,4};
		texts[] = {"BIS","Sup Middle East","Sup African","Sup East European","Sup West European"};
		default = 0;
	};
	
	
	//def 4
	class SquadsPatrol
	{
		title = "Squads Patrolling AO";
		values[] = {0,1,2,3,4,5,6,7};
		texts[] = {0,1,2,3,4,5,6,7};
		default = 4;
	};
	
	//def 2
	class SquadsDefend
	{
		title = "Squads Defending AO";
		values[] = {0,1,2,3,4,5};
		texts[] = {0,1,2,3,4,5};
		default = 3;
	};
	
	//def 2
	class MidPatrol
	{
		title = "Mid Patrolling AO";
		values[] = {0,1,2,3,4,5};
		texts[] = {0,1,2,3,4,5};
		default = 3;
	};
	
	//def 1
	class TowerDefenders
	{
		title = "Max Tower Defender Teams";
		values[] = {2,3,4};
		texts[] = {1,2,3};
		default = 3;
	};
	//def 2
	class CarsPatrol
	{
		title = "Max Light Armour Patrolling AO";
		values[] = {0,1,2,3,4};
		texts[] = {0,1,2,3,4};
		default = 3;
	};
	// def 1
	class ArmourPatrol
	{
		title = "Max Heavy Armour Patrolling AO";
		values[] = {0,1,2,3};
		texts[] = {0,1,2,3};
		default = 2;
	};
	//def 5
	class CarsChance
	{
		title = "% Chance Of Light Armour AO";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 5;
	};
	//def 5
	class ArmourChance
	{
		title = "% Chance Of Heavy Armour AO";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 5;
	};
	//def 6
	class SniperChance
	{
		title = "% Chance Of Random amount of Snipers at AO";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 6;
	};
	//def 8
	class ExternChance
	{
		title = "% Chance Of Random amount of External Patrols at AO";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 6;
	};

	class Space2
		{
			title = "                                                                    REINF SETTINGS"; 
			values[]= {0}; 
			texts[]= {" "}; 
			default = 0;
		};

	class SAMCamps
	{
		title = "Amount of SAM camps on map";
		values[] = {-1,0,1,2,3,4,5};
		texts[] = {"random",0,1,2,3,4,5};
		default = -1;
	};
	//def5
	class RAMCamps
	{
		title = "Amount of camps at AO";
		values[] = {-1,0,1,2,3};
		texts[] = {"random","0","1","2","3"};
		default = -1;
	};
	//def5
	class Roadblocks
	{
		title = "Roadblocks at AO";
		values[] = {1,0};
		texts[] = {"Enabled","Disabled"};
		default = 1;
	};
	//def 3
	class HeavyReinforcement
	{
		title = "% Chance Of Heavy Reinforcements";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 6;
	};
	//def 3
	class AOReinforcement
	{
		title = "% Chance Of Light Reinforcements";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 6;
	};
	//def 3
	class ConvoyChance
	{
		title = "% Chance Of Convoys Moving to AO";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 3;
	};
	//def 0
	class AirPatrol
	{
		title = "% Chance Of Air Vehicles Patrolling AO";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 1;
	};
	//def 5
	class MortarChance
	{
		title = "% Chance Of Mortars at AO";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 1;
	};
	//def 5
	class INOUTMortarChance
	{
		title = "% Chance Mortars are Inside of AO";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,10,20,30,40,50,60,70,80,90,100};
		default = 5;
	};
	
	class Space3
		{
			title = "                                                                    DEBUG n HC SETTING"; 
			values[]= {0}; 
			texts[]= {" "}; 
			default = 0;
		};
		
	class DebugMode
	{
		title = "Enable Debug Mode";
		values[] = {1,0};
		texts[] = {"Enable","Disable"};
		default = 1;
	};

	class BaseSelector
	{
		title = "Starting Base";
		values[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,-1};
		texts[] = {"Terminal(Base)","Almyra(Base)","Molos Airfield(Base)","AAC Airfield(Base)","1891-0674(Base)","Chalkia Bay(Base)","Edessa(Base)","Stadium(Outpost)","The Hill(Outpost)","Cape of No hope(Outpost)","Beach(Outpost)","Lands End(Outpost)","Hawkland(Outpost)","SeaSide Paradise(Outpost)","Peninsular(Outpost)","Random"};
		default = -1;
	};
	class TOTALMAXAI
	{
		title = "Set the Total amount of AO (EAST) AI allowed";
		values[] = {100,110,120,130,140,150,160,170,180,190,200,250,300,400,500};
		texts[] = {100,110,120,130,140,150,160,170,180,190,200,250,300,400,500};
		default = 180;
	};
	
	class DEPHeadless
	{
		title = "AI to Transfer to HC";
		values[] = {0,1,2};
		texts[] = {"OFF","DEP","AO"};
		default = 0;
	};
	
	class Space4 {title = ""; values[]= {0}; texts[]= {" "}; default = 0; };
	class Space5 {title = ""; values[]= {0}; texts[]= {" "}; default = 0; };
	class Space6 {title = ""; values[]= {0}; texts[]= {" "}; default = 0; };
	class Space7 {title = ""; values[]= {0}; texts[]= {" "}; default = 0; };
};
